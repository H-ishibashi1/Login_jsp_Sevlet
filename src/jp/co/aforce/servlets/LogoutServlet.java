package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.User;
import jp.co.aforce.tool.Page;

@WebServlet(urlPatterns= {"/jp.co.aforce.servlets/logout"})
public class LogoutServlet extends HttpServlet{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		 ) throws ServletException, IOException{
		System.out.println("ログアウト開始");
		PrintWriter out = response.getWriter();
		Page.header(out);
		HttpSession ses = request.getSession();
		
		List<User> list = (List<User>)ses.getAttribute("LIST");
		
		//ユーザー情報のセッションを削除し、トップ画面に戻る
		ses.removeAttribute("LIST");
		ses.setAttribute("OUT", "out");
		request.getRequestDispatcher("../jsp/top.jsp").forward(request, response);
	}

}
