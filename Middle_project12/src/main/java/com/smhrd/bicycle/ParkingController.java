package com.smhrd.bicycle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.bicycle.mapper.ArduinoMapper;

@Controller
public class ParkingController {
	
	@Autowired
	ArduinoMapper mapper;
	
		//이동허용버튼
		@RequestMapping(value="/move",method=RequestMethod.GET)
		public String move() {
			mapper.unlock();
			mapper.checkLock();
			return "redirect:/lockUnlock";
		}
		
		//이동잠금버튼
		@RequestMapping(value="/lock",method=RequestMethod.GET)
		public String lock() {
			mapper.lock();
			return "redirect:/lockUnlock";
		}
}
