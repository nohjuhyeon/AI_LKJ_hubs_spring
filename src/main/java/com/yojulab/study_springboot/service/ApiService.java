package com.yojulab.study_springboot.service;

import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApiService {
    private RestTemplate restTemplate = new RestTemplate();
    private ObjectMapper mapper = new ObjectMapper();

    @Value("${remote.restapi.url}")
    private String baseUrl;

    public Map<String, Object> fetchDataConsume() {
        String url = baseUrl + "/consult_api/Data_chart";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), Map.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return Collections.emptyMap();
        } catch (Exception e) {
            System.err.println("Error occurred while fetching data from: " + url);
            e.printStackTrace();
            return Collections.emptyMap();
        }
    }
}
