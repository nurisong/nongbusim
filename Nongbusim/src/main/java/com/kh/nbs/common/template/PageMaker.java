package com.kh.nbs.common.template;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount; // 게시글 총 갯수
    private int startPage; // 10개의 페이지중 첫번째
    private int endPage; // 10개의 페이지중 마지막
    private boolean prev; // 페이지 이전 버튼
    private boolean next; // 페이지 다음 버튼
    private int displayPageNum = 10;
    private Criteria cri; // 페이지 정보 객체

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public Criteria getCri() {
        return cri;
    }

    private void calcData() { // 페이지 데이터 처리
        // 1~10 페이지는 endPage가 10으로 고정되고 11~20 페이지는 endPage가 20으로 고정되는 방식
        endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
        // startPage는 매 첫번째 페이지
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage; 
            // 마지막 게시물이 있는 페이지가 endPage로 다시 할당해준다.
        }
        prev = startPage == 1 ? false : true; 
        // 첫번째 페이지가 1이면 false를 반환하여 이전버튼이 사라지게 한다.
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;            // 마지막페이지의 게시글이 10개 이하면 false를 반환.
    }



    public String makeQuery(int page) {  
    // 원하는 페이지로 페이지 쿼리문을 날려준다.
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                .queryParam("page", page) // page번호를 파라미터값으로 날려준다.
//                .queryParam("perPageNum", cri.getPerPageNum()) // page당 게시글 갯수를 파라미터값으로 날려준다.
                .build(); 
        return uriComponents.toUriString();  
    }

}
