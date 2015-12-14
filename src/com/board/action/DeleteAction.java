package com.board.action;

import java.util.regex.Pattern;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;
import com.board.dao.DeleteDao;

public class DeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String title = request.getParameter("title"),
				writer = request.getParameter("writer"),
				content = request.getParameter("content");
			
		if(title == "" ||title == null) System.out.println("title�� null�Դϴ�.");
	 
		if(writer == "" ||writer == null)
		    System.out.println("writer�� null�Դϴ�.");   
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		    System.out.println("�̸��� ������ �ƴմϴ�.");
		 
		if(content == "" || content == null) System.out.println("content�� null�Դϴ�.");

		try{			
			int idx = Integer.parseInt(request.getParameter("idx"));
			DeleteDao.getInstance().deleteArticle(idx);
		}catch(Exception e){
			System.out.println("connection failed");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "list.do";
	}

}
