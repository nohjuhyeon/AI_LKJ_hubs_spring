package com.yojulab.study_springboot.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

        public String[] ENDPOINTS_WHITELIST = {
                "/css/**", "/js/**", "/", "/home", "/main"
        };

        @SuppressWarnings("removal")
        @Bean
        public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
                // None using csrf protection
                httpSecurity.csrf().disable();
                // 권한에 대한 부분 : url & roles : user url & roles
                // url, roles from Dao
                httpSecurity.authorizeHttpRequests() // 권한 설정
                        // .requestMatchers("/manager*").hasAnyRole("ADMIN", "MANAGER")
                        // .requestMatchers("/admin*").hasRole("ADMIN")
                        // .requestMatchers("/carInfor/map/selectSearch").authenticated()
                        // .requestMatchers("/carInfor/map/*").hasRole("USER")

                        
                        .requestMatchers("/admin_main*").hasRole("ADMIN")
                        .requestMatchers("/admin_users*").hasRole("ADMIN")
                        .requestMatchers("/admin_notices*").hasRole("ADMIN")
                        .requestMatchers("/mypageMain*").hasRole("MEMBER")
                        .requestMatchers("/mypageInfo*").hasRole("MEMBER")
                        .requestMatchers("/mypageInsert_plan*").hasRole("MEMBER")
                        .requestMatchers("/mypageReview*").hasRole("MEMBER")
                        .requestMatchers("/mypagePlan_list*").hasRole("MEMBER")
                        .requestMatchers("/mypageReserve_list*").hasRole("MEMBER")
                        .requestMatchers("/one_on_one_CS_write*").hasRole("MEMBER")
                        .anyRequest().permitAll()
                ;

                // 로그인, 로그아웃
                httpSecurity.formLogin(login -> login.loginPage("/loginForm")
                                .usernameParameter("USER_ID") // 이 부분 추가
                                .failureUrl("/loginForm?fail=true")
                                .loginProcessingUrl("/login")
                                .defaultSuccessUrl("/"));
                httpSecurity.logout(logout -> logout
                                .logoutSuccessUrl("/main")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID"));


                // 권한 거부 처리
                httpSecurity.exceptionHandling()
                        .accessDeniedPage("/accessDenied");

                return httpSecurity.build();
        }

        

        @Bean
        public BCryptPasswordEncoder encoderPasswordEncoder() {
                // BCryptPasswordEncoder를 사용한 인코딩
                return new BCryptPasswordEncoder();
        }
}