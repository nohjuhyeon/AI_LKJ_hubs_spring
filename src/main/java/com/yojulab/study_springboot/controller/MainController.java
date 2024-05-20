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


    @GetMapping("/accessDenied")
    public ModelAndView showAccessDenied(ModelAndView modelAndView) {
    // 접근 거부 페이지로 이동
    String viewName = "/WEB-INF/views/auth/accessDenied.jsp";
    modelAndView.setViewName(viewName);
    return modelAndView;
}
}


