package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.User;

public class DeleteDao extends Dao{
	public int delete(Integer uId, String user) throws Exception {
		List<User> list = new ArrayList<User>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"delete from members where id = ? and user = ?");
		st.setInt(1, uId);
		st.setString(2, user);
		int line = st.executeUpdate();
		
		
		
		st.close();
		con.close();
		
		return line;
	}

}
