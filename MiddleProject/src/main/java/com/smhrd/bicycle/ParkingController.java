package com.smhrd.bicycle;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingController {
	
	//이동허용버튼
		@RequestMapping(value="/move",method=RequestMethod.GET)
		public void move(HttpSession session) {
			session.setAttribute("parkingLock", 1);
		}
		
		//이동잠금버튼
		@RequestMapping(value="/lock",method=RequestMethod.GET)
		public void lock(HttpSession session) {
			session.setAttribute("parkingLock", 0);
		}
}
