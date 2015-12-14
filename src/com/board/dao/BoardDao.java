package com.board.dao;

import java.sql.*;
import java.util.ArrayList;

import com.board.beans.Board;

public class BoardDao extends CommonDao{
	public static BoardDao getInstance(){
		BoardDao _instance = new BoardDao();
		_instance.SetDB();
		return _instance;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Board> getArticleList(int page) throws SQLException{
		return (ArrayList<Board>)GetDB().queryForList("getArticleList", null, page, 10);
	}
	
	public Board getArticle(int idx) throws SQLException{
		return (Board)GetDB().queryForObject("getArticle", idx);
	}
	
	public void setReadCount(int idx) throws SQLException{
		GetDB().update("setReadCount",  idx);
	}
	/*
	public int getNumberOfPage(int numOfArticlesInOnePage) throws SQLException{
		ResultSet rs = null;
		String sql = "select count(idx) as `cnt` from board";
		rs = openConnection().executeQuery(sql);
		int numberOfPage = 1;
		
		while(rs.next()){
			numberOfPage = rs.getInt("cnt")/numOfArticlesInOnePage;
		}
		
		return numberOfPage;
	}
	
	public int getReadCount(int idx) throws SQLException{
		int cnt = 0;
		ResultSet rs = null;
		String sql = "select idx from board where idx="+idx;
		rs = openConnection().executeQuery(sql);
		
		while(rs.next()){
			cnt = rs.getInt("count");
		}
		return cnt;
	}
	
	public void setReadCount(Board article) throws SQLException{
		ResultSet rs = null;
		String sql = "update table board ("
	}
	
	public Board getArticle(int idx) throws SQLException{
		ResultSet rs = null;
		String sql = "select * from board where id="+idx;
		Board article = null;
		rs = openConnection().executeQuery(sql);
		while(rs.next()){
			article.setIdx(rs.getInt("idx"));
			article.setTitle(rs.getString("title"));
			article.setWriter(rs.getString("writer"));
			article.setDate(rs.getString("date"));
			article.setCount(rs.getInt("count"));
			article.setContent(rs.getString("content"));
		}
		
		return article;
	}
	*/
}
