package com.choikang.chukahaeyo.exception;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;


@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public enum ErrorCode {

    /**
     * 400 BAD REQUEST
     */
    REQUEST_VALIDATION_EXCEPTION(HttpStatus.BAD_REQUEST, "잘못된 요청입니다"),
    VALIDATION_REQUEST_MISSING_EXCEPTION(HttpStatus.BAD_REQUEST, "요청값이 입력되지 않았습니다."),
    VALIDATION_REQUEST_HEADER_MISSING_EXCEPTION(HttpStatus.BAD_REQUEST, "요청 헤더값이 입력되지 않았습니다."),
    VALIDATION_REQUEST_PARAMETER_MISSING_EXCEPTION(HttpStatus.BAD_REQUEST, "요청 파라미터값이 입력되지 않았습니다."),
    REQUEST_METHOD_VALIDATION_EXCEPTION(HttpStatus.BAD_REQUEST, "요청 메소드가 잘못됐습니다."),
    VALIDATION_IMAGE_REQUEST_FAILED(HttpStatus.BAD_REQUEST, "지원하지 않는 이미지 파일 형식입니다"),

    /**
     * 404 NOT FOUND
     */
    NOT_FOUND_USER_EXCEPTION(HttpStatus.NOT_FOUND, "존재하지 않는 유저입니다."),
    NOT_FOUND_IMAGE_EXCEPTION(HttpStatus.NOT_FOUND, "존재하지 않는 이미지입니다."),

    /**
     * 401 UNAUTHORIZED
     */


    /**
     * 500 INTERNAL SERVER ERROR
     */
    INTERNAL_SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "내부 서버 오류가 발생했습니다."),



    /**
     * 505 HTTP VERSION NOT SUPPORTED
     */
    UNSUPPORTED_HTTP_ERROR(HttpStatus.HTTP_VERSION_NOT_SUPPORTED, "지원하지 않는 HTTP 버전입니다.")
    ;


    private final HttpStatus httpStatus;
    private final String message;

    public int getHttpStatusCode() {
        return httpStatus.value();
    }
}