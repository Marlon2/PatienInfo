package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.com.model.PageBean;
import org.com.model.User;

public class UserDao {

	public User login(Connection con, User user) throws Exception {
		User resultUser = null;
		String sql = "select * from t_user where userName=? and UserPwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPwd());
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			resultUser = new User();
			resultUser.setUserId(Integer.parseInt(rs.getString("userId")));
			resultUser.setUserName(rs.getString("userName"));
			resultUser.setUserPwd(rs.getString("UserPwd"));
			resultUser.setRole(Integer.parseInt(rs.getString("role")));
		}
		return resultUser;
	}

	// 获取所有的用户
	public ResultSet userList(Connection con) throws Exception {
		String sql = "select * from t_user";
		PreparedStatement pstmt = con.prepareStatement(sql);
		return pstmt.executeQuery();
	}

	public ResultSet userList(Connection con, PageBean pageBean)
			throws Exception {
		StringBuffer sb = new StringBuffer("select * from t_user where 1=1");
		// 分页
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}

	public int userCount(Connection con) throws Exception {
		String sql = "select count(*) as total from t_user where 1=1";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

	public int doctorModify(Connection con, User user) throws Exception {
		String sql="update t_user set userName=?,userPwd=? where userId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPwd());
		pstmt.setInt(3, user.getUserId());
		return pstmt.executeUpdate();
	}

	public int doctorAdd(Connection con, User user) throws Exception {
		String sql="insert into t_user values(null,?,?,null)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getUserPwd());
		return pstmt.executeUpdate();
	}

	public int userDelete(Connection con, String delIds) throws Exception {
		String sql="delete from t_user where userId in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
}
