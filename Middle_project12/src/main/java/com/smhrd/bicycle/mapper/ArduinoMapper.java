package com.smhrd.bicycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.bicycle.model.Gps;

@Mapper
public interface ArduinoMapper {
	
	//gps위치값(라이딩 기록) db저장
	@Insert("insert into gps_info(loc_seq,lat,lng,created_at,user_id) values(1,#{lat},#{lng},sysdate,'asd')")
	public int locationSave(Gps gps);
	
	//gps위치값(라이딩 기록) 불러오기
	public List<Gps> rideRecode(String created_at);
	
	//lock
	@Update("update locksystem SET lockunlock=1")
	public int lock();
	
	//unlock
	@Update("update locksystem SET lockunlock=0")
	public int unlock();
	
	//lockunlock확인
	@Select("select lockunlock from locksystem")
	public int checkLock();
	
	//stopAlarm
	@Update("update stopalarm set alarm=3")
	public int stopAlarm();
	
	//checkAlarm
	@Select("select alarm from stopalarm")
	public int checkAlarm();
	
	//getBackAlarm
	@Update("update stopalarm SET alarm=2")
	public int getBackAlarm();
	
	//setTheft
	@Update("update theftsystem SET theft=#{theft}")
	public int setTheft(int theft);
	
	//checkTheft
	@Select("select theft from theftsystem")
	public int checkTheft();
}
