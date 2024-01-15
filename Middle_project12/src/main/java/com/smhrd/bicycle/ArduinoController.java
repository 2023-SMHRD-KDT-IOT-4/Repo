package com.smhrd.bicycle;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.bicycle.mapper.ArduinoMapper;
import com.smhrd.bicycle.model.Gps;

@Controller
public class ArduinoController {
	
	@Autowired
	ArduinoMapper mapper;
	
//	String a = "";
	Gps gps1 = new Gps();


//	//아두이노 to java test
//	@RequestMapping(value="/test", method=RequestMethod.GET)
//	public @ResponseBody String test1(@RequestParam("data") String data,@RequestParam("data2") String data2, HttpSession session,Model model) {
//		a = data;
//		System.out.println("위도 : "+data+" 경도 : "+data2);
//		return  "good"; //아두이노로 리턴
//		
//	}
//	
//	@RequestMapping(value="/test2", method=RequestMethod.POST)
//	public @ResponseBody int test2() {
//		System.out.println("@@@@@@@@@@@@@@@@@@");
//		Random rd = new Random();
//		int ab = rd.nextInt(10);
//		return ab;
//	}
	
	//라이딩 기록 확인 위해 위도경도값 DB저장 메서드
	@RequestMapping(value="/test1", method=RequestMethod.GET)
	public @ResponseBody String DBLocation(@RequestParam("lat") Double lat,@RequestParam("lng") Double lng,@RequestParam("user_id") String user_id,HttpSession session,@RequestParam("theft") int theft) {
				
		//라이딩 기록 확인 위해 gps값 db저장
		Gps gps = new Gps(lat,lng,user_id);
		int res = mapper.locationSave(gps);
				
		if(res>0) { //DB 저장 성공
			System.out.println("DB save complete");
		}else {//DB 저장 실패
			System.out.println("DB save fail");
		}
		
		return "good!!!";
		
	}
	
	//아두이노에서 request함 gps 센서값 변수에 저장하는 메서드
	@RequestMapping(value="/NowLocationSave", method=RequestMethod.GET)
	public @ResponseBody String NowLocationSave(@RequestParam("lat") Double lat,@RequestParam("lng") Double lng,@RequestParam("user_id") String user_id) {
		System.out.println("NowLocationSave메서드 들어옴");
		System.out.println("lat : "+lat+"lng : "+lng);
		gps1.setLat(lat);
		gps1.setLng(lng);
		gps1.setUserId(user_id);
		System.out.println("NowLocationSave메서드 나감");
		return "nice!!!";
	}
	
	//map페이지에서 request함
	@RequestMapping(value="/CheckNowLocation", method=RequestMethod.GET)
	public @ResponseBody String CheckNowLocation() {
		System.out.println("CNL 메서드 들어옴");
		String LatLng;
		if(gps1.getLat() != null) {
			LatLng = gps1.getLat().toString();
			LatLng += gps1.getLng().toString();
			System.out.println(LatLng);
			return LatLng;
		}else {
			return "";
		}
		
	}
	
	//이동 잠금 허용 및 알림중지 데이터 지속적으로 아두이노로 리턴하는 메서드
	@RequestMapping(value="/test3", method=RequestMethod.GET)
	public @ResponseBody String ArduinoReturn(HttpSession session,@RequestParam("theft") int theft,HttpServletResponse response) {
		System.out.println("아두이노 리턴 메서드 들어옴");
		
		int parkingLock = mapper.checkLock();
		System.out.println(parkingLock);
		int res1 = mapper.setTheft(theft);
		if(res1>0) {
			System.out.println("theft값 db에 update완료");
		}else{
			System.out.println("theft값 db에 update하다가 망함!!!!!!!!!!!!!");
		}
		
		int stopAlarm = mapper.checkAlarm();
		
		if(stopAlarm == 3) {
			int res3 = mapper.checkAlarm();
			String sa = Integer.toString(res3);
			int res2 = mapper.getBackAlarm();
			if(res2>0) {
				System.out.println("알람 값 db에서 되돌렸음!");
			}else {
				System.out.println("알람 값 db에서 되돌리다가 망함!!!!!!");
			}
			System.out.println("아두이노 리턴 메서드 나간다~");
			return parkingLock+sa;
		}else {
			System.out.println("아두이노 리턴 메서드 나간다~");
			return parkingLock+"2";
		}
		
	}
	
	
	
}
