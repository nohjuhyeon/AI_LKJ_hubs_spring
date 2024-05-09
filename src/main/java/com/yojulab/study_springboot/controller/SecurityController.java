package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yojulab.study_springboot.service.UsersService;

@Controller
public class SecurityController {

    
    @Autowired
    private UsersService usersService;



    @GetMapping({"/loginForm"})     // 로그인 폼 작성
    public ModelAndView loginForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/security/loginForm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/main.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }


    @GetMapping({"/logoutForm"})     // 로그아웃 폼 작성
    public ModelAndView logoutForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/security/logoutForm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}