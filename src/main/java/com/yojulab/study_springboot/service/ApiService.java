package com.yojulab.study_springboot.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApiService {
    private RestTemplate restTemplate = new RestTemplate();
    private ObjectMapper mapper = new ObjectMapper();

    public Map<String, Object> fetchDataConsume() {
        String url = "http://localhost:8000/consult_api/Data_chart";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), Map.class);
        } catch (JsonProcessingException e) {
            // Log error and return empty list or rethrow as a custom checked/unchecked exception
            e.printStackTrace();
            return Collections.emptyMap();
        }
    }

    public List<Map<String, Object>> fetchReserveTransferTotal() {
        String url = "http://localhost:8000/consult_api/Reserve_transfer_total";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), List.class);
        } catch (JsonProcessingException e) {
            // Log error and return empty list or rethrow as a custom checked/unchecked exception
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<Map<String, Object>> fetchReserveDorm() {
        String url = "http://localhost:8000/consult_api/Reserve_dorm";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), List.class);
        } catch (JsonProcessingException e) {
            // Log error and return empty list or rethrow as a custom checked/unchecked exception
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}
