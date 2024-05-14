package com.yojulab.study_springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yojulab.study_springboot.dao.SharedDao;
import com.yojulab.study_springboot.utils.Commons;

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
     
    
}
