package com.inc.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnector {
	private DataSource ds = null;
	
	private static DbConnector single;
	
	private DbConnector() {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup(
					"java:comp/env/jdbc/oracle_xe");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static DbConnector getInstance() {
		if(single == null) {
			single = new DbConnector();
		}
		return single;
	}
	
	public Connection getConnection(){
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
}




