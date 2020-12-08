package com.ngl.project.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

public class ProjectListener extends ContextLoaderListener {

    private static Log logger = LogFactory.getLog(ProjectListener.class);

    @Override
    public void contextInitialized(ServletContextEvent event) {
        logger.info("开始启动系统。。。");
        super.contextInitialized(event);
        logger.info("系统启动完成");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        logger.info("开始关闭系统。。。");
        super.contextDestroyed(event);
        logger.info("系统关闭完成");
    }


}
