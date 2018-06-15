package com.inc.servlet.photo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;

@WebServlet("/photo/delete")
public class PhotoDeleteServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
		PhotoDao.getInstance().delete(id);
		response.getWriter().print("");

	}

}
