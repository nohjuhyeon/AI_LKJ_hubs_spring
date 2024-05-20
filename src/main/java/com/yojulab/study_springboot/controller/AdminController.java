package com.yojulab.study_springboot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yojulab.study_springboot.service.InquiryService;
import com.yojulab.study_springboot.service.NoticeService;
import com.yojulab.study_springboot.utils.Paginations;


@Controller
@RequestMapping("/admin_notices")
public class AdminController  {
    // pagination controller 만들기, select, delete, update
   
    @Autowired
    NoticeService noticeService;

    @GetMapping("/admin_main")   
    public ModelAndView admin_main(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_main.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping("/admin_users")   
    public ModelAndView admin_users(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        String viewName = "/WEB-INF/views/admin/admin_users.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }
    
    
    @GetMapping("/admin_lists")   
    public ModelAndView admin_notices(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
        // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
        if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }

        // NoticeList를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> NoticeList = noticeService.selectSearchWithPagination(dataMap);
        
        // View의 경로 설정
        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("NoticeList", NoticeList.get("NoticeList"));
        modelAndView.addObject("paginations", NoticeList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @PostMapping("/admin_lists")   
    public ModelAndView admin_notices_post(ModelAndView modelAndView, @RequestParam Map<String, Object> dataMap){
         // 페이지네이션을 위한 데이터 맵에 현재 페이지 정보 추가
         if (!dataMap.containsKey("currentPage")) {
            dataMap.put("currentPage", "1");
        }

        // NoticeList를 통해 검색된 결과와 페이지네이션 정보를 가져옴
        Map<String, Object> NoticeList = noticeService.selectSearchWithPagination(dataMap);
        
        // View의 경로 설정
        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);

        // View에 전달할 데이터 설정
        modelAndView.addObject("NoticeList", NoticeList.get("NoticeList"));
        modelAndView.addObject("paginations", NoticeList.get("paginations"));
        modelAndView.addObject("dataMap", dataMap);
        return modelAndView;
    }

    @PostMapping("/admin_lists/delete")
    public ModelAndView deletePagination(ModelAndView modelAndView, @RequestParam HashMap<String, Object> dataMap, @RequestParam(name = "deleteIds", required = false) ArrayList<String> deleteIds) {
        if ( dataMap.containsKey("btn_type") ) {
            // 삭제 버튼을 눌렀을 때
            if (deleteIds != null && !deleteIds.isEmpty()){
                // deleteIds가 전달되었을 경우에만 삭제를 수행하도록 수정
                dataMap.put("deleteIds", deleteIds);
            }else if (dataMap.get("btn_type").equals("insert")){
                noticeService.insert(dataMap); // 삽입 처리
            }
        }  
        Map<String, Object> result =  noticeService.selectSearchWithPaginationAndDeletes(dataMap);

        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);
         // result에서 paginations를 가져와서 null인지 검사한 후 사용
        Paginations paginations = (Paginations) result.get("paginations");
        if (paginations != null) {
        modelAndView.addObject("paginations", paginations); // Paginations 객체 추가
        }
        modelAndView.addObject("NoticeList", result.get("NoticeList"));
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;
    }

    @PostMapping("/admin_lists/update/{NOTICE_ID}")
    public ModelAndView noticesUpdate(ModelAndView modelAndView, @PathVariable String NOTICE_ID, @RequestParam HashMap<String, Object> dataMap) {
        if ( dataMap.containsKey("btn_type")){
            if (dataMap.get("btn_type").equals("update")){
                noticeService.update(dataMap); 
            }
        }

        Map<String, Object> result = noticeService.updateAndPagination(dataMap);

        String viewName = "/WEB-INF/views/admin/admin_notices.jsp";
        modelAndView.setViewName(viewName);

        Paginations paginations = (Paginations) result.get("paginations");
        if (paginations != null) {
        modelAndView.addObject("paginations", paginations); // Paginations 객체 추가
        }
        modelAndView.addObject("NoticeList", result.get("NoticeList"));
        modelAndView.addObject("dataMap", dataMap);

        return modelAndView;

    }

    @GetMapping("/admin_notice_write")   
    public ModelAndView admin_notice_write(ModelAndView modelAndView){
        String viewName = "/WEB-INF/views/admin/admin_notice_write.jsp";
        modelAndView.setViewName(viewName);
        return modelAndView;
    }

    @GetMapping({"/admin_notice_content", "/admin_notice_content/{NOTICE_ID}"})   
    public ModelAndView admin_notice_content(ModelAndView modelAndView, @PathVariable(value = "NOTICE_ID", required = false) String NOTICE_ID, @RequestParam Map<String, Object> dataMap){
        String viewName = "/WEB-INF/views/admin/admin_notice_content.jsp";

   
         // objectId가 주어진 경우 해당 공지사항 내용을 가져옴
         Map<String, Object> noticeContent = new HashMap<>();
         if(NOTICE_ID != null) {
             noticeContent = noticeService.getNoticeContentFromDatabase(NOTICE_ID);
         }
         noticeContent.put("NOTICE_ID",NOTICE_ID);
        // 공지사항 목록과 페이징 정보 모델에 추가
        modelAndView.addObject("noticeContent", noticeContent);
        modelAndView.setViewName(viewName);
        
        return modelAndView;
    }

    @PostMapping("/admin_notice_content")   
    public ModelAndView admin_notice_content_post(ModelAndView modelAndView, @PathVariable int pageNum, @RequestParam("NOTICE_ID") String noticeId){
        String viewName = "/WEB-INF/views/admin/admin_notice_content.jsp";

        // 데이터 맵 생성
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("NOTICE_ID", noticeId);
        dataMap.put("currentPage", String.valueOf(pageNum)); // 페이지 번호를 문자열로 변환하여 추가


        // 공지사항 목록을 조회
        Map<String, Object> NoticesList = noticeService.selectSearchWithPagination(dataMap);
        
        modelAndView.addObject("NoticesList", NoticesList);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.setViewName(viewName);
        return modelAndView;
    }


   
}

