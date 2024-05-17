package com.yojulab.study_springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.InquiryService;
import com.yojulab.study_springboot.service.NoticeService;


@Controller
public class MainController {
    @Value("${remote.server.url}")
    private String remoteServerUrl;

    @Autowired
    InquiryService inquiryService;

    @Autowired
    NoticeService noticeService;

    @GetMapping({ "/", "/home", "/main" })
    public ModelAndView main(ModelAndView modelAndView) {
        // 현재 사용자 Authentication 객체 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // 사용자가 인증되었는지 확인
        if (authentication.isAuthenticated()) {
            // Principal 객체에서 UserDetails 인터페이스를 구현한 사용자 정보 가져오기
            Object principal = authentication.getPrincipal();
            UserDetails userDetails = (principal instanceof UserDetails) ? (UserDetails) principal : null;

            if (userDetails != null) {
                // 사용자 이름 가져오기
                String username = userDetails.getUsername();
                // authorities에서 권한 정보 가져오기
                // StringBuilder authorities = new StringBuilder();
                // for (GrantedAuthority grantedAuthority : authentication.getAuthorities()) {
                // authorities.append(grantedAuthority.getAuthority()).append(", ");
                // }
                String authorities = authentication.getAuthorities().toString();
            }
        }
        modelAndView.addObject("name", "Yojulab!");

        modelAndView.addObject("remoteServerUrl", remoteServerUrl);
        modelAndView.addObject("myimage", "thermometer.png");

        modelAndView.setViewName("/WEB-INF/views/main.jsp");
        return modelAndView;
    }


    @GetMapping({"/mypageMain"})   
    public ModelAndView mypage(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypageMain.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/mypageInfo"})   
    public ModelAndView mypage_info(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypageInfo.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/mypageInsert_plan"})   
    public ModelAndView mypage_insert_plan(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypage_insert_plan.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/mypageReview"})   
    public ModelAndView mypage_review(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypage_plan_review.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/mypagePlan_list"})   
    public ModelAndView mypage_plan_list(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypage_plan_list.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/mypageReserve_list"})   
    public ModelAndView mypage_reserve_list(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/mypage/mypage_reserve_list.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }


    @GetMapping({"/community"})   
    public ModelAndView community(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/community/community.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/one_on_one_CS_main"})   
    public ModelAndView CS_main(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
        if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }
        
        // InquiryService를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> InquiryList = inquiryService.selectSearchWithPagination(dataMap);
        

        // View의 경로 설정
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_main.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("InquiryList", InquiryList.get("InquiryList"));
        modelAndView.addObject("paginations", InquiryList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @PostMapping({"/one_on_one_CS_main"})   
    public ModelAndView CS_main_post(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
        if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }
        
        // InquiryService를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> InquiryList = inquiryService.selectSearchWithPagination(dataMap);
        

        // View의 경로 설정
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_main.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("InquiryList", InquiryList.get("InquiryList"));
        modelAndView.addObject("paginations", InquiryList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @GetMapping({"/one_on_one_CS_write"})   
    public ModelAndView CS_write_read(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_write.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @PostMapping({"/one_on_one_CS_write"})
    public ModelAndView CS_write_insert(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap) {
        // 게시물 추가를 처리하는 서비스 호출
        Object result = inquiryService.insertInquiry(dataMap);

        // 추가된 게시물을 포함한 전체 게시물 목록을 가져옴
        Map<String, Object> InquiryList = inquiryService.selectSearchWithPagination(dataMap);
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_write.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("InquiryList", InquiryList.get("InquiryList"));
        modelAndView.addObject("paginations", InquiryList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        modelAndView.addObject("result", result);

        return modelAndView;
    }

    

    @GetMapping({"/admin_main"})   
    public ModelAndView admin_main(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_main.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_users"})   
    public ModelAndView admin_users(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        String viewName = "/WEB-INF/views/admin/admin_users.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    
    
    @GetMapping({"/admin_notices"})   
    public ModelAndView admin_notices(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
        if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }

        // NoticeList를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> NoticeList = noticeService.selectSearchWithPagination(dataMap);
        
        // View의 경로 설정
        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("NoticeList", NoticeList.get("NoticeList"));
        modelAndView.addObject("paginations", NoticeList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @PostMapping({"/admin_notices"})   
    public ModelAndView admin_notices_post(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
         // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
         if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }

        // NoticeList를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> NoticeList = noticeService.selectSearchWithPagination(dataMap);
        
        // View의 경로 설정
        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("NoticeList", NoticeList.get("NoticeList"));
        modelAndView.addObject("paginations", NoticeList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @GetMapping({"/admin_notice_write"})   
    public ModelAndView admin_notice_write(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_notice_write.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_notice_content", "/admin_notice_content/{NOTICE_ID}"})   
    public ModelAndView admin_notice_content(ModelAndView modelAndView, @PathVariable(value = "NOTICE_ID", required = false) String NOTICE_ID, @RequestParam Map<String, Object> dataMap){
        String viewName = "/WEB-INF/views/admin/admin_notice_content.jsp";

   
         // objectId가 주어진 경우 해당 공지사항 내용을 가져옴
         Map<String, Object> noticeContent = new HashMap<>();
         if(NOTICE_ID != null) {
             noticeContent = noticeService.getNoticeContentFromDatabase(NOTICE_ID);
         }

        // 공지사항 목록과 페이징 정보 모델에 추가
        modelAndView.addObject("noticeContent", noticeContent);
        modelAndView.setViewName(viewName);
        
        return modelAndView;
    }

    @PostMapping({"/admin_notice_content"})   
    public ModelAndView admin_notice_content_post(ModelAndView modelAndView, @PathVariable int pageNum, @RequestParam("NOTICE_ID") String noticeId){
        String viewName = "/WEB-INF/views/admin/admin_notice_content.jsp";

        // 데이터 맵 생성
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("NOTICE_ID", noticeId);
        dataMap.put("currentPage", String.valueOf(pageNum)); // 페이지 번호를 문자열로 변환하여 추가


        // 공지사항 목록을 조회
        Map<String, Object> NoticesList = noticeService.selectSearchWithPagination(dataMap);
        
        modelAndView.addObject("NoticesList", NoticesList);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    
    @GetMapping("/accessDenied")
    public ModelAndView showAccessDenied(ModelAndView modelAndView) {
    // 접근 거부 페이지로 이동
    String viewName = "/WEB-INF/views/auth/accessDenied.jsp";
    modelAndView.setViewName(viewName);
    return modelAndView;
}
}


