package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.User;

public class InsertDao extends Dao{
	public int insert(String user, String pass) throws Exception {
		List<User> list = new ArrayList<User>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"insert into members (user, pass) values(?, ?)");
		st.setString(1, user);
		st.setString(2, pass);
		int line = st.executeUpdate();
		
		
		
		st.close();
		con.close();
		
		return line;
	}
}
