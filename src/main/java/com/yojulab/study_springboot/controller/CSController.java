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

public class CSController {

    @Value("${remote.server.url}")
    private String remoteServerUrl;

    @Autowired
    InquiryService inquiryService;

    @Autowired
    NoticeService noticeService;

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

    
}
