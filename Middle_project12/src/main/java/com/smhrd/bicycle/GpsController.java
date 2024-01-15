package com.smhrd.bicycle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.bicycle.mapper.ArduinoMapper;
import com.smhrd.bicycle.mapper.BoardMapper;
import com.smhrd.bicycle.model.Board;
import com.smhrd.bicycle.model.Gps;

@Controller
public class GpsController {
	
	@Autowired
	ArduinoMapper mapper;
	
	@RequestMapping(value="/data2", method=RequestMethod.GET)
	public String data2(Model model,@RequestParam("created_at") String created_at, ObjectMapper objectMapper) {
		System.out.println(created_at);
		
		List<Gps> list = mapper.rideRecode(created_at);
		
		System.out.println(list.size());
		
		try {
	        String jsonString = objectMapper.writeValueAsString(list);
	        System.out.println("JSON String: " + jsonString);
	        model.addAttribute("GpsList", jsonString);
	    } catch (JsonProcessingException e) {
	        // 예외 처리
	        e.printStackTrace();
	        // 에러 메시지를 모델에 추가하여 JSP에서 확인 가능하도록 전달
	        model.addAttribute("error", "Error processing JSON");
	    }
		
		return "Data";
	}
	
}
