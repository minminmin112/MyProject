package com.inc.servlet.visit;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.VisitDao;
import com.inc.vo.VisitVo;

@WebServlet("/views/visit")
public class VisitServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<VisitVo> visitList = VisitDao.getInstance().selectList();
		request.setAttribute("visitList", visitList);
		request.getRequestDispatcher("../views/visit.jsp").forward(request, response);
	}

}