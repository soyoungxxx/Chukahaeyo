package com.choikang.chukahaeyo.exception;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public enum SuccessCode {
    /**
     * 200 OK
     */
    GET_SUCCESS(HttpStatus.OK, "성공적으로 조회했습니다."),
    GET_ALL_GUESTBOOK_SUCCESS(HttpStatus.OK, "방명록 조회에 성공했습니다"),
    GET_USER_INFO_SUCCESS(HttpStatus.OK, "사용자 정보 조회에 성공했습니다"),
    UNLINK_SUCCESS(HttpStatus.NO_CONTENT, "사용자 탈퇴에 성공했습니다"),
    CREATE_SHORT_URL_SUCCESS(HttpStatus.CREATED, "단축 url 생성을 성공했습니다."),


    /**
     * 201 CREATED
     */
    LOGIN_SUCCESS(HttpStatus.OK, "로그인에 성공했습니다."),
    SIGNUP_SUCCESS(HttpStatus.CREATED, "회원가입이 완료됐습니다."),
    SIGNOUT_SUCCESS(HttpStatus.CREATED, "로그아웃이 완료됐습니다."),
    GUESTBOOK_CREATE_SUCCESS(HttpStatus.CREATED, "방명록을 성공적으로 등록하였습니다."),
    PAYMENT_SUCCESS(HttpStatus.OK, "결제를 성공했습니다.")
    ;


    private final HttpStatus httpStatus;
    private final String message;

    public int getHttpStatusCode() {
        return httpStatus.value();
    }
}