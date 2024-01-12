package com.smhrd.bicycle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.bicycle.model.User;

import com.smhrd.bicycle.model.User;

@Mapper
public interface UserMapper {
	

	
	// 로그인
	@Select("select * from user_info where user_id=#{user_id} and user_pw=#{user_pw}")
	public User login(User u);
	
	// 회원가입
	@Insert("insert into user_info(user_id,user_pw,user_birthdate,user_name,user_profile_img,joined_at,user_role) values(#{user_id},#{user_pw},#{user_birthdate},#{user_name},#{user_profile_img},sysdate,'U')")
	public int join(User u);

	// 회원정보수정
	@Update("UPDATE user_info SET user_pw=#{user_pw}, user_name=#{user_name}, user_profile_img=#{user_profile_img} WHERE user_id=#{user_id}")
	public int updateUserInfo(User m);
}
