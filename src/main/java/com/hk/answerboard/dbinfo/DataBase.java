package com.hk.answerboard.dbinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//JDBC6단계중 공통으로 들어가는 1,2,6단계
public class DataBase {
	
	//1단계
	public DataBase() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1단계");
		} catch (ClassNotFoundException e) {
			log("1단계",e);
		}
	}
	//2단계
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="HK";
		String password="HK";
		conn = DriverManager.getConnection(url, user, password);
		
		
		return conn;
	}
	
	//6단계
	
	public void close(ResultSet rs,PreparedStatement psmt,Connection conn) {
		
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			log("6단계");
		} catch (SQLException e) {
			log("6단계", e);
		}
	}
	
	
	
	
	//jdbc성공했을때 
	public void log(String msg) {
		System.out.println(msg+"성공!!"+getClass());
	}
	
	
	//jdbc실패했을때 
	public void log(String msg,Exception e) {
		System.out.println(msg+"실패!!"+getClass()+":"+e);
	}
}
