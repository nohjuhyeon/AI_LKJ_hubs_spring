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
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

@Service
public class TourApiService {
    private static final String SERVICE_KEY = "oF8cvDrrW27C3TgVpKW9ax9JcOFDDBL%2BwlraX%2BGs9W5qYdA5jb0UnPfKCqV7BtR%2F1lHnKsfXRYlB7JZLJumIeA%3D%3D";

    public List<PlaceDetail> getDetails() {
        List<Integer> contentIds = getAllContentIds();
        List<PlaceDetail> details = new ArrayList<>();
        for (int contentId : contentIds) {
            PlaceDetail detailInfo = getDetailInfo(contentId);
            if (detailInfo != null) {
                details.add(detailInfo);
            }
        }
        return details;
    }

    private List<Integer> getAllContentIds() {
        List<Integer> contentIds = new ArrayList<>();
        int numOfRows = 10; // 필요한 데이터 개수 설정
        int pageNo = 1;
        String urlString = String.format("https://apis.data.go.kr/B551011/KorService1/searchStay1?serviceKey=%s&numOfRows=%d&pageNo=%d&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A", SERVICE_KEY, numOfRows, pageNo);

        try {
            System.out.println("Request URL: " + urlString); // 요청 URL 확인을 위한 로그 추가
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            JSONObject json = new JSONObject(sb.toString());
            JSONArray items = json.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");

            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                contentIds.add(item.getInt("contentid"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return contentIds;
    }

    private PlaceDetail getDetailInfo(int contentId) {
        String urlString = String.format("http://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=%s&contentTypeId=32&contentId=%d&MobileOS=ETC&MobileApp=AppTest&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y", SERVICE_KEY, contentId);

        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            // XML 파싱
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(new java.io.ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
            doc.getDocumentElement().normalize();

            Element item = (Element) doc.getElementsByTagName("item").item(0);
            String title = getTagValue("title", item);
            String firstimage = getTagValue("firstimage", item);
            String addr1 = getTagValue("addr1", item);
            String tel = getTagValue("tel", item);
            String homepage = getTagValue("homepage", item);

            return new PlaceDetail(title, firstimage, addr1, tel, homepage);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String getTagValue(String tag, Element element) {
        try {
            return element.getElementsByTagName(tag).item(0).getTextContent();
        } catch (Exception e) {
            return null;
        }
    }

    public static class PlaceDetail {
        private String title;
        private String firstimage;
        private String addr1;
        private String tel;
        private String homepage;

        public PlaceDetail(String title, String firstimage, String addr1, String tel, String homepage) {
            this.title = title;
            this.firstimage = firstimage;
            this.addr1 = addr1;
            this.tel = tel;
            this.homepage = homepage;
        }

        // Getters and Setters
        public String getTitle() { return title; }
        public String getFirstimage() { return firstimage; }
        public String getAddr1() { return addr1; }
        public String getTel() { return tel; }
        public String getHomepage() { return homepage; }
    }
}
