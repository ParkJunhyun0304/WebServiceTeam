package com.project.quarantine.user.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class UserVO {
    private int id;
    /**
     * 유자의 아이디
     */
    private String userName;
    /**
     * 유저의 비밀번호
     */
    private String password;
    /**
     * 유저의 이름
     */
    private String name;
    /**
     * 생일
     */
    private Date birthDate;
    /**
     * 성별 (0 : 남자 / 1 : 여자)
     */
    private int gender;
    /**
     * 관리자 계정 (true : 관리자 / false : 일반유저)
     */
    private boolean isSuper;
}
