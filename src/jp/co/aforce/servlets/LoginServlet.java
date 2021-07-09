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
import jp.co.aforce.dao.UserDao;

@WebServlet(urlPatterns= {"/jp.co.aforce.servlets/login"})
public class LoginServlet extends HttpServlet{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		 ) throws ServletException, IOException{
		System.out.println("ログイン開始");
		PrintWriter out = response.getWriter();
		HttpSession ses = request.getSession();
		try {
			//各画面から来た時すでにログイン済みだったらそのことを知らせる
			if(ses.getAttribute("LIST") != null) {
				ses.setAttribute("FALSE", "true");
				request.getRequestDispatcher("../jsp/login.jsp").forward(request, response);
			}
			
			//ログイン画面から情報を取得
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			
			//DBのユーザー情報を全取得
			UserDao dao = new UserDao();
			//UserDaoのsearchメソッドを呼び出す
			List<User> list = dao.search(user, pass);
			
			//DBに登録済みかを判定(list.size == 0だった場合は登録されていない)
			System.out.println(list);
			if(list.size() != 0) {
				//管理者ログインか判定
				for(User u : list){
					if(u.getUser().equals("Admin")) {
						request.getRequestDispatcher("/jp.co.aforce.servlets/admin").forward(request, response);
					}
				}
				//ログイン成功(次の画面へ)
				//ログインに成功したらログアウトセッションを削除
				ses.removeAttribute("OUT");
				
				//ユーザー情報はセッションへ
				ses.setAttribute("LIST", list);
				request.getRequestDispatcher("../jsp/top.jsp").forward(request, response);
			}else {
				//ログイン失敗(元の画面へ)
				ses.setAttribute("FALSE", "false");
				request.getRequestDispatcher("../jsp/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}
}
