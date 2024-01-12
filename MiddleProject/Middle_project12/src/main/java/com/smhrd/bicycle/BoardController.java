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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.bicycle.mapper.BoardMapper;
import com.smhrd.bicycle.model.Board;

import cpm.smhrd.bicycle.converter.ImageToBase64;




//게시판 컨트롤러
@Controller
public class BoardController {
	
	@Autowired
	BoardMapper mapper;
	
	//글 작성 후 게시 버튼 누르면 db저장 -> 실패시 글 다 날아감
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute Board b, @RequestPart("photo") MultipartFile file, 
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
		
		int res = mapper.write(b);
		
		
		if(res>0) {
			return "redirect:/게시판 리스트.jsp";
		}else {
			return "redirect:/현재페이지.jsp";
		}
	}
	
	//글 상세보기
	@RequestMapping(value="/#/{comm_suq}", method=RequestMethod.GET)
	public String content(@PathVariable("comm_suq") String comm_suq, HttpSession session,Model model,HttpServletRequest request) {
		Board content = mapper.boardcontent(comm_suq);

		String imgPath = request.getSession().getServletContext().getRealPath("/img")+"\\"+content.getComm_file();
		File imgFile = new File(imgPath);
		
		ImageToBase64 converter = new ImageToBase64();
		String encodeResult = converter.convert(imgFile);
		System.out.println(encodeResult);
		
        content.setComm_file(encodeResult);
        model.addAttribute("content",content);
		
		return "글 상세보기.jsp";
	}
	
	//글 삭제
	@RequestMapping(value="#@!", method=RequestMethod.GET)
	public String delete(@RequestParam("comm_suq") String comm_suq,Model model) {
		int res = mapper.delete(comm_suq);
		
		if(res>0) {
			model.addAttribute("result", "success");
			return "게시판 리스트.jsp";
		}else {
			model.addAttribute("result", "fail");
			return "게시판 리스트.jsp";
		}
	}
}
