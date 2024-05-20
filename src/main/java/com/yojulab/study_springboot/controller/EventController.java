package com.yojulab.study_springboot.controller;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yojulab.study_springboot.service.ApiService;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private ApiService apiService;

    @RequestMapping(value = "/recommend_region", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView showRecommendRegion(
            @RequestParam(required = false) String concept,
            @RequestParam(required = false) String concept_01,
            @RequestParam(required = false) String concept_02,
            @RequestParam(required = false) String concept_03,
            @RequestParam(required = false) String concept_04,
            @RequestParam(required = false) String season,
            @RequestParam(required = false) String season_01,
            @RequestParam(required = false) String season_02,
            @RequestParam(required = false) String season_03,
            @RequestParam(required = false) String season_04,
            @RequestParam(required = false) String region,
            @RequestParam(required = false) String region_01,
            @RequestParam(required = false) String region_02,
            @RequestParam(required = false) String region_03,
            @RequestParam(required = false) String region_04,
            @RequestParam(required = false) String region_05,
            @RequestParam(required = false) String region_06,
            @RequestParam(required = false) String region_07,
            @RequestParam(required = false) String region_08,
            @RequestParam(required = false) String region_09,
            @RequestParam(required = false) String region_10,
            @RequestParam(required = false) String region_11,
            @RequestParam(required = false) String region_12,
            @RequestParam(required = false) String region_13,
            @RequestParam(required = false) String region_14,
            @RequestParam(required = false) String region_15,
            @RequestParam(required = false) String region_16,
            @RequestParam(required = false) String region_17,
            ModelAndView modelAndView) {

        List<Map<String, Object>> attractions = apiService.fetchAttractions();

        if (concept != null || concept_01 != null || concept_02 != null || concept_03 != null || concept_04 != null ||
            season != null || season_01 != null || season_02 != null || season_03 != null || season_04 != null ||
            region != null || region_01 != null || region_02 != null || region_03 != null || region_04 != null ||
            region_05 != null || region_06 != null || region_07 != null || region_08 != null || region_09 != null ||
            region_10 != null || region_11 != null || region_12 != null || region_13 != null || region_14 != null ||
            region_15 != null || region_16 != null || region_17 != null) {

            // Filter by concept unless 'total_concept' is selected
            if (!"total_concept".equals(concept)) {
                List<String> concepts = Stream.of(concept_01, concept_02, concept_03, concept_04)
                                        .filter(Objects::nonNull)
                                        .collect(Collectors.toList());
                if (!concepts.isEmpty()) {
                    attractions = attractions.stream()
                                        .filter(attraction -> concepts.contains(attraction.get("destination_type")))
                                        .collect(Collectors.toList());
                }
            }

            // Filter by region unless 'total_region' is selected
            if (!"total_region".equals(region)) {
                List<String> regions = Stream.of(region_01, region_02, region_03, region_04, region_05, region_06, region_07, region_08, region_09, region_10, region_11, region_12, region_13, region_14, region_15, region_16, region_17)
                                        .filter(Objects::nonNull)
                                        .collect(Collectors.toList());
                if (!regions.isEmpty()) {
                    attractions = attractions.stream()
                                        .filter(attraction -> regions.contains(attraction.get("region")))
                                        .collect(Collectors.toList());
                }
            }
        } else {
            attractions = List.of(); // No parameters, no data
        }

        modelAndView.addObject("attractions", attractions);
        modelAndView.setViewName("/WEB-INF/views/event/recommend_region.jsp");
        return modelAndView;
    }
}
