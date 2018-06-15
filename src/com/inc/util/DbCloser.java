package com.inc.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbCloser {
	public static void close(Connection conn,
			                 Statement stmt,
			                 ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stmt != null) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn != null) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
