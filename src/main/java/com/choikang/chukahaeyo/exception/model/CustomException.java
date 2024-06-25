package com.choikang.chukahaeyo.exception.model;

import com.choikang.chukahaeyo.exception.ErrorCode;
import lombok.Getter;

@Getter
public class CustomException extends RuntimeException {
    private final ErrorCode errorCode;

    public CustomException(ErrorCode error, String message) {
        super(message);
        this.errorCode = error;
    }
}



