package com.choikang.chukahaeyo.common;


public class Decode {
    public static String unicodeDecode(String uniCode) { //유니코드 -> 한글 변환
        StringBuffer sb = new StringBuffer(); //변환할 문자를 저장할 buffer

        for (int i = 0; i < uniCode.length(); i++) { //모든 글자 탐색
            if (uniCode.charAt(i) == '\\' && uniCode.charAt(i + 1) == 'u') {
                //16진수를 10진수로 변환
                String hexStr = uniCode.substring(i + 2, i + 6); //4자리의 숫자만 추출(16진수)
                int str10 = Integer.parseInt(hexStr, 16); //16진수를 10진수로 변환
                char charStr = (char) str10; //10진수를 단일문자로 변환
                sb.append(charStr);
                i += 5;
            }
        }
        return sb.toString();
    }
}

