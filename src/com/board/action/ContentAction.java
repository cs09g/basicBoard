package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.ContentDao;

public class ContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		try{
			int idx = Integer.parseInt(request.getParameter("idx"));
			Board content = ContentDao.getInstance().getContent(idx);
			request.setAttribute("idx",  content.getIdx());
			request.setAttribute("writer",  content.getWriter());
			request.setAttribute("date",  content.getDate());
			request.setAttribute("ip",  content.getIp());
			request.setAttribute("count",  content.getCount()+1);
			ContentDao.getInstance().updateReadCount(idx);
			request.setAttribute("title",  content.getTitle());
			request.setAttribute("content",  content.getContent());
			request.setAttribute("filename", content.getFilename());
		}catch(Exception e){
			System.out.println("connection failed");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "content.jsp";
	}
}
