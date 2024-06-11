package com.choikang.chukahaeyo.s3;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class S3Controller {

    @Autowired
    private S3Service s3Service;

    @GetMapping("/s3")
    public String s3Test() {
        return "/s3/s3Test";
    }

    @PostMapping("/upload")
    public void fileUpload(@RequestParam("file") MultipartFile file) {
        System.out.println("업로드된 파일 이름: " + file.getOriginalFilename());

        if (file.isEmpty()) {
            throw new CustomException(ErrorCode.VALIDATION_REQUEST_MISSING_EXCEPTION, "업로드 할 파일이 선택되지 않았습니다.");
        }

        try {
            String fileUrl = s3Service.saveFile(file);
            System.out.println("컨트롤러 fileUrl : " + fileUrl);

            if(s3Service == null){
                System.out.println("S3에서 받아온 주소 값이 null입니다.");
            }

            System.out.println(fileUrl);
        }catch(CustomException e){
           throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "S3 bucket에 사진을 저장하는 것을 실패했습니다.");
        }
    }
}
