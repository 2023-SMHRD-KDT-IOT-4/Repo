package com.smhrd.bicycle;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.bicycle.converter.ImageToBase64;
import com.smhrd.bicycle.mapper.BoardMapper;
import com.smhrd.bicycle.model.Board;




//게시판 컨트롤러
@Controller
public class BoardController {
	
	@Autowired
	BoardMapper mapper;
	
	//글 작성 후 게시 버튼 누르면 db저장 -> 실패시 글 다 날아감
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute Board b, @RequestPart("photo") MultipartFile file, HttpSession session,
			          HttpServletRequest request) {
	
		//이미지 이름 랜덤 생성 -> UUID
		String newFileName = UUID.randomUUID().toString()+file.getOriginalFilename();
		//절대경로 변수에 저장
		String realPath = request.getSession().getServletContext().getRealPath("/img")+"\\";
		System.out.println(realPath);
		
		try {
			//절대경로에 파일저장
			file.transferTo(new File(realPath+newFileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		b.setComm_file(newFileName);
		
		b.setUser_id((String)session.getAttribute("user_id"));
		
		if(b.getUser_id()==null) {
			System.out.println("세션에 값 업슴");
		}else {
			System.out.println("굿");
		}
		
		int res = mapper.write(b);
		
		
		if(res>0) {
			return "redirect:/Board_01";
		}else {
			return "redirect:/Board_02";
		}
	}
	
	//글 상세보기
	@RequestMapping(value="/board/content/{comm_seq}", method=RequestMethod.GET)
	public String content(@PathVariable("comm_seq") String comm_seq, HttpSession session,Model model,HttpServletRequest request) {
		Board content = mapper.boardcontent(comm_seq);
		System.out.println(content.getComm_seq()+content.getComm_title()+content.getComm_content()+content.getComm_file()+content.getCreated_at()+content.getUser_id());

		String imgPath = request.getSession().getServletContext().getRealPath("/img")+"\\"+content.getComm_file();
		File imgFile = new File(imgPath);
		
		ImageToBase64 converter = new ImageToBase64();
		String encodeResult = converter.convert(imgFile);
		System.out.println(encodeResult);
		
        content.setComm_file(encodeResult);
        
        model.addAttribute("content",content);
        System.out.println(model.asMap().get("content"));
		
		return "BoardContent";
	}
	
	//글 삭제
	@RequestMapping(value="BoardDelete/{comm_seq}", method=RequestMethod.GET)
	public String BoardDelete(@PathVariable("comm_seq") int comm_seq,Model model) {
		int res = mapper.delete(comm_seq);
		
		if(res>0) {
			model.addAttribute("result", "success");
			return "redirect:/Board_01";
		}else {
			model.addAttribute("result", "fail");
			return "redirect:/Board_01";
		}
	}
}
