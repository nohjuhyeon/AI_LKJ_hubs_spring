package com.yojulab.study_springboot.service.sample;

import java.util.Collections;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yojulab.study_springboot.models.DataConceptSearch;
import com.yojulab.study_springboot.models.DataConsume;
import com.yojulab.study_springboot.models.DataConsumeTransition;
import com.yojulab.study_springboot.models.DataTrendSearch;

@Service
public class ApiService {
    private RestTemplate restTemplate = new RestTemplate();
    private ObjectMapper mapper = new ObjectMapper();

    public List<DataConsume> fetchDataConsume() {
        String url = "http://localhost:8000/consult_api/Data_chart";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), new TypeReference<List<DataConsume>>() {});
        } catch (JsonProcessingException e) {
            // Log error and return empty list or rethrow as a custom checked/unchecked exception
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<DataTrendSearch> fetchDataTrendSearch() {
        String url = "http://localhost:8000/consult_api/Data_trend_search";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), new TypeReference<List<DataTrendSearch>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<DataConsumeTransition> fetchDataConsumeTransition() {
        String url = "http://localhost:8000/consult_api/Data_consume_transition";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), new TypeReference<List<DataConsumeTransition>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<DataConceptSearch> fetchDataConceptSearch() {
        String url = "http://localhost:8000/consult_api/Data_concept_search";
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        try {
            return mapper.readValue(response.getBody(), new TypeReference<List<DataConceptSearch>>() {});
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}
