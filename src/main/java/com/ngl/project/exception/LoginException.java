package com.ngl.project.exception;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LoginException extends Exception {

    private static Log logger = LogFactory.getLog(LoginException.class);

    public LoginException() {
    }

    public LoginException(String message) {
        super(message);
        logger.warn(this.getMessage());
    }

    public LoginException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginException(Throwable cause) {
        super(cause);
    }

    public LoginException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
