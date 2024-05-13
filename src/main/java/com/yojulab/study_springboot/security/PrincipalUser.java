package com.yojulab.study_springboot.security;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class PrincipalUser implements UserDetails {

    private Map userInfo;

    public String getMemberName() {
        return (String) userInfo.get("USER_NAME");
    }

    public PrincipalUser(Map userInfo) {
        this.userInfo = userInfo;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {
        // 권한들
        Collection<GrantedAuthority> collections = new ArrayList<>();
        List<Map<String, Object>> resultList = (List) userInfo.get("resultList");
        for(Map item: resultList){
            String roleName = "ROLE_" + item.get("AUTH_NAME"); // 권한명 앞에 'ROLE_' 접두사 추가
            collections.add(new SimpleGrantedAuthority(roleName));
        }    // resultList => AUTH_NAMES
            // 권한을 가져오는 부분이므로 AUTH_NAME 가져와야 함
            // 권한 설정 부분때문에 UNIQUE_ID 대신 AUTH_NAME으로 수정
        return collections;
    }

    @Override
    public String getPassword() {
        // password
        return (String) userInfo.get("USER_PWD");
    }

    @Override
    public String getUsername() {
        // ID
        return (String) userInfo.get("USER_ID");
    }

    @Override
    public boolean isAccountNonExpired() {
        // 계정 만료 여부
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // 계정 잠길 여부
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // 비밀번호 변경 기간 만료
        return true;
    }

    @Override
    public boolean isEnabled() {
        // 휴먼 계정 여부
        return true;
    }

}