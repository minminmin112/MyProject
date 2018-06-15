package com.inc.servlet.visit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.VisitDao;
import com.inc.vo.VisitVo;

@WebServlet("/visit/insert")
public class VisitInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/visit.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String u_id = request.getParameter("u_id");
		String content = request.getParameter("content");
		System.out.println(u_id);
		System.out.println(content);
		VisitVo vvo = new VisitVo();

		vvo.setU_id(u_id);
		vvo.setContent(content);

		VisitDao.getInstance().insert(vvo);
		response.sendRedirect(request.getContextPath() + "/views/visit?id= " + u_id);

	}

}
