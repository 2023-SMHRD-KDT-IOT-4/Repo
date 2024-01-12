package com.smhrd.bicycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.bicycle.model.Gps;

@Mapper
public interface ArduinoMapper {
	
	//gps위치값(라이딩 기록) db저장
	@Insert("insert into gps_info(loc_seq,lat,lng,speed,created_at,user_id) values(1,#{lat},#{lng},#{speed},sysdate,#{user_id}")
	public int locationSave(Gps gps);
	
	//gps위치값(라이딩 기록) 불러오기
	public List<Gps> rideRecode(String created_at);
}
