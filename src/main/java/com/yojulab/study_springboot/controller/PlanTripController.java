package com.yojulab.study_springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yojulab.study_springboot.service.ApiService;

@Controller
@RequestMapping("/plan_trip")
public class PlanTripController {
    @Autowired
    private Gson gson;
    @Autowired
    private ApiService apiService;

    @RequestMapping(value = "/reserve_transfer", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showReserveTransferTotal(ModelAndView modelAndView) {
        List<Map<String, Object>> reserveTransferData = apiService.fetchReserveTransferTotal();
        modelAndView.addObject("reserveTransferData", reserveTransferData);
        modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_transfer.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/reserve_dorm", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showReserveDorm(ModelAndView modelAndView) {
        List<Map<String, Object>> reserveDormData = apiService.fetchReserveDorm();
        modelAndView.addObject("reserveDormData", reserveDormData);
        modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_dorm.jsp");
        return modelAndView;
    }
}
