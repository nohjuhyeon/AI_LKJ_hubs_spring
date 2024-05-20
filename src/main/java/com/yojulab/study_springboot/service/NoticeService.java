package com.yojulab.study_springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.core.Authentication;

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

    public Object insert(Map dataMap) {
        // 현재 사용자의 인증 객체를 가져옴
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // 현재 사용자의 ID를 가져옴
String USER_ID = authentication.getName(); // Spring Security에서는 사용자 ID가 인증 객체의 이름으로 저장됨
        String sqlMapId = "Notices.insert";
        String NOTICE_ID = commonUtils.getUniqueSequence();
        dataMap.put("NOTICE_ID", NOTICE_ID);
        dataMap.put("USER_ID", USER_ID); 
        Object result = sharedDao.insert(sqlMapId, dataMap);
        
        return result;
    }

    public Object read(HashMap<String, Object> dataMap){
        String sqlMapId = "Notices.selectByOneUID";
        Object one = sharedDao.getOne(sqlMapId, dataMap);
        return one;
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
        Map<String, Object> result = new HashMap<>();
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

    public Object deleteWithIn(Map dataMap) {
        String sqlMapId = "Notices.delete";
        Object count = sharedDao.delete(sqlMapId, dataMap);
        return count;
    }

    // 삭제 및 페이지네이션
    public Map selectSearchWithPaginationAndDeletes(Map dataMap) {
        if (dataMap.get("deleteIds") != null) {
            Object count = this.deleteWithIn(dataMap);
        }

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

    // 업데이트 메서드
    public Object update(Map dataMap) {
        String sqlMapId = "Notices.update";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

    // 업데이트 및 페이지네이션 구현
    public Map updateAndPagination(Map dataMap) {
        if (dataMap.get("NOTICE_ID") != null) {
            Object count = this.update(dataMap);
        }

        // 페이지 형성을 위한 계산
        int totalCount = (int) this.selectTotal(dataMap);

        int currentPage = 1;
        if (dataMap.get("currentPage") != null) {
            currentPage = Integer.parseInt((String) dataMap.get("currentPage"));
        }

        Paginations paginations = new Paginations(totalCount, currentPage);
        Map<String, Object> result = new HashMap<>();
        result.put("paginations", paginations); // 페이지에 대한 정보

        // 페이지네이션 관련 파라미터 설정
        dataMap.put("pageScale", paginations.getPageScale());
        dataMap.put("pageBegin", paginations.getPageBegin());

        // 공지사항 목록 가져오기
        String sqlMapId = "Notices.selectSearchWithPagination";
        List<Map<String, Object>> NoticeList = (List<Map<String, Object>>) sharedDao.getList(sqlMapId, dataMap);
        result.put("NoticeList", NoticeList); // 표현된 레코드 정보

        return result;
}
}