package com.kh.nbs.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	/*
	 * Interceptor(�젙�솗�엳 �몴�쁽�븯硫� HandlerInterceptor)
	 * 
	 * Controller媛� �떎�뻾�릺湲� �쟾, �떎�뻾�맂 �썑�뿉 �굾�븘梨꾩꽌 �떎�뻾�븷 �궡�슜�뱾 �옉�꽦 媛��뒫
	 * 濡쒓렇�씤 �쑀臾� �뙋�떒, �쉶�썝�쓽 沅뚰븳 泥댄겕
	 * 
	 * preHandle(�쟾泥섎━): �빖�뱾�윭 �샇異� �쟾 �굾�븘梨�
	 * postHandle(�썑泥섎━): �슂泥� 泥섎━ �썑 DispatcherServlet�씠 View�젙蹂대�� 諛쏄린 �쟾 �굾�븘梨�
	 * 
	 * 
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws IOException {
		// true 由ы꽩�떆 => 湲곗〈 �슂泥� �쓲由꾨�濡� Controller瑜� �젙�긽 �떎�뻾
		// false 由ы꽩�떆 => Controller �떎�뻾 X (以묎컙�뿉 議곌굔�떇�뿉�꽌 false�떆 諛붾줈 return�릺�꽌 紐삳꽆�뼱媛�)
		
		// �쁽�옱 �슂泥��쓣 蹂대궦 �궗�엺�씠 濡쒓렇�씤�씠 �릺�뼱�엳�쓣 寃쎌슦 => Controller �떎�뻾
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { // 濡쒓렇�씤 O
			return true;
		} else { // 濡쒓렇�씤 X
			session.setAttribute("alertMsg", "濡쒓렇�씤�떆 �씠�슜媛��뒫�빀�땲�떎.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}

}
