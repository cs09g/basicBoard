package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class CountAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int idx = Integer.parseInt(request.getParameter("idx"));
		Board article = BoardDao.getInstance().getArticle(idx);
		String ip = request.getRemoteAddr();
		
		if(!ip.equals(article.getIp())){
			int cnt = article.getCount();
			article.setCount(cnt++);
			BoardDao.getInstance().setReadCount(article);
		}
		request.setAttribute("url", "content.do?idx="+idx);
		return "redirect.jsp";
	}
	
}
