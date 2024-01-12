package com.smhrd.bicycle;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.bicycle.mapper.UserMapper;
import com.smhrd.bicycle.model.User;

@Controller
public class UserRestController {
	
	@Autowired
	UserMapper mapper;
		
		//비동기 통신 회원가입(회원가입 제출 버튼 누를 시)
		@RequestMapping(value="joinClick", method=RequestMethod.POST)
		public @ResponseBody String write(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
							@RequestParam("user_birthdate") String user_birthdate, @RequestParam("user_name") String user_name,
							@RequestParam("user_profile_img") MultipartFile file, HttpServletRequest request) {
							//joined_at / user_role 안받아옴
			
			//이미지 이름 랜덤 생성 -> UUID
			String newFileName = UUID.randomUUID().toString()+file.getOriginalFilename();
			//절대경로 변수에 저장
			String realPath = request.getSession().getServletContext().getRealPath("/img")+"\\";
			
			User user = new User(user_id,user_pw,user_birthdate,user_name);
			
			try {
				//절대경로에 파일저장
				file.transferTo(new File(realPath+newFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			user.setUserProfileImg(newFileName);
			
			int res = mapper.join(user);
			
			//result값을 jsp에서 받아서 성공했다면 db값 들어갔으니 메인페이로 이동, 실패했다면 페이지이동없이 실패 문구 띄워줌
			if(res>0) {
				return "success";
			}else {
				return "fail";
			}
			
		}
}
