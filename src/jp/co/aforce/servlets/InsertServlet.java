package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.InsertDao;

@WebServlet(urlPatterns= {"/jp.co.aforce.servlets/insert"})
public class InsertServlet extends HttpServlet{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		 ) throws ServletException, IOException{
		System.out.println("登録開始");
		PrintWriter out = response.getWriter();
		try {
			//会員登録画面から情報を取得
			String user = request.getParameter("insertUser");
			String pass = request.getParameter("insertPass");
			
			//DBのユーザー情報を全取得
			InsertDao dao = new InsertDao();
			//UserDaoのsearchメソッドを呼び出す
			int line = dao.insert(user, pass);
			
			if(line > 0) {
				System.out.println("追加に成功しました。");
			}
			
			request.getRequestDispatcher("../jsp/login.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		
	}

}
