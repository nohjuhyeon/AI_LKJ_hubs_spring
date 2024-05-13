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
public class UsersService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    Commons commonUtils;

    @Autowired
    AuthsService AUTHSService;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    public Object insert(Map dataMap) {
        String password = (String) dataMap.get("USER_PWD");
        dataMap.put("USER_PWD", bcryptPasswordEncoder.encode(password));

        String sqlMapId = "Users.insert";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object insertWithAuths(Map dataMap) {
        // 회원 또는 관리자 버튼을 누를 때 해당 권한을 authList에 추가
        List<String> authList = new ArrayList<>();
        if ("MEMBER".equals((String) dataMap.get("USER_AUTH"))) {
            authList.add("PK_MEMBER"); // PK_MEMBER를 추가
            dataMap.put("UNIQUE_ID", "PK_MEMBER");
        } else if ("ADMIN".equals((String) dataMap.get("USER_AUTH"))) {
            authList.add("PK_ADMIN"); // PK_ADMIN을 추가
            dataMap.put("UNIQUE_ID", "PK_ADMIN");
        }

        // authList를 dataMap에 추가
        dataMap.put("authList", authList);

        // insert 함수 호출
        Object result = this.insert(dataMap);
        result = AUTHSService.insert(dataMap);
        return result;
    }

    // 아이디가 이미 존재하는지 확인하는 로직
    public boolean isUserIdExists(String userId) {
        // SharedDao 클래스의 isUserIdExists 메서드 호출하여 아이디가 이미 존재하는지 확인
        boolean result = sharedDao.isUserIdExists(userId);
        return result;
    }

    public Object selectByUID(Map dataMap) {
        String sqlMapId = "Users.selectByUID";

        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object selectByUIDWithAuths(Map dataMap) {
        Map result = (Map) this.selectByUID(dataMap);
        result.putAll(AUTHSService.selectWithUSERNAME(dataMap));
        return result;
    }


}