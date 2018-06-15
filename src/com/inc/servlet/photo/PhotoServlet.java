package com.inc.servlet.photo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;

@WebServlet("/views/photo")
public class PhotoServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<PhotoVo> photoList = PhotoDao.getInstance().selectList();
		request.setAttribute("photoList", photoList);
		request.getRequestDispatcher("../views/photo.jsp").forward(request, response);
	}

}
