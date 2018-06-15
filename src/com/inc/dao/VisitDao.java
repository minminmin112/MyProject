package com.inc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.inc.util.DbCloser;
import com.inc.util.DbConnector;
import com.inc.vo.VisitVo;

public class VisitDao {
	private static VisitDao single;

	private VisitDao() {

	}

	public static VisitDao getInstance() {
		if (single == null) {
			single = new VisitDao();
		}
		return single;
	}

	public void insert(VisitVo vvo) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();

			String query = String.format("insert into visit values(seq_visit_id.nextval, '%s', '%s', systimestamp)",
					vvo.getU_id(), vvo.getContent());

			stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}
	}

	public ArrayList<VisitVo> selectList() {
		ArrayList<VisitVo> visitList = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from visit");
			while (rs.next()) {
				VisitVo vvo = new VisitVo(rs.getInt("id"), rs.getString("u_id"), rs.getString("content"),
						rs.getString("regdate").substring(0, 10));
				visitList.add(vvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}
		return visitList;
	}

	public void delete(int id) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			String query = "delete from visit where id = " + id;
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}
	}
}
