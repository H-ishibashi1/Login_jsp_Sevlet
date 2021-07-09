package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.User;

public class AdminDao extends Dao{
	public List<User> AdminSearch() throws Exception {
		List<User> list = new ArrayList<User>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"select * from members");
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			User p = new User();
			p.setId(rs.getInt("id"));
			p.setUser(rs.getString("user"));
			p.setPass(rs.getString("pass"));
			list.add(p);
		}
		
		st.close();
		con.close();
		
		return list;
	}

}
