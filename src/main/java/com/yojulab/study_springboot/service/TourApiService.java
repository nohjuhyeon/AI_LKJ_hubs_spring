package com.yojulab.study_springboot.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.google.gson.JsonObject;

@Service
public class TourApiService {
    @Value("${seoul.API.key}")
    private String seoulApiKey;
    @Value("${seoul.API.endpoint}")
    private String seoulApiendpoint;
    
    public List<PlaceDetail> getDetails() {
        List<PlaceDetail> details = new ArrayList<>();
        String urlString = String.format("http://openapi.seoul.go.kr:8088/%s/json/%s/1/5/",seoulApiKey, seoulApiendpoint);

        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONObject(seoulApiendpoint).getJSONArray("row");

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);

                String mainKey  = item.getString("MAIN_KEY");
                String category1 = item.has("CATE1_NAME") ? item.getString("CATE1_NAME") : null;
                String category2 = item.has("CATE2_NAME") ? item.getString("CATE2_NAME") : null;
                String category3 = item.has("CATE3_NAME") ? item.getString("CATE3_NAME") : null; // 등급
                String displayName = item.has("NM_DP") ? item.getString("NM_DP") : null; // 숙박명
                String nameKor = item.has("NAME_KOR") ? item.getString("NAME_KOR") : null;  // 숙박명
                String city = item.has("H_KOR_CITY") ? item.getString("H_KOR_CITY") : null; // 시
                String district = item.has("H_KOR_GU") ? item.getString("H_KOR_GU") : null; // 구
                String neighborhood = item.has("H_KOR_DONG") ? item.getString("H_KOR_DONG") : null; // 동 

                PlaceDetail placeDetail = new PlaceDetail(mainKey, category1, category2, category3, displayName, nameKor, city, district, neighborhood);
                details.add(placeDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return details;
    }


    // PlaceDetail 클래스 정의
    public static class PlaceDetail {
        private String mainKey;
        private String category1;
        private String category2;
        private String category3;
        private String displayName;
        private String nameKor;
        private String city;
        private String district;
        private String neighborhood;
    
        public PlaceDetail(String mainKey, String category1, String category2, String category3, String displayName, String nameKor, String city, String district, String neighborhood) {
            this.mainKey = mainKey;
            this.category1 = category1;
            this.category2 = category2;
            this.category3 = category3;
            this.displayName = displayName;
            this.nameKor = nameKor;
            this.city = city;
            this.district = district;
            this.neighborhood = neighborhood;
        }
    
        // Getters and Setters
        public String getMainKey() { return mainKey; }
        public String getCategory1() { return category1; }
        public String getCategory2() { return category2; }
        public String getCategory3() { return category3; }
        public String getDisplayName() { return displayName; }
        public String getNameKor() { return nameKor; }
        public String getCity() { return city; }
        public String getDistrict() { return district; }
        public String getNeighborhood() { return neighborhood; }
    }
    
}
