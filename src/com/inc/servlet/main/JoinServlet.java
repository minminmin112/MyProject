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

@WebServlet("/views/join")
public class JoinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("../views/join.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		password = SHA256Encryptor.shaEncrypt(password);

		System.out.println(id);
		System.out.println(password);
		System.out.println(name);

		UserVo uvo = new UserVo(id, password, name);
		uvo.setId(id);
		uvo.setPassword(password);
		uvo.setName(name);

		UserDao.getInstance().join(uvo);
		request.setAttribute("msg", "회원가입이 완료되었습니다. 메인페이지로 이동합니다.");
		request.setAttribute("url", "../views/main");
		request.getRequestDispatcher("/alert.jsp").forward(request, response);

		// response.sendRedirect(request.getContextPath() + "/main");

	}

}
