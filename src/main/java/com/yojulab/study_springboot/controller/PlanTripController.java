package com.yojulab.study_springboot.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.yojulab.study_springboot.service.ApiService;
import com.yojulab.study_springboot.service.DormService;
import com.yojulab.study_springboot.service.TourApiService;
import com.yojulab.study_springboot.service.TourApiService.PlaceDetail;
import com.yojulab.study_springboot.utils.RecoTheme;
@Controller
public class PlanTripController {
    @Autowired
    private ApiService apiService;
    @Autowired
    private TourApiService tourApiService;
    @Autowired
    private DormService dormService;
    @RequestMapping(value = "/plan_trip/reserve_transfer", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showReserveTransferTotal(ModelAndView modelAndView) {
        List<Map<String, Object>> reserveTransferData = apiService.fetchReserveTransferTotal();
        modelAndView.addObject("reserveTransferData", reserveTransferData);
        modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_transfer.jsp");
        return modelAndView;
    }
    // @RequestMapping(value = "/reserve_dorm")
    // public ModelAndView reserveDorm(ModelAndView modelAndView) {
    //     List<TourApiService.PlaceDetail> details = tourApiService.getDetails();
    //     modelAndView.addObject("details", details);
    //     modelAndView.setViewName("/WEB-INF/views/plan_trip/reserve_dorm.jsp");
    //     return modelAndView;
    // }
    @GetMapping({"/plan_trip/reserve_dorm"})
    public ModelAndView reserve_dorm(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap) {
        if(!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }
        Map<String, Object> DormList = dormService.selectSearchWithPagination(dataMap);
        String viewName = "/WEB-INF/views/plan_trip/reserve_dorm.jsp";
        modelAndView.setViewName(viewName);
        modelAndView.addObject("DormList", DormList.get("DormList"));
        modelAndView.addObject("paginations", DormList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @RequestMapping(value ="/plan_trip/reco_themes", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView listPost(ModelAndView modelAndView) {
        // 사용자 입력 값 가져오기
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("arrive", "region");
        queryParams.put("arrive_date", "2023-04-01");
        queryParams.put("depart_date", "2023-04-05");
        // 날짜 차이 계산
        LocalDate arriveDate = LocalDate.parse(queryParams.get("arrive_date"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        LocalDate departDate = LocalDate.parse(queryParams.get("depart_date"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        int datediff = (int) Duration.between(departDate.atStartOfDay(), arriveDate.atStartOfDay()).toDays() + 1;
        // 추천 테마 리스트 생성
        List<String> conceptList = RecoTheme.recoTheme(queryParams.get("arrive"), datediff);
        conceptList.add("상관없음");
        // 모델에 데이터 추가
        modelAndView.addObject("concept_list", conceptList);
        modelAndView.addObject("tour_list", new ArrayList<>());
        modelAndView.addObject("datediff", datediff);
        // 뷰 이름 설정
        modelAndView.setViewName("plan_trip/reco_trip_plan");
        return modelAndView;
    }
}

