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
public class NoticeService {
    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    @Autowired
    AuthsService AUTHSService;

    // 모든 공지 조회
    public Map<String, Object> getAllInquiries(Map<String, Object> dataMap) {
        String sqlMapId = "Notices.selectByNotice";
        
        List<Map<String, Object>> NoticesList = (List<Map<String, Object>>) sharedDao.getList(sqlMapId, dataMap);
        Map<String, Object> result = new HashMap<>();
        result.put("NoticesList", NoticesList);
        
        return result;
    }
        
    public Object selectTotal(Map dataMap) {
        String sqlMapId = "Notices.selectTotal";

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
        String sqlMapId = "Notices.selectSearchWithPagination";
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());


        // 공지사항 목록을 가져오는 쿼리를 호출하여 데이터를 가져옴
        List<Map<String, Object>> NoticeList = (List<Map<String, Object>>) sharedDao.getList(sqlMapId, dataMap);
        result.put("NoticeList", NoticeList); // 표현된 레코드 정보
        return result;
    }

    // 데이터베이스에서 공지사항 내용을 가져오는 메서드
    public Map<String, Object> getNoticeContentFromDatabase(String NOTICE_ID) {
        String sqlMapId = "Notices.selectByNoticeId";
        Map<String, Object> result = (Map<String, Object>) sharedDao.getOne(sqlMapId, NOTICE_ID);
        return result;
    }


    
}
