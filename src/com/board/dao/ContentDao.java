package com.board.dao;

import java.sql.*;

import com.board.beans.Board;

public class ContentDao extends CommonDao{
	public static ContentDao getInstance(){
		ContentDao _instance = new ContentDao();
		_instance.SetDB();
		return _instance;
	}
	
	public Board getContent(int idx) throws SQLException{
		return (Board)GetDB().queryForObject("getContent", idx);
	}
}
