package com.smhrd.bicycle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.smhrd.bicycle.model.Gps;

@Mapper
public interface ArduinoMapper {
	
	//gps위치값 db저장
	@Insert("insert into gps_info(loc_seq,lat,lng,speed,created_at,user_id) values(1,#{lat},#{lng},#{speed},sysdate,#{user_id}")
	public int locationSave(Gps gps);
}
