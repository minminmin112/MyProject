package com.inc.servlet.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.encrypt.SHA256Encryptor;
import com.inc.vo.UserVo;

@WebServlet("/views/login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("../views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		id.replaceAll("--", "");
		String password = request.getParameter("password");
		password.replaceAll("--", "");

		password = SHA256Encryptor.shaEncrypt(password);
		
		System.out.println(id);
		System.out.println(password);

		UserVo uvo = UserDao.getInstance().selectOne(id);

		if (uvo == null) {
			request.setAttribute("msg", "존재하지 않는 아이디 입니다.");
			request.setAttribute("url", request.getContextPath() + "/views/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		} else if (!uvo.getPassword().equals(password)) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", request.getContextPath() + "/views/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("id", uvo.getId());
			request.getSession().setAttribute("name", uvo.getName());
			response.sendRedirect(request.getContextPath() + "/views/main");
		}
	}

}
