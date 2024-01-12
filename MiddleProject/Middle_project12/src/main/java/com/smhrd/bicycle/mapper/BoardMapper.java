package com.smhrd.bicycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.bicycle.model.Board;


//게시판 Mapper
@Mapper
public interface BoardMapper {

	//글 전체 리스트 가져오기
	@Select("select comm_suq, comm_title, user_id, created_at from commnity_info")
	public List<Board> boardList();
	
	//글 작성
	@Insert("insert into commnity_info(comm_suq, comm_title, comm_content, comm_file, created_at, user_id) values(1, #{comm_title}, #{comm_content}, #{comm_file},1,#{user_id})")
	public int write(Board b);
	
	//글 상세보기
	@Select("select * from board where comm_suq=#{comm_suq}")
	public Board boardcontent(String comm_suq);
	
	//글 삭제
	@Delete("delete from community_info where comm_suq=#{comm_suq}")
	public int delete(String comm_suq);
	
	
}