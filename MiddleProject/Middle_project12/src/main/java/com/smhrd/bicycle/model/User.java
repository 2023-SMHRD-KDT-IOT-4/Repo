package com.smhrd.bicycle.model;

import org.springframework.stereotype.Controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor   // 기본 생성자
@AllArgsConstructor  // 모든 필드 초기화하는 생성자
@Setter  // setter 생성
@Getter  // getter 생성

@Controller
//유저 정보 객체
public class User {

	    // 유저 아이디 
	    private String user_id;

	    // 유저 비밀번호 
	    private String user_pw;

	    // 유저 생년월일 
	    private String user_birthdate;

	    // 유저 이름 
	    private String user_name;

	    // 유저 프로필사진 
	    private String user_profile_img;

	    // 유저 가입일자 
	    private String joined_at;

	    // 유저 구분 
	    private String user_role;

	    public String getUserId() {
	        return user_id;
	    }

	    public void setUserId(String userId) {
	        this.user_id = user_id;
	    }

	    public String getUserPw() {
	        return user_pw;
	    }

	    public void setUserPw(String userPw) {
	        this.user_pw = user_pw;
	    }

	    public String getUserBirthdate() {
	        return user_birthdate;
	    }

	    public void setUserBirthdate(String userBirthdate) {
	        this.user_birthdate = user_birthdate;
	    }

	    public String getUserName() {
	        return user_name;
	    }

	    public void setUserName(String userName) {
	        this.user_name = user_name;
	    }

	    public String getUserProfileImg() {
	        return user_profile_img;
	    }

	    public void setUserProfileImg(String userProfileImg) {
	        this.user_profile_img = user_profile_img;
	    }

	    public String getJoinedAt() {
	        return joined_at;
	    }

	    public void setJoinedAt(String joinedAt) {
	        this.joined_at = joined_at;
	    }

	    public String getUserRole() {
	        return user_role;
	    }

	    public void setUserRole(String userRole) {
	        this.user_role = user_role;
	    }


		public User(String user_id, String user_pw, String user_birthdate, String user_name) {
			super();
			this.user_id = user_id;
			this.user_pw = user_pw;
			this.user_birthdate = user_birthdate;
			this.user_name = user_name;
		}
	
	    // 생성자는 반환타입 없음
	    public User(String user_id, String user_pw) {
	    	this.user_id = user_id;
	    	this.user_pw = user_pw;
	    	
	    }

	    
	
}
