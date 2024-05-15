package com.yojulab.study_springboot.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yojulab.study_springboot.service.ApiService;

@Controller
@RequestMapping("/consult")
public class ConsultController {
    @Autowired
    private Gson gson;
    @Autowired
    private ApiService apiService;

    // http://127.0.0.1:8080/charts/statistics
    @RequestMapping(value = { "/statistics" }, method = RequestMethod.GET)
    public ModelAndView form(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {

        // Create the data as an ArrayList of ArrayList
        ArrayList barData = new ArrayList<>();
        // Add rows to the barData ArrayList
        barData.add(Arrays.asList("Category", "Value"));
        barData.add(Arrays.asList("Category A", 10));
        barData.add(Arrays.asList("Category B", 20));
        barData.add(Arrays.asList("Category C", 15));

        // Convert the ArrayList to a JSON string
        modelAndView.addObject("barDataJson", gson.toJson(barData));
        String viewName = "/WEB-INF/views/charts/charts_google_various.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @RequestMapping(value = "/data_chart", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showDataChart(ModelAndView modelAndView,
            @RequestParam(value = "select_region", required = false, defaultValue = "서울") String selectedRegion) {

                
        Map<String, Object> result = apiService.fetchDataConsume();
        // 월별 방문객 수
        ArrayList dataConceptSearch = (ArrayList) result.get("data_concept_search");
        Map<String, Double> dictVisitor = new HashMap<>();
        dictVisitor.put("1", 0.0);
        dictVisitor.put("2", 0.0);
        dictVisitor.put("3", 0.0);
        dictVisitor.put("4", 0.0);
        dictVisitor.put("5", 0.0);
        dictVisitor.put("6", 0.0);
        dictVisitor.put("7", 0.0);
        dictVisitor.put("8", 0.0);
        dictVisitor.put("9", 0.0);
        dictVisitor.put("10", 0.0);
        dictVisitor.put("11", 0.0);
        dictVisitor.put("12", 0.0);

        for (int i = 0; i < dataConceptSearch.size(); i++) {
            Map<String, Object> data = (Map<String, Object>) dataConceptSearch.get(i);
            if (data.get("region").equals(selectedRegion) && data.get("destination_type").equals("전체")) {
                String stdMonth = String.valueOf(data.get("std_month"));
                int destinationSearch = (int) data.get("destination_search");
                dictVisitor.put(stdMonth, dictVisitor.get(stdMonth) + destinationSearch / 4);
            }
        }
        // 유형별 목적지 검색량
        Map<String, Integer> dictConcept = new HashMap<>();
        dictConcept.put("숙박", 0);
        dictConcept.put("음식", 0);
        dictConcept.put("기타관광", 0);
        dictConcept.put("쇼핑", 0);
        dictConcept.put("문화관광", 0);
        dictConcept.put("역사관광", 0);
        dictConcept.put("자연관광", 0);
        dictConcept.put("체험관광", 0);
        dictConcept.put("레저스포츠", 0);

        for (int i = 0; i < dataConceptSearch.size(); i++) {
            Map<String, Object> data = (Map<String, Object>) dataConceptSearch.get(i);
            if (data.get("region").equals(selectedRegion) && !data.get("destination_type").equals("전체")) {
                String destinationType = String.valueOf(data.get("destination_type"));
                int destinationSearch = (int) data.get("destination_search");
                dictConcept.put(destinationType, dictConcept.get(destinationType) + destinationSearch / 4);
            }
        }

        // 월별 관광 소비 추이
        ArrayList dataConsumeTransition = (ArrayList) result.get("data_consume_transition");
        List<String> consumeTransitionColumn = Arrays.asList("운송업", "여행업", "숙박업", "식음료업", "여가서비스업", "쇼핑업");
        List<Map<String, Double>> listConsumeTransition = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            Map<String, Double> map = new HashMap<>();
            for (int j = 1; j <= 12; j++) {
                map.put(String.valueOf(j), 0.0);
            }
            listConsumeTransition.add(map);
        }

        for (int i = 0; i < dataConsumeTransition.size(); i++) {
            Map<String, Object> data = (Map<String, Object>) dataConsumeTransition.get(i);
            String industryMajorCate = (String) data.get("industry_major_cate");
            int stdMonth = (int) data.get("std_month");
            double consumptionAmount = (double) data.get("consumption_amount");
            if (data.get("region").equals(selectedRegion) && !data.get("industry_major_cate").equals("전체")) {
                int index = consumeTransitionColumn.indexOf(industryMajorCate);
                listConsumeTransition.get(index).put(String.valueOf(stdMonth),
                        listConsumeTransition.get(index).get(String.valueOf(stdMonth)) + consumptionAmount / 4);
            }
        }

        // 월별 키워드 검색량
        ArrayList dataTrendSearch = (ArrayList) result.get("data_trend_search");
        List<String> tourTrendColumn = Arrays.asList("레포츠", "휴식/힐링", "기타", "미식", "체험");
        List<Map<String, Double>> listMonthTrend = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Map<String, Double> map = new HashMap<>();
            for (int j = 1; j <= 12; j++) {
                map.put(String.valueOf(j), 0.0);
            }
            listMonthTrend.add(map);
        }

        for (int i = 0; i < dataTrendSearch.size(); i++) {
            Map<String, Object> data = (Map<String, Object>) dataTrendSearch.get(i);
            String tourTrend = (String) data.get("tour_trend");
            int stdMonth = (int) data.get("std_month");
            int numMention = (int) data.get("num_mention");

            if (data.get("region").equals(selectedRegion)) {
                int index = tourTrendColumn.indexOf(tourTrend);
                listMonthTrend.get(index).put(String.valueOf(stdMonth),
                        listMonthTrend.get(index).get(String.valueOf(stdMonth)) + numMention / 4);
            }
        }

        // 관광소비 유형
        ArrayList dataConsume = (ArrayList) result.get("data_consume");
        Map<String, Double> dictConsume = new HashMap<>();
        dictConsume.put("쇼핑업", (double) 0);
        dictConsume.put("숙박업", (double) 0);
        dictConsume.put("식음료업", (double) 0);
        dictConsume.put("여가서비스업", (double) 0);
        dictConsume.put("여행업", (double) 0);
        dictConsume.put("운송업", (double) 0);

        for (int i = 0; i < dataConsume.size(); i++) {
            Map<String, Object> data = (Map<String, Object>) dataConsume.get(i);
            if (data.get("region").equals(selectedRegion)) {
                String industryMajorCate = String.valueOf(data.get("industry_major_cate"));
                Double consumptionAmount = (Double) data.get("consumption_amount");
                dictConsume.put(industryMajorCate, dictConsume.get(industryMajorCate) + consumptionAmount / 4);
            }
        }
        modelAndView.addObject("dictVisitor", gson.toJson(dictVisitor));
        modelAndView.addObject("dictConcept", gson.toJson(dictConcept));
        modelAndView.addObject("listConsumeTransition", gson.toJson(listConsumeTransition));
        modelAndView.addObject("listMonthTrend", gson.toJson(listMonthTrend));
        modelAndView.addObject("dictConsume", gson.toJson(dictConsume));
        modelAndView.addObject("selectedRegion", selectedRegion);
        modelAndView.setViewName("/WEB-INF/views/consult/data_chart.jsp");
        return modelAndView;
    }

}


