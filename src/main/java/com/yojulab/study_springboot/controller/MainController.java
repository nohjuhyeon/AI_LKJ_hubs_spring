package com.yojulab.study_springboot.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.InquiryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MainController {
    @Value("${remote.server.url}")
    private String remoteServerUrl;

    @Autowired
    InquiryService inquiryService;

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

    // @GetMapping({ "/admin" }) // 관리자 접속하는 곳
    // public ModelAndView admin(ModelAndView modelAndView) {
    //     String viewName = "/WEB-INF/sample/views/admin.jsp";
    //     modelAndView.setViewName(viewName);
    //     return modelAndView;
    // }

    // @GetMapping({ "/manager/read" }) // 관리자 접속하는 곳
    // public ModelAndView manager(ModelAndView modelAndView) {
    //     String viewName = "/WEB-INF/sample/views/manager/read.jsp";
    //     modelAndView.setViewName(viewName);
    //     return modelAndView;
    // }

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
        // InquiryService를 통해 모든 문의 조회
        List<Map<String, Object>> InquiryList = inquiryService.getAllInquiries(dataMap);

        // View의 경로 설정
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_main.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("InquiryList", InquiryList);
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @PostMapping({"/one_on_one_CS_main"})   
    public ModelAndView CS_main_post(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        // InquiryService를 통해 모든 문의 조회
        List<Map<String, Object>> InquiryList = inquiryService.getAllInquiries(dataMap);
        
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_main.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("InquiryList", InquiryList);
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @GetMapping({"/one_on_one_CS_write"})   
    public ModelAndView CS_write(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/consult/one_on_one_CS_write.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_main"})   
    public ModelAndView admin_main(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_main.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_users"})   
    public ModelAndView admin_users(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_users.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    
    
    @GetMapping({"/admin_notices"})   
    public ModelAndView admin_notices(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_notice_write"})   
    public ModelAndView admin_notice_write(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_notice_write.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_notice_content"})   
    public ModelAndView admin_notice_content(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_notice_content.jsp";
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


