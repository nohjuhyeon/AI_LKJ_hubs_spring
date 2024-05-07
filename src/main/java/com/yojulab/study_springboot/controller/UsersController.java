package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.UsersService;


@Controller
public class UsersController {

    @Autowired
    UsersService usersService;

    @RequestMapping(value = "/joinForm", method = RequestMethod.GET)
    public ModelAndView joinForm(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/member/joinForm.jsp";

        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/joinProc", method = RequestMethod.POST)
    public ModelAndView join(@RequestParam Map<String, String> params, ModelAndView modelAndView){
        Object result = usersService.insertWithAuths(params);
        String viewName = "/WEB-INF/views/loginForm.jsp";
        modelAndView.setViewName(viewName);
        // modelAndView.setViewName("redirect:/loginForm");
        // modelAndView.addObject("message", "회원가입이 완료되었습니다.");
        return modelAndView;
    }


}