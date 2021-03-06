package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.com.model.Doctor;
import org.com.model.PageBean;
import org.com.model.Sick;
import org.com.model.YuYue;
import org.com.util.DateUtil;
import org.com.util.StringUtil;

public class YuyueDao {

	public ResultSet guahaoList(Connection con, PageBean pageBean, Sick sick,
			YuYue yuYue, Doctor doctor, String s_bGhDate, String s_eGhDate) throws Exception {
		StringBuffer sb=new StringBuffer("SELECT * FROM t_yuyue y ,t_sick s ,t_doctor d,t_keshi k WHERE y.sid=s.sickId AND y.did=d.doctorId AND d.keshiId=k.keshiId");
		if(StringUtil.isNotEmpty(sick.getSickName())){
			sb.append(" and s.sickName like '%"+sick.getSickName()+"%'");
		}
		if(StringUtil.isNotEmpty(sick.getSex())){
			sb.append(" and s.sex ='"+sick.getSex()+"'");
		}
		if(StringUtil.isNotEmpty(doctor.getDoctorName())){
			sb.append(" and d.doctorName like '%"+doctor.getDoctorName()+"%'");
		}
		if(doctor.getKeshiId()>0){
			sb.append(" and d.keshiId ="+doctor.getKeshiId());
		}
		if(StringUtil.isNotEmpty(s_bGhDate)){
			sb.append(" and TO_DAYS(y.yuyuetime)>=TO_DAYS('"+s_bGhDate+"')");
		}
		if(StringUtil.isNotEmpty(s_eGhDate)){
			sb.append(" and TO_DAYS(y.yuyuetime)<=TO_DAYS('"+s_eGhDate+"')");
		}
		// 分页
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}

	public int guahaoCount(Connection con, Sick sick, YuYue yuYue,
			Doctor doctor, String s_bGhDate, String s_eGhDate) throws Exception {
		StringBuffer sb=new StringBuffer("select count(*) as total from t_yuyue y ,t_sick s ,t_doctor d WHERE y.sid=s.sickId AND y.did=d.doctorId");
		if(StringUtil.isNotEmpty(sick.getSickName())){
			sb.append(" and s.sickName like '%"+sick.getSickName()+"%'");
		}
		if(StringUtil.isNotEmpty(sick.getSex())){
			sb.append(" and s.sex ='"+sick.getSex()+"'");
		}
		if(StringUtil.isNotEmpty(doctor.getDoctorName())){
			sb.append(" and d.doctorName like '%"+doctor.getDoctorName()+"%'");
		}
		if(doctor.getKeshiId()>0){
			sb.append(" and d.keshiId ="+doctor.getKeshiId());
		}
		if(StringUtil.isNotEmpty(s_bGhDate)){
			sb.append(" and TO_DAYS(y.yuyuetime)>=TO_DAYS('"+s_bGhDate+"')");
		}
		if(StringUtil.isNotEmpty(s_eGhDate)){
			sb.append(" and TO_DAYS(y.yuyuetime)<=TO_DAYS('"+s_eGhDate+"')");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

	public int guahaoDelete(Connection con, String delIds) throws Exception {
		String sql="delete from t_yuyue where yuyueid in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}

	public YuYue getDoctorWork(Connection con, int f_doctorid) throws Exception {
		String sql="select * from t_yuyue where yuyueid ="+f_doctorid+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		YuYue yuyue = new YuYue();
		if(rs.next()){
			yuyue.setYuyueid(rs.getInt(1));
			yuyue.setSid(rs.getInt(2));
			yuyue.setDid(rs.getInt(3));
			yuyue.setYuyuetime(DateUtil.formatString(rs.getString(4), "yyyy-MM-dd"));
			yuyue.setTurnnum(rs.getInt(5));
		}
		return yuyue;
	}

	public int saveYuyue(Connection con, YuYue yuyue) throws Exception {
		String sql="insert into t_yuyue values(null,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,yuyue.getSid());
		pstmt.setInt(2,yuyue.getDid());
		pstmt.setString(3, DateUtil.formatDate(yuyue.getYuyuetime(), "yyyy-MM-dd"));
		pstmt.setInt(4, yuyue.getTurnnum());
		pstmt.setString(5, yuyue.getInfo());
		return pstmt.executeUpdate();
	}

	public List<YuYue> getYuyueBySid(Connection con, int sickId) throws Exception {
		String sql="select * from t_yuyue where sid = "+sickId;
		PreparedStatement pstmt=con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<YuYue> yuyues = new ArrayList<YuYue>();
		while(rs.next()){
			YuYue yuyue = new YuYue();
			yuyue.setYuyueid(rs.getInt(1));
			yuyue.setSid(rs.getInt(2));
			yuyue.setDid(rs.getInt(3));
			yuyue.setYuyuetime(DateUtil.formatString(rs.getString(4), "yyyy-MM-dd"));
			yuyue.setTurnnum(rs.getInt(5));
			yuyue.setInfo(rs.getString(6));
			yuyues.add(yuyue);
		}
		return yuyues;
	}

	public boolean getYuyueBySidAndDid(Connection con, YuYue yuyue) throws SQLException {
		String sql="select * from t_yuyue where sid =? and did=? and yuyuetime=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, yuyue.getSid());
		pstmt.setInt(2, yuyue.getDid());
		pstmt.setString(3, DateUtil.formatDate(yuyue.getYuyuetime(), "yyyy-MM-dd"));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			return true;
		}
		return false;
	}

}
