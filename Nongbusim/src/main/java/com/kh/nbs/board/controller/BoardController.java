package com.kh.nbs.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	//게시판리스트로 이동
	@RequestMapping("list.bo")
	public String TableBoardView() {
		return "board/TableBoardList";
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
}
