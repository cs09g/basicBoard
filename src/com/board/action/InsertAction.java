package com.board.action;

import java.sql.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.InsertDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		MultipartRequest multi = null;
		int sizeLimit = 10*1024*1024;
		String savePath = request.getRealPath("/upload");
		try{
			multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());			
		}catch(Exception e){
			e.printStackTrace();
		}
		String filename = multi.getFilesystemName("filename");
		
		String title = request.getParameter("title"),
				writer = request.getParameter("writer"),
				content = request.getParameter("content"),
				ip = request.getRemoteAddr();
		int count = 0;

		if(title == "" ||title == null) System.out.println("title이 null입니다.");
	 
		if(writer == "" ||writer == null)
		    System.out.println("writer가 null입니다.");   
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		    System.out.println("이메일 형식이 아닙니다.");
		 
		if(content == "" ||content == null) System.out.println("content가 null입니다.");
		
		if(ip != request.getParameter("ip")){
			count++;
		}
		
		try{
			Board article = new Board();
			article.setIdx(InsertDao.getInstance().getCurrentIdx());
			article.setCount(count);
			article.setIp(ip);
			article.setWriter(writer);
			article.setContent(content);
			article.setTitle(title);
			InsertDao.getInstance().insertArticle(article);
		}catch(Exception e){
			System.out.println("connection failed");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return "list.do";
	}

}
