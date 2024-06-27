package com.choikang.chukahaeyo.common.s3;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;


@Service
@RequiredArgsConstructor
public class S3Service {
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    private final AmazonS3 amazonS3;

    // 파일 유효성 검사
    private String getFileExtension(String fileName) {
        if (fileName.length() == 0) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, ErrorCode.NOT_FOUND_IMAGE_EXCEPTION.getMessage());
        }
        ArrayList<String> fileValidate = new ArrayList<>();
        fileValidate.add(".jpg");
        fileValidate.add(".JPG");
        fileValidate.add(".jpeg");
        fileValidate.add(".JPEG");
        fileValidate.add(".png");
        fileValidate.add(".PNG");
        fileValidate.add(".webp");
        fileValidate.add(".WebP");
        fileValidate.add(".heif");
        fileValidate.add(".HEIF");
        fileValidate.add(".heic");
        fileValidate.add(".HEIC");
        fileValidate.add(".svg");
        fileValidate.add(".SVG");
        String idxFileName = fileName.substring(fileName.lastIndexOf("."));
        if (!fileValidate.contains(idxFileName)) {
            throw new CustomException(ErrorCode.VALIDATION_IMAGE_REQUEST_FAILED, ErrorCode.VALIDATION_IMAGE_REQUEST_FAILED.getMessage());
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    //파일을 S3 bucket에 업로드
    public String saveFile(MultipartFile file) {
        String fileName = createFileName(file.getOriginalFilename());
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(file.getSize());
        metadata.setContentType(file.getContentType());

        try {
            amazonS3.putObject(bucket, fileName, file.getInputStream(), metadata);
        } catch (SdkClientException e) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, "AWS SDK 클라이언트에서 문제가 발생하였습니다.");
        } catch (IOException e) {
            throw new CustomException(ErrorCode.NOT_FOUND_IMAGE_EXCEPTION, "AWS에서 파일 업로드 중 문제가 발생하였습니다.");
        }

        String S3Url = amazonS3.getUrl(bucket, fileName).toString();
        return S3Url; //S3에 저장된 URL을 갖고 오는 로직
    }

    //파일 이름 중복 방지를 위한 파일명 생성
    private String createFileName(String fileName) {
        return UUID.randomUUID().toString().concat(getFileExtension(fileName));
    }

    public void deleteFile(String fileName) {
        amazonS3.deleteObject(new DeleteObjectRequest(bucket, fileName));
    }
}