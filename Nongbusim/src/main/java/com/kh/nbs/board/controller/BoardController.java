package com.kh.nbs.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.board.model.service.BoardService;
import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	
	//게시판으로 이동
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		PageInfo pi= new PageInfo();

		if(boardType.charAt(0)=='S') {
			
			pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 8);			
			mv.addObject("at",boardService.attachmentSelectList()).setViewName("board/pictureBoardList");
		} else {
			
			pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 5);
			mv.setViewName("board/tableBoardList");	
		}
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).addObject("type",boardType);
		
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
	public ModelAndView selectBoard(ModelAndView mv,@RequestParam(value="bno") int boardNo) { // 키값과 똑같은 이름의 매개변수, int형으로 쓰면 알아서 파싱

		if(boardService.increaseCount(boardNo) > 0) {
			
			Board b=boardService.selectBoard(boardNo);
			ArrayList<Attachment> a= boardService.selectAttachmentDetailBoard(b);
			

			mv.addObject("a",a).addObject("b", b).setViewName("board/boardDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	//게시판 등록하기
	@RequestMapping("insert.bo")
	public ModelAndView insertBoard(Board b, MultipartFile[] upfiles, HttpSession session, ModelAndView mv, Attachment a) {
		
		if(boardService.insertBoard(b) > 0) {
			
			int boardNo = b.getBoardNo();
			
			for(MultipartFile upfile : upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					a.setBoardNo(boardNo);
					a.setBoardType(b.getBoardType());
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					if(boardService.insertAttachment(a) > 0) {
						mv.addObject("type", b.getBoardType()).setViewName("redirect:/");
					} else {
						mv.setViewName("common/errorPage");
					}
						
				}
			}
		
			mv.setViewName("redirect:/");
			
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
	
	//게시물 수정하기
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(@RequestParam(value="type") String boardType,@RequestParam(value="bno") int boardNo, ModelAndView mv) {
		
		Board b=boardService.selectBoard(boardNo);
		ArrayList<Attachment> a= boardService.selectAttachmentDetailBoard(b);		
		
		mv.addObject("type", boardType).addObject("b",b).addObject("a",a).setViewName("board/boardUpdate");
		
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("delete.bo")
	public ModelAndView deleteBoard(int boardNo, String boardType,ModelAndView mv) {
		
		Board b= new Board();
		b.setBoardNo(boardNo);
		b.setBoardType(boardType);
		
		if(boardService.deleteAttachment(b)>0) {
			System.out.println("첨부파일 삭제 성공");
		}
		
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
		
		
	}
	
	//좋아요 삭제
	@ResponseBody
	@RequestMapping("delete.lk")
	public void deleteLike(int boardNo, int memNo) {
		Board b= new Board();
		b.setBoardNo(boardNo);
		b.setMemNo(memNo);
		
		boardService.deleteLike(b);
		
	};
	
	//좋아요 개수 조회
	@RequestMapping("selectCount.lk")
	public String selectLikeCount() {
		return "";
	}
	
		
}
