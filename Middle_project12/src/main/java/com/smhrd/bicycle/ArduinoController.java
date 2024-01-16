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
	
	Gps gps1 = new Gps();
	
	@RequestMapping(value="/test1", method=RequestMethod.GET)
	public @ResponseBody String DBLocation(@RequestParam("lat") Double lat,@RequestParam("lng") Double lng,@RequestParam("user_id") String user_id,HttpSession session,@RequestParam("theft") int theft) {
				
		Gps gps = new Gps(lat,lng,user_id);
		int res = mapper.locationSave(gps);
		return "good!!!";
		
	}
	
	@RequestMapping(value="/NowLocationSave", method=RequestMethod.GET)
	public @ResponseBody String NowLocationSave(@RequestParam("lat") Double lat,@RequestParam("lng") Double lng,@RequestParam("user_id") String user_id) {
		gps1.setLat(lat);
		gps1.setLng(lng);
		gps1.setUserId(user_id);
		return "nice!!!";
	}
	
	@RequestMapping(value="/CheckNowLocation", method=RequestMethod.GET)
	public @ResponseBody String CheckNowLocation() {
		String LatLng;
		if(gps1.getLat() != null) {
			LatLng = gps1.getLat().toString();
			LatLng += gps1.getLng().toString();
			return LatLng;
		}else {
			return "";
		}
		
	}
	
	@RequestMapping(value="/test3", method=RequestMethod.GET)
	public @ResponseBody String ArduinoReturn(HttpSession session,@RequestParam("theft") int theft,HttpServletResponse response) {
		int parkingLock = mapper.checkLock();
		System.out.println(parkingLock);
		mapper.setTheft(theft);
		
		int stopAlarm = mapper.checkAlarm();
		
		if(stopAlarm == 3) {
			int res3 = mapper.checkAlarm();
			String sa = Integer.toString(res3);
			mapper.getBackAlarm();
			return parkingLock+sa;
		}else {
			return parkingLock+"2";
		}
		
	}
	
	
	
}
