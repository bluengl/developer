package com.ngl.project.proxy;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class ValidProxy {

    private static Log logger = LogFactory.getLog(ValidProxy.class);

    @Pointcut(value = "execution(* com.ngl.project.controller..*.*(..))")
    private void pointcut01() {}

    @Pointcut(value = "execution(* com.ngl.project.loginUser.dao..*.*(..))")
    private void pointcut02() {}

    @Around("ValidProxy.pointcut02()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        logger.info("前置增强");
        System.out.println(proceedingJoinPoint.toString());
        Object result = proceedingJoinPoint.proceed();
        logger.info("后置增强");
        return result;
    }
}
