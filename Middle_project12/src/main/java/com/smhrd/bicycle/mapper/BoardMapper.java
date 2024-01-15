package com.smhrd.bicycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.bicycle.model.Board;
import com.smhrd.bicycle.model.User;


//게시판 Mapper
@Mapper
public interface BoardMapper {

	//글 전체 리스트 가져오기
	@Select("select comm_seq, comm_title, user_id, created_at, comm_file from community_info")
	public List<Board> boardList();
	
	//글 작성
	public int write(Board b);
	
	//글 상세보기
	@Select("select * from community_info where comm_seq=#{comm_seq}")
	public Board boardcontent(String comm_seq);
	
	//글 삭제
	@Delete("delete from community_info where comm_seq=#{comm_seq}")
	public int delete(int comm_seq);
	
	//프로필사진 가져오기
	@Select("select user_profile_img, user_id from user_info where user_id=#{user_id}")
	public User getUserImg(String user_id);
	
	
}