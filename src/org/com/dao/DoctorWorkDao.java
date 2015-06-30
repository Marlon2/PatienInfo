package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.com.model.Doctor;
import org.com.model.DoctorWork;
import org.com.model.PageBean;
import org.com.util.DateUtil;
import org.com.util.StringUtil;

public class DoctorWorkDao {

	public ResultSet doctorListRs(Connection con, PageBean pageBean,
			Doctor doctor) throws Exception {
		StringBuffer sb = new StringBuffer(
				"select * from t_doctor d,t_doctorwork w,t_keshi k where d.doctorId=w.did and d.keshiId=k.keshiId");
		if (doctor.getKeshiId() > 0) {
			sb.append(" and d.keshiid='" + doctor.getKeshiId() + "'");
		}
		if (StringUtil.isNotEmpty(doctor.getDoctorName())) {
			sb.append(" and d.doctorName like '%" + doctor.getDoctorName()
					+ "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getSex())) {
			sb.append(" and d.sex ='" + doctor.getSex() + "'");
		}
		// 分页
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		// System.out.println("doctor select sql:"+sb.toString());
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}

	public int doctorCount(Connection con, Doctor doctor) throws Exception {
		StringBuffer sb = new StringBuffer(
				"select count(*) as total from t_doctor d,t_doctorwork w,t_keshi k where d.doctorId=w.did and d.keshiId=k.keshiId ");
		if (doctor.getKeshiId() > 0) {
			sb.append(" and d.keshiid='" + doctor.getKeshiId() + "'");
		}
		if (StringUtil.isNotEmpty(doctor.getDoctorName())) {
			sb.append(" and d.doctorName like '%" + doctor.getDoctorName()
					+ "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getSex())) {
			sb.append(" and d.sex ='" + doctor.getSex() + "'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

	public int doctorWorkModify(Connection con, DoctorWork doctorwork) throws Exception {
		String sql="update t_doctorwork set time=?,num=?,maxnum=? where workid=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,DateUtil.formatDate(doctorwork.getTime(), "yyyy-MM-dd"));
		pstmt.setInt(2,doctorwork.getNum());
		pstmt.setInt(3, doctorwork.getMaxnum());
		pstmt.setInt(4, doctorwork.getWorkid());
		
		return pstmt.executeUpdate();
	}

	public int doctorWorkAdd(Connection con, DoctorWork doctorwork) throws Exception {
		String sql="insert into t_doctorwork values(null,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,doctorwork.getDid());
		pstmt.setString(2,DateUtil.formatDate(doctorwork.getTime(), "yyyy-MM-dd"));
		pstmt.setInt(3,doctorwork.getNum());
		pstmt.setInt(4, doctorwork.getMaxnum());
		return pstmt.executeUpdate();
	}

	public int doctorDelete(Connection con, String delIds) throws Exception {
		String sql="delete from t_doctorwork where workid in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}

	public List<DoctorWork> getWorksByDid(Connection con, int f_doctorid) throws Exception {
		String sql = "select * from t_doctorwork where did = "+f_doctorid;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<DoctorWork> list = new ArrayList<DoctorWork>();
		while(rs.next()){
			DoctorWork dw = new DoctorWork();
			dw.setWorkid(rs.getInt(1));
			dw.setDid(rs.getInt(2));
			dw.setTime(DateUtil.formatString(rs.getString(3), "yyyy-MM-dd"));
			dw.setNum(rs.getInt(4));
			dw.setMaxnum(rs.getInt(5));
			list.add(dw);
		}
		return list;
	}

	public void updateNum(Connection con, int workid) throws Exception {
		String sql = "update t_doctorwork set num=num+1 where workid = "+workid;
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.executeUpdate();
	}

}
