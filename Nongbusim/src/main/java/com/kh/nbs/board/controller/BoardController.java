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

	
	//게시판리스트로 이동(페이징+리스트 조회, 미완성:like조회x)
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		System.out.println(currentPage);
		System.out.println(boardType);
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 5);
		System.out.println(pi.getCurrentPage());
		System.out.println(pi.getListCount());
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).addObject("btype",boardType).setViewName("board/tableBoardList");
		
		return mv;
	}
	
	//자랑게시판으로 이동
	@RequestMapping("picture.bo")
	public ModelAndView pictureBoardView(@RequestParam(value="cpage", defaultValue="1") int currentPage,@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 8);
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).addObject("btype",boardType).setViewName("board/pictureBoardList");
		
		return mv;
	}
	
	//게시판 글쓰기로 이동
	@RequestMapping("write.bo")
	public ModelAndView boardWrite(@RequestParam(value="wtype") String boardType, ModelAndView mv) {
		
		System.out.println(boardType);
		
		mv.addObject("btype", boardType).setViewName("board/boardWrite");
		return mv;
	}
	
	
	
	//게시판 게시물로 이동
	@RequestMapping("detail.bo") 
	public String boardDetailView() {
		return "board/boardDetailView";
	}
	/*
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(ModelAndView mv, int bno) { // 키값과 똑같은 이름의 매개변수, int형으로 쓰면 알아서 파싱
		// 식별하는데 필요한 값을 가지고 DB에 가서 조건문의 어떤 조건으로 쓰여야함
		// 해당 게시글 조회수 증가용 서비스 호출 결과 받기(update문)
		if(boardService.increaseCount(bno) > 0) {
			mv.addObject("b", boardService.selectBoard(bno)).setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		}
		// >> 성공적으로 조회수 증가
		// 	>> boardDetailView.jsp상에 필요한 데이터를 조회(게시글 상세정보 조회용 서비스 호출)
		// 		>> 조회된 데이터를 담아서 board/boardDetailView로 포워딩
		
		// >> 조회수 증가 실패
		// 	>> 에러문구 담아서 에러페이지로 포워딩
		return mv;
	}
	*/
	
	
	//게시판 등록하기(일단 테이블게시판)
	/*
	@RequestMapping("insert.bo")
	public String insertBoard() {
		
	};
	*/
	
	//게시판 등록하기(일단 테이블게시판)
	/*
	MultipartFile[] upfile
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		//System.out.println(b);
		//System.out.println(upfile); 첨부파일이 선택 O / 선택 X 객체가 무조건 생성!(차이점은 filename에 원본명이 존재하는가, ""인가)
		
		// 전달된 파일이 있을경우 => 파일명 수정 작업 후 서버 업로드
		// => 원본명, 서버에 업로드된 경로를 b에 이어서 담기(파일이 존재할 경우에만)
		if(!upfile.getOriginalFilename().equals("")) { // getOriginalFileName == filename필드의 값을 반환함
			
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
			
			b.setOriginName(upfile.getOriginalFilename()); //원본명
			b.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
		}
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있을 경우 b : 제목, 작성자, 내용 + 파일원본명, 파일저장경로
		
		if(boardService.insertBoard(b) > 0) { // 성공 => 게시글 리스트 페이지
			// 포워딩 => boardListView.jsp 이 방법은 못씀 XXXX  리스트 조회 불가능
			session.setAttribute("alertMsg", "게시글 등록 성공 ~ ");
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg", "게시글 작성에 실패했어요...ㅠ");
			return "common/errorPage";
		}
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
	*/
	
}
