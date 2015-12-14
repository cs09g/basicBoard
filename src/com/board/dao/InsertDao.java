package com.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.board.beans.Board;

public class InsertDao extends CommonDao {
	public static InsertDao getInstance(){
		InsertDao _instance = new InsertDao();
		_instance.SetDB();
		return _instance;
	}
	
	public void insertArticle(Board article) throws SQLException{
		GetDB().insert("insertArticle", article);
	}
	
	public int getCurrentIdx() throws SQLException{
		return (int)GetDB().queryForObject("getCurrentIdx", null);
	}
}
