package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.bean.User;
import jp.co.aforce.dao.AdminDao;

@WebServlet(urlPatterns= {"/jp.co.aforce.servlets/admin"})
public class AdminServlet extends HttpServlet{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		 ) throws ServletException, IOException{
		System.out.println("ログイン開始");
		PrintWriter out = response.getWriter();
		try {
			
			//DBのユーザー情報を全取得
			AdminDao dao = new AdminDao();
			//AdminDaoのAdminSearchメソッドを呼び出す
			List<User> allList = dao.AdminSearch();
			
			request.setAttribute("ALLLIST", allList);
			request.getRequestDispatcher("../jsp/admin.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}

}
