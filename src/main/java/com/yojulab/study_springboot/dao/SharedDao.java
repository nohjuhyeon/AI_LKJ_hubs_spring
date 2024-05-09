package com.yojulab.study_springboot.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SharedDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 여러 개 레코드 
    public Object getList(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    // 레코드 하나
    public Object getOne(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
        return result;
    }

    // 수정
    public Object update(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
        return result;
    }
    
    // 만듦
    public Object insert(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    // 없앨 때
    public Object delete(String sqlMapId, Object dataMap){
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }
    
    // 아이디 중복 확인
    public boolean isUserIdExists(String userId) {
        String sqlMapId = "Users.isUserIdExists";
        // selectOne을 사용하여 db에 해당 아이디가 이미 존재하는지를 확인 => 실행된 쿼리의 결과 중 첫번 째 레코드만 반환
        // int count => 해당 아이디가 존재하는 경우 레코드 수 1 
        int count = sqlSessionTemplate.selectOne(sqlMapId, userId);
        
        // count가 0보다 크면 해당 아이디가 이미 존재하는 것으로 판단하여 true 반환 , 존재하지 않으면 false
        return count > 0 ;
    }
}
