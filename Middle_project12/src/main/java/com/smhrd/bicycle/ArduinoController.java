package com.smhrd.bicycle;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.apache.ibatis.annotations.Mapper;
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
	
	@Mapper
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
	public void DBLocation(@RequestParam("latitude") Double lat,@RequestParam("longitude") Double lng,@RequestParam("user_id") String user_id,HttpSession session,@RequestParam("theft") int theft) {
				
		//라이딩 기록 확인 위해 gps값 db저장
		Gps gps = new Gps(lat,lng,user_id);
		int res = mapper.locationSave(gps);
				
		if(res>0) { //DB 저장 성공
			System.out.println("DB save complete");
		}else {//DB 저장 실패
			System.out.println("DB save fail");
		}
		
		
	}
	
	//현재위치 확인 페이지로 위도,경도값 리턴
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public @ResponseBody Gps CheckNowLocation(@RequestParam("latitude") Double lat,@RequestParam("longitude") Double lng,@RequestParam("user_id") String user_id,@RequestParam("theft") int theft) {
		gps1.setLat(lat);
		gps1.setLng(lng);
		gps1.setUserId(user_id);
		
		return gps1;
	}
	
	//이동 잠금 허용 및 알림중지 데이터 지속적으로 아두이노로 리턴하는 메서드
	@RequestMapping(value="/test3", method=RequestMethod.GET)
	public @ResponseBody String ArduinoReturn(HttpSession session,@RequestParam("theft") int theft,HttpServletResponse response) {
		
		int parkingLock = (int)session.getAttribute("parkingLock"); //웹에서 이동 잠금(0)/허용(1) 버튼을 클릭할때 세션에 저장되게 로직 구현해야함
		
		session.setAttribute("theft", theft);
		
		if((int)session.getAttribute("stopAlarm") == 3) {
			String sa = (String)session.getAttribute("stopAlarm");
			session.removeAttribute("stopAlarm");
			return parkingLock+sa;
		}else {
			return parkingLock+"2";
		}
		
	}
	
	
	
}
