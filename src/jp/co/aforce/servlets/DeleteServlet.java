package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.DeleteDao;

@WebServlet(urlPatterns= {"/jp.co.aforce.servlets/delete"})
public class DeleteServlet extends HttpServlet{
	public void doGet (
			HttpServletRequest request, HttpServletResponse response
		 ) throws ServletException, IOException{
		System.out.println("削除開始");
		PrintWriter out = response.getWriter();
		try {
			//管理者画面から情報を取得
			int uId = Integer.parseInt(request.getParameter("uId"));
			String user = request.getParameter("user");
			
			//UserDaoのsearchメソッドを呼び出す
			DeleteDao dao = new DeleteDao();
			int line = dao.delete(uId, user);
			
			if(line > 0) {
				request.setAttribute("DELETE", "true");
			}else {
				request.setAttribute("DELETE", "false");
			}
			request.getRequestDispatcher("admin").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}

}
