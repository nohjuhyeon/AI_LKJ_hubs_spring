package com.yojulab.study_springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.ApiService;
import com.yojulab.study_springboot.service.TourApiService;

@Controller
@RequestMapping("/plan_trip")
public class PlanTripController {
    @Autowired
    private ApiService apiService;
    @Autowired
    private TourApiService tourApiService;

    @RequestMapping(value = "/reserve_transfer", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showReserveTransferTotal(ModelAndView modelAndView) {
        List<Map<String, Object>> reserveTransferData = apiService.fetchReserveTransferTotal();
        modelAndView.addObject("reserveTransferData", reserveTransferData);
        modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_transfer.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/reserve_dorm", method = RequestMethod.GET)
    public ModelAndView reserveDorm(ModelAndView modelAndView) {
        List<TourApiService.PlaceDetail> details = tourApiService.getDetails();
        modelAndView.addObject("details", details);
        modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_dorm.jsp");
        return modelAndView;
    }
}
