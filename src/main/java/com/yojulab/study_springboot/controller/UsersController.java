package com.yojulab.study_springboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
    public ModelAndView joinForm(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/member/joinForm.jsp";

        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/joinProc", method = RequestMethod.POST)
    public ModelAndView join(@RequestParam Map<String, String> params, ModelAndView modelAndView,
            BindingResult bindingResult) {
        // 아이디 중복 체크
        String userID = params.get("USER_ID");
        if (usersService.isUserIdExists(userID)) {
            modelAndView.addObject("errorMessage", "아이디가 이미 존재합니다.");
            modelAndView.setViewName("/WEB-INF/views/member/joinForm.jsp");
            return modelAndView;
        }

        // 비밀번호 확인
        String password = params.get("USER_PWD");
        String checkPassword = params.get("CHECK_PWD");
        if (!password.equals(checkPassword)) {
            modelAndView.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
            modelAndView.setViewName("/WEB-INF/views/member/joinForm.jsp");
            return modelAndView;
        }

        // 회원가입 처리
        Object result = usersService.insertWithAuths(params);
        if (result != null) {
            modelAndView.addObject("successMessage", "회원가입이 완료되었습니다.");
            String viewName = "/WEB-INF/views/security/loginForm.jsp";
            modelAndView.setViewName(viewName);
        } else {
            modelAndView.addObject("errorMessage", "회원가입에 실패하였습니다.");
            modelAndView.setViewName("/WEB-INF/views/member/joinForm.jsp");
        }

        return modelAndView;
    }

}
