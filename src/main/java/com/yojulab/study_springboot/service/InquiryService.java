package com.yojulab.study_springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.dao.SharedDao;
import com.yojulab.study_springboot.utils.Commons;
import com.yojulab.study_springboot.utils.Paginations;

@Service
@Transactional
public class InquiryService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    @Autowired
    AuthsService AUTHSService;

    // 모든 문의 조회
    public List<Map<String, Object>> getAllInquiries(Map<String, Object> dataMap) {
        String sqlMapId = "Inquiry.selectByInquiry";
        
        return (List<Map<String, Object>>) sharedDao.getList(sqlMapId, dataMap);
    }
     
    public Object selectTotal(Map dataMap) {
        String sqlMapId = "Inquiry.selectTotal";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }    


    public Map selectSearchWithPagination(Map dataMap) {
        // 페이지 형성 위한 계산
        int totalCount = (int) this.selectTotal(dataMap);

        int currentPage = 1;
        if(dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String)dataMap.get("currentPage"));
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        HashMap result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보

        // page record 수
        String sqlMapId = "Inquiry.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        result.put("InquiryList", sharedDao.getList(sqlMapId, dataMap)); // 표현된 레코드 정보
        return result;
    }

    public Object insertInquiry(Map dataMap) {
        String password = (String) dataMap.get("INQUIRY_PASSWORD");
        dataMap.put("INQUIRY_PASSWORD", password);
        String sqlMapId = "Inquiry.insert";
        String INQUIRY_ID = commonUtils.getUniqueSequence();
        dataMap.put("INQUIRY_ID", INQUIRY_ID);
        Object result = sharedDao.insert(sqlMapId, dataMap);
        
        return result;
    }


    }

  

