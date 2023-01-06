package com.kh.nbs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.board.model.service.BoardService;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	//게시판리스트로 이동(페이징+리스트 조회)
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String boardType, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 5);
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).setViewName("board/TableBoardList");
		
		return mv;
	}
	
	//자랑게시판으로 이동
	@RequestMapping("picture.bo")
	public String PictureBoardView() {
		return "board/PictureBoardList";
	}
	
	//게시판 글쓰기로 이동
	@RequestMapping("write.bo")
	public String BoardWrite() {
		return "board/BoardWrite";
	}
	
	//게시판 게시물로 이동
	@RequestMapping("detail.bo") 
	public String BoardDetailView() {
		return "board/BoardDetailView";
	}
	
	//페이징 처리
	
}
