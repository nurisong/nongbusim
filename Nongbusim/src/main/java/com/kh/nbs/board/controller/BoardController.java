package com.kh.nbs.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.board.model.service.BoardService;
import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//게시판으로 이동
	@RequestMapping("list.bo")
	public ModelAndView selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage,
			@RequestParam(value="type") String boardType,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="condition", required=false, defaultValue="all") String condition,
			@RequestParam(value="order", required=false, defaultValue="recent") String order, ModelAndView mv) {
		/*
		System.out.println(boardType);
		System.out.println(condition);
		System.out.println(keyword);
		System.out.println(order);
		*/
		HashMap map= new HashMap();
		map.put("boardType", boardType);
		map.put("keyword", keyword);
		map.put("condition", condition);
		map.put("order", order);


		PageInfo pi= new PageInfo();

		if(boardType.charAt(0)=='S') {
						
			pi = Pagination.getPageInfo(boardService.selectListCount(map), currentPage, 10, 8);
			mv.addObject("at",boardService.attachmentSelectList()).setViewName("board/pictureBoardList");
			
		} else {
			
			pi = Pagination.getPageInfo(boardService.selectListCount(map), currentPage, 10, 5);
			mv.setViewName("board/tableBoardList");	
		}
		
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(map,pi)).addObject("type",boardType).addObject("con", map);
		return mv;
	}
	
	//글쓰기로 이동
	@RequestMapping("write.bo")
	public ModelAndView boardWrite(@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		mv.addObject("type", boardType).setViewName("board/boardWrite");
		return mv;
	}

	//게시글 조회
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(ModelAndView mv,@RequestParam(value="bno") int boardNo, @RequestParam(value="type") String boardType, HttpSession session) { // 키값과 똑같은 이름의 매개변수, int형으로 쓰면 알아서 파싱


		
		if(((Member)session.getAttribute("loginUser"))!=null) {
			int memNo=((Member)session.getAttribute("loginUser")).getMemNo();

			HashMap map = new HashMap();
			
			map.put("boardNo", boardNo);
			map.put("memNo", memNo);
			map.put("boardType", boardType);

			int result=boardService.selectLike(map);

			
			mv.addObject("result",result);
		}
		
		if(boardService.increaseCount(boardNo) > 0) {
			
			Board b=boardService.selectBoard(boardNo);
			ArrayList<Attachment> a= boardService.selectAttachmentDetailBoard(b);
			
			String content=b.getBoardContent();
			String delimiter="\\|nongbusim\\|";
			String[] contentArray=content.split(delimiter);
			
			mv.addObject("contentArray", contentArray);

			mv.addObject("a",a).addObject("b", b).setViewName("board/boardDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	//게시판 등록하기
	@RequestMapping("insert.bo")
	public ModelAndView insertBoard(Board b, MultipartFile[] upfiles, HttpSession session, ModelAndView mv, Attachment a) {
				
		String str1=b.getBoardContent().replace("\r\n","<br>");

		b.setBoardContent(str1);	
		
		if(boardService.insertBoard(b) > 0) {
			
			int boardNo = b.getBoardNo();
			
			for(MultipartFile upfile : upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					a.setBoardNo(boardNo);
					a.setBoardType(b.getBoardType());
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					boardService.insertAttachment(a);

						
				}
			}
		
			mv.addObject("type", b.getBoardType()).setViewName("redirect:list.bo");
			
		} else {
			// 첨부파일 삭제
		}
		
		return mv;
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 2022.12.38123.123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	//게시물 수정하기로 이동
	@RequestMapping("update.bc")
	public ModelAndView updateBoard(@RequestParam(value="type") String boardType,@RequestParam(value="bno") int boardNo, ModelAndView mv) {
		
		Board b=boardService.selectBoard(boardNo);
		ArrayList<Attachment> a= boardService.selectAttachmentDetailBoard(b);

		String content=b.getBoardContent();
		String delimiter="\\|nongbusim\\|";
		String[] contentArray=content.split(delimiter);
		
		for (int i = 0; i < contentArray.length; i++) {
		    System.out.println(contentArray[i]);
		}
		ArrayList<String> contentList = new ArrayList<String>(Arrays.asList(contentArray));

		
		mv.addObject("contentList", contentList);		
	
		mv.addObject("type", boardType).addObject("b",b).addObject("a",a).setViewName("board/boardUpdateForm");
		
		return mv;
	}
	
	//게시글 수정
	@RequestMapping("updateForm.bo")
	public ModelAndView updateFormBoard(Board b, MultipartFile[] upfiles, HttpSession session, ModelAndView mv, Attachment a) {
		System.out.println(a.getChangeName());
		
		String str1=b.getBoardContent().replace("\r\n","<br>");
		b.setBoardContent(str1);

		for(MultipartFile upfile: upfiles) {
			
			if(!upfile.getOriginalFilename().equals("")) {

				a.setBoardNo(b.getBoardNo());
				a.setBoardType(b.getBoardType());
				a.setOriginName(upfile.getOriginalFilename());
				a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));

				boardService.updateAttachment(a);
			} 
		}
		
		boardService.updateBoard(b);
		
		mv.addObject("type", b.getBoardType()).setViewName("redirect:list.bo");
		
		return mv;
	}
		

	
	
	//게시글 삭제
	@RequestMapping("delete.bo")
	public ModelAndView deleteBoard(int boardNo, String boardType,ModelAndView mv) {
		
		Board b= new Board();
		b.setBoardNo(boardNo);
		b.setBoardType(boardType);
		
		
		if(boardService.deleteBoard(b)>0) {
			System.out.println("게시글 삭제 성공");
		}
		
		mv.addObject("type",boardType).setViewName("redirect:list.bo");
		
		return mv;
	}
	
	//좋아요 입력
	@ResponseBody
	@RequestMapping("insert.lk")
	public void insertLike(String boardType, int boardNo, int memNo) {
		Board b= new Board();
		b.setBoardNo(boardNo);
		b.setBoardType(boardType);
		b.setMemNo(memNo);
		
	
		
		boardService.insertLike(b);
		boardService.increaseLike(b);
		
	}
	
	//좋아요 삭제
	@ResponseBody
	@RequestMapping("delete.lk")
	public void deleteLike(String boardType, int boardNo, int memNo) {
		Board b= new Board();
		b.setBoardNo(boardNo);
		b.setMemNo(memNo);
		b.setBoardType(boardType);
		
		boardService.decreaseLike(b);
		boardService.deleteLike(b);
		
	};
	
	
	
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		return new Gson().toJson(boardService.selectReplyList(bno));
	}
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Comment c) {
		return boardService.insertReply(c) > 0 ? "success" : "fail";
	}
	
	
	
	
	
	
	
		
}
