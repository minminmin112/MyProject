package com.inc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.inc.util.DbCloser;
import com.inc.util.DbConnector;
import com.inc.vo.UserVo;

public class UserDao {

	private static UserDao single;

	private UserDao() {

	}

	public static UserDao getInstance() {
		if (single == null) {
			single = new UserDao();
		}
		return single;
	}

	public void join(UserVo uvo) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			
			String query = String.format("insert into users values('%s', '%s', '%s')", uvo.getId(), uvo.getPassword(),
					uvo.getName());
			
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}

	}

	public UserVo selectOne(String id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		UserVo uvo = null;
		
		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from users where id = '" + id + "'");
			if (rs.next()) {
				uvo = new UserVo(rs.getString("id"), rs.getString("password"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}
		return uvo;
	}

	public int getIdCount(String id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(id) from users where id = '" + id + "'");
			rs.next();
			count = rs.getInt("count(id)");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}
		return count;
	}

}
