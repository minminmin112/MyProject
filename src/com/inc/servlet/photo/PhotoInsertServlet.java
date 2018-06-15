package com.inc.servlet.photo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/views/insert")
public class PhotoInsertServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("../views/photo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String webPath = "/upload/";
		String realPath = request.getServletContext().getRealPath(webPath);
		MultipartRequest mr = new MultipartRequest(request, realPath, 10 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());

		String u_id = mr.getParameter("u_id");
		String content = mr.getFile("content").getName();

		File file = mr.getFile("content");
		String filename = "nofile";
		if (file != null) {
			filename = file.getName();
			if (!filename.endsWith(".jpg") && !filename.endsWith(".png") && !filename.endsWith(".gif")) {
				file.delete();
				request.setAttribute("msg", "이미지 이외의 파일은 업로드 할 수 없습니다.");
				request.setAttribute("url", "/views/photo");
				request.getRequestDispatcher("/views/error.jsp").forward(request, response);
				return;
			}
		}

		PhotoVo pvo = new PhotoVo(0, u_id, content, realPath, null);
		PhotoDao.getInstance().insert(pvo);

		response.sendRedirect("photo");
	}

}
