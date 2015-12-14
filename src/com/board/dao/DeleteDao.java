package com.board.dao;

import java.sql.*;

public class DeleteDao extends CommonDao{
	public static DeleteDao getInstance(){
		DeleteDao _instance = new DeleteDao();
		_instance.SetDB();
		return _instance;
	}
	
	public void deleteArticle(int idx) throws SQLException{
		GetDB().delete("deleteArticle", idx);
		
	}
}
