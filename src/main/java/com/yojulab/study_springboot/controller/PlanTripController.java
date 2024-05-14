package com.yojulab.study_springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/plan_trip")
public class PlanTripController {

    @GetMapping({"/reserve_dorm"})
    public ModelAndView showReserveDormPage(ModelAndView modelAndView) {
        String viewName = "/WEB-INF/views/plan_trip/reserve_dorm.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
}