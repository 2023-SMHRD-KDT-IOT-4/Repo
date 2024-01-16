package com.smhrd.bicycle;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.bicycle.mapper.UserMapper;
import com.smhrd.bicycle.model.User;

// 회원가입, 로그인, 로그아웃
@Controller
public class UserController {
	
	
	@Autowired // 의존성 주입
	UserMapper mapper;
	
	//로그인
	@RequestMapping(value="loginClick"  , method=RequestMethod.POST)
	public String loginclick(@RequestParam("user_id") String user_id , @RequestParam("user_pw") String user_pw, HttpSession session, HttpServletResponse response) throws IOException {
		
		User user = new User(user_id, user_pw);
		User result = mapper.login(user);
		
		if (result == null) { // 로그인 실패
			return "redirect:/login";
		} else { // 로그인 성공
			 session.setAttribute("user_id", result.getUser_id());
			 session.setAttribute("user_name", result.getUser_name());
			 return "redirect:/";
		}


	}
	
	// 로그아웃
	@RequestMapping(value="logoutClick" , method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	//회원가입
	@RequestMapping(value="/joinClick", method=RequestMethod.POST)
	public String join(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
						@RequestParam("user_birthdate") String user_birthdate, @RequestParam("user_name") String user_name,
						@RequestParam("user_profile_img") MultipartFile file, HttpServletRequest request) {
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

		user.setUser_profile_img(newFileName);
		
		int res = mapper.join(user);
		
		//result값을 jsp에서 받아서 성공했다면 db값 들어갔으니 메인페이로 이동, 실패했다면 페이지이동없이 실패 문구 띄워줌
		if(res>0) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
		
	}
	
		  //회원정보수정
	   	  @RequestMapping(value="update" , method=RequestMethod.POST)
	      public String update(HttpServletRequest request, @RequestParam("pw") String pw, @RequestParam("name1") String name1, @RequestPart("pimg") MultipartFile pimg, HttpSession session) {

		      // session에서 이메일 가져오기
		      String user = (String)session.getAttribute("user_id"); // ("member") 위에 로그인 부분 session.setAttribute("member", result);
		      String newFileName = UUID.randomUUID().toString()+pimg.getOriginalFilename();
		      String realPath = request.getSession().getServletContext().getRealPath("/img")+"\\";
		      
		      try {
		         //절대경로에 파일저장
		         pimg.transferTo(new File(realPath+newFileName));
		      } catch (IllegalStateException e) {
		         e.printStackTrace();
		      } catch (IOException e) {
		         e.printStackTrace();
		      }
		      
		      User member = new User(pw, name1,newFileName);
		      
		      member.setUser_id(user);
		      
		      int result = mapper.updateUserInfo(member);
		     
		      // 결과처리
		      if (result <= 0) { // 수정 실패
		         return "redirect:/update";
		      } else { // 수정 성공
		         return "redirect:/";
		      }

	      }
	
}
