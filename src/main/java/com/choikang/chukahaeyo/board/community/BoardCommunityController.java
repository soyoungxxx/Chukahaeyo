package com.choikang.chukahaeyo.board.community;

import com.choikang.chukahaeyo.board.model.CommunityVO;
import com.choikang.chukahaeyo.common.s3.S3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/board")
public class BoardCommunityController {

    @Autowired
    BoardCommunityService boardCommunityService;

    @Autowired
    WebApplicationContext context;

    @Autowired
    S3Service s3Service;

    @GetMapping("/service")
    public String serviceFaq() {
        return "board/service/faq";
    }

    @GetMapping("/community/list")
    public String communityList(@ModelAttribute CommunityVO vo, HttpServletRequest req) {
        req.setAttribute("map", boardCommunityService.getCommunityList(vo));
        return "board/comunityList";
    }

    @GetMapping("/community/mylist")
    public String communityMyList(@ModelAttribute CommunityVO vo, HttpServletRequest req, HttpSession session) {
        vo.setMemberID((int) session.getAttribute("memberID"));
        req.setAttribute("map", boardCommunityService.getCommunityMyList(vo));

        return "board/myCommunityList";
    }

    @GetMapping("/community/detail")
    public String communityDetail(CommunityVO vo, HttpServletRequest req, HttpSession session) {
        if (session.getAttribute("memberID") == null) {
            vo.setMemberID(0);
        } else {
            vo.setMemberID((int) session.getAttribute("memberID"));
        }
        if (session.getAttribute("memberName") == null) {
            vo.setMemberName("");
        } else {
            vo.setMemberName(String.valueOf(session.getAttribute("memberName")));
        }
        req.setAttribute("object", boardCommunityService.getCommunityDetail(vo));

        return "board/communityDetail";
    }

    @GetMapping("/community/write")
    public String communityWriteView(CommunityVO vo) throws UnsupportedEncodingException {
        return "board/communityPost";
    }

    @GetMapping("/community/update")
    public String communityUpdateView(CommunityVO vo, HttpServletRequest req, HttpSession session) throws UnsupportedEncodingException {
        if (session.getAttribute("memberID") == null) {
            vo.setMemberID(0);
        } else {
            vo.setMemberID((int) session.getAttribute("memberID"));
        }
        if (session.getAttribute("memberName") == null) {
            vo.setMemberName("");
        } else {
            vo.setMemberName(String.valueOf(session.getAttribute("memberName")));
        }
        req.setAttribute("object", boardCommunityService.getCommunityDetail(vo));

        return "board/communityUpdate";
    }

    @PostMapping("/community/update")
    public String communityUpdateAction(CommunityVO vo) throws UnsupportedEncodingException {
        boardCommunityService.updateCommunity(vo);
        return "redirect:detail?commID=" + vo.getCommID();
    }

    @PostMapping("/community/delete")
    public String communityDeleteAction(CommunityVO vo) throws UnsupportedEncodingException {
        boardCommunityService.deleteCommunity(vo);
        return "redirect:list";
    }

    @PostMapping("/community/write")
    public String communityWriteInsert(@ModelAttribute CommunityVO vo, HttpSession session) throws UnsupportedEncodingException {
        vo.setMemberID((int) session.getAttribute("memberID"));
        boardCommunityService.insertCommunity(vo);
        return "redirect:detail?commID=" + vo.getCommID() + "&ismy=" + vo.getIsmy();
    }

    @PostMapping(value = "/community/image-upload")
    // @RequestParam은 자바스크립트에서 설정한 이름과 반드시 같아야합니다.
    public ResponseEntity<?> imageUpload(@RequestParam("file") MultipartFile file) throws IllegalStateException {
        try {
            // 서버에 저장할 경로
            String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/images/upload");

            // 업로드 된 파일의 이름
            String originalFileName = file.getOriginalFilename();

            // 업로드 된 파일의 확장자
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

            // 업로드 될 파일의 이름 재설정 (중복 방지를 위해 UUID 사용)
            String uuidFileName = UUID.randomUUID().toString() + fileExtension;

            // 위에서 설정한 서버 경로에 이미지 저장
            file.transferTo(new File(uploadDirectory, uuidFileName));

            System.out.println("************************ 업로드 컨트롤러 실행 ************************");
            System.out.println(uploadDirectory);

            // Ajax에서 업로드 된 파일의 이름을 응답 받을 수 있도록 해줍니다.
            return ResponseEntity.ok(uuidFileName);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("이미지 업로드 실패");
        }
    }

    @PostMapping(value = "/community/image-delete")
    //@RequestParam은 자바스크립트에서 설정한 이름과 반드시 같아야 함
    public ResponseEntity<?> imageDelete(@RequestParam("file") String fileName) throws IllegalStateException, IOException {
        try {
            // 서버에 저장할 경로
            String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/images/upload");
            s3Service.deleteFile(fileName);
            // Ajax에서 업로드 된 파일의 이름을 응답 받을 수 있도록 해줍니다.
            return ResponseEntity.ok(uploadDirectory);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("이미지 업로드 실패");
        }
    }

    @ResponseBody
    @GetMapping("/community/heartred")
    public Map communityHeartred(CommunityVO vo, HttpSession session) {
        if (session.getAttribute("memberID") == null) {
            vo.setMemberID(0);
        } else {
            vo.setMemberID((int) session.getAttribute("memberID"));
        }
        Map<String, Object> map = new HashMap<>();
        map.put("isRed", boardCommunityService.deleteHeart(vo));
        map.put("boardLike", boardCommunityService.getLikeCount(vo));

        return map;
    }

    @ResponseBody
    @GetMapping("/community/heartblack")
    public Map communityHeartblack(CommunityVO vo, HttpSession session) {
        if (session.getAttribute("memberID") == null) {
            vo.setMemberID(0);
        } else {
            vo.setMemberID((int) session.getAttribute("memberID"));
        }
        Map<String, Object> map = new HashMap<>();
        map.put("isRed", boardCommunityService.insertHeart(vo));
        map.put("boardLike", boardCommunityService.getLikeCount(vo));

        return map;
    }
}