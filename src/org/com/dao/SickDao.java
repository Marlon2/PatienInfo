package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.com.model.PageBean;
import org.com.model.Sick;
import org.com.util.StringUtil;

public class SickDao {

	public ResultSet sickList(Connection con, PageBean pageBean, Sick sick) throws Exception {
		StringBuffer sb = new StringBuffer("select * from t_sick where 1=1");
		if (StringUtil.isNotEmpty(sick.getSickName())) {
			sb.append(" and sickName like '%" + sick.getSickName() + "%'");
		}
		if (StringUtil.isNotEmpty(sick.getTrueName())) {
			sb.append(" and trueName like '%" + sick.getTrueName() + "%'");
		}
		if (StringUtil.isNotEmpty(sick.getSex())) {
			sb.append(" and sex like '%" + sick.getSex() + "%'");
		}
		if (sick.getAge() != 0) {
			sb.append(" and age = " + sick.getAge());
		}
		// 分页
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}

	public int sickCount(Connection con, Sick sick) throws Exception {
		StringBuffer sb=new StringBuffer("select count(*) as total from t_sick where 1=1");
		if (StringUtil.isNotEmpty(sick.getSickName())) {
			sb.append(" and sickName like '%" + sick.getSickName() + "%'");
		}
		if (StringUtil.isNotEmpty(sick.getTrueName())) {
			sb.append(" and trueName like '%" + sick.getTrueName() + "%'");
		}
		if (StringUtil.isNotEmpty(sick.getSex())) {
			sb.append(" and sex like '%" + sick.getSex() + "%'");
		}
		if (sick.getAge() != 0) {
			sb.append(" and age = " + sick.getAge());
		}	
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

	public int sickModify(Connection con, Sick sick) throws Exception {
		String sql="update t_sick set sickName=?,sickPwd=?,trueName=?,sex=?,age=?,sid=?,sickDesc=? where sickId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, sick.getSickName());
		pstmt.setString(2, sick.getSickPwd());
		pstmt.setString(3, sick.getTrueName());
		pstmt.setString(4, sick.getSex());
		pstmt.setInt(5, sick.getAge());
		pstmt.setString(6, sick.getSid());
		pstmt.setString(7, sick.getSickDesc());
		pstmt.setInt(8, sick.getSickId());
//		System.out.println("----"+pstmt.toString());
		return pstmt.executeUpdate();
	}

	public int sickAdd(Connection con, Sick sick) throws Exception {
		String sql="insert into t_sick values(null,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,sick.getSickName());
		pstmt.setString(2,sick.getSickPwd());
		pstmt.setString(3,sick.getTrueName());
		pstmt.setString(4,sick.getSex());
		pstmt.setInt(5,sick.getAge());
		pstmt.setString(6,sick.getSid());
		pstmt.setString(7,sick.getSickDesc());
		return pstmt.executeUpdate();
	}

	public int sickDelete(Connection con, String delIds) throws Exception {
		String sql="delete from t_sick where sickId in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}

	public Sick sickLogin(Connection con, Sick sick) throws Exception {
		String sql="select * from t_sick where sickName=? and sickPwd=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,sick.getSickName());
		pstmt.setString(2,sick.getSickPwd());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			Sick sick1 = new Sick();
			sick1.setSickId(rs.getInt(1));
			sick1.setSickName(rs.getString(2));
			sick1.setSickPwd(rs.getString(3));
			sick1.setTrueName(rs.getString(4));
			sick1.setSex(rs.getString(5));
			sick1.setAge(rs.getInt(6));
			sick1.setSid(rs.getString(7));
			sick1.setSickDesc(rs.getString(8));
			return sick1;
		}else{
			return null;
		}
	}

	public boolean getSickByName(Connection con, String str) throws Exception {
		String sql="select * from t_sick where sickName=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,str);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return true;
		}
		return false;
	}

}
