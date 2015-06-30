package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.com.model.Doctor;
import org.com.model.PageBean;
import org.com.util.DateUtil;
import org.com.util.StringUtil;

public class DoctorDao {

	/**
	 * 得到doctor查询结果
	 */
	public ResultSet doctorListRs(Connection con, PageBean pageBean,
			Doctor doctor) throws Exception {
		StringBuffer sb = new StringBuffer("select * from t_doctor d,t_keshi k where d.keshiId=k.keshiId");
		if (doctor.getKeshiId() > 0) {
			sb.append(" and d.keshiId='" + doctor.getKeshiId() +"'");
		}
		if (StringUtil.isNotEmpty(doctor.getDoctorName())) {
			sb.append(" and d.doctorName like '%" + doctor.getDoctorName() + "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getSex())) {
			sb.append(" and d.sex ='" + doctor.getSex() + "'");
		}
		// 分页
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
//		System.out.println("doctor select sql:"+sb.toString());
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	/**
	 * 获取数据总条数
	 */
	public int doctorCount(Connection con,Doctor doctor)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_doctor d,t_keshi k where d.keshiId=k.keshiId");
		if (doctor.getKeshiId() > 0) {
			sb.append(" and d.keshiId = '" + doctor.getKeshiId() + "'");
		}
		if (StringUtil.isNotEmpty(doctor.getDoctorName())) {
			sb.append(" and d.doctorName like '%" + doctor.getDoctorName() + "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getZhuanchang())) {
			sb.append(" and d.zhuanchang like '%" + doctor.getZhuanchang() + "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getSex())) {
			sb.append(" and d.sex ='" + doctor.getSex() + "'");
		}
//		System.out.println("doctor count sql:"+sb.toString());
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	public int doctorModify(Connection con, Doctor doctor) throws Exception {
		String sql="update t_doctor set doctorName=?,sex=?,birthday=?,byyx=?,cynx=?,keshiId=?,zhicheng=?,zhuanchang=? where doctorId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,doctor.getDoctorName());
		pstmt.setString(2,doctor.getSex());
		pstmt.setString(3,DateUtil.formatDate(doctor.getBirthday(), "yyyy-MM-dd"));
		pstmt.setString(4, doctor.getByyx());
		pstmt.setInt(5, doctor.getCynx());
		pstmt.setInt(6, doctor.getKeshiId());
		pstmt.setString(7, doctor.getZhicheng());
		pstmt.setString(8, doctor.getZhuanchang());
		pstmt.setInt(9, doctor.getDoctorId());
		return pstmt.executeUpdate();
	}
	public int doctorAdd(Connection con, Doctor doctor) throws Exception {
		String sql="insert into t_doctor values(null,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, doctor.getDoctorName());
		pstmt.setString(2, doctor.getSex());
		pstmt.setString(3, DateUtil.formatDate(doctor.getBirthday(), "yyyy-MM-dd"));
		pstmt.setString(4, doctor.getByyx());
		pstmt.setInt(5, doctor.getCynx());
		pstmt.setInt(6, doctor.getKeshiId());
		pstmt.setString(7, doctor.getZhicheng());
		pstmt.setString(8, doctor.getZhuanchang());
		return pstmt.executeUpdate();
	}
	public int doctorDelete(Connection con, String delIds) throws Exception {
		String sql="delete from t_doctor where doctorId in("+delIds+")";
//		System.out.println("doctor delete sql:"+sql);
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}

	public List<Doctor> doctorList(Connection con, PageBean pageBean,Doctor doctor)
			throws Exception {
		StringBuffer sb = new StringBuffer("select * from t_doctor where 1=1");
		if (StringUtil.isNotEmpty(doctor.getDoctorName())) {
			sb.append(" and doctorName like '%" + doctor.getDoctorName() + "%'");
		}
		if (StringUtil.isNotEmpty(doctor.getZhuanchang())) {
			sb.append(" and zhuanchang like '%" + doctor.getZhuanchang() + "%'");
		}
		if (doctor.getKeshiId()>0) {
			sb.append(" and  keshiId =" + doctor.getKeshiId());
		}
		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		PreparedStatement pstmt = con.prepareStatement(sb.toString());
		ResultSet rs = pstmt.executeQuery();
		List<Doctor> doctors  = new ArrayList<Doctor>();
		while(rs.next()){
			Doctor doctor1  = new Doctor();
			doctor1.setDoctorId(rs.getInt(1));
			doctor1.setDoctorName(rs.getString(2));
			doctor1.setSex(rs.getString(3));
			doctor1.setBirthday(DateUtil.formatString(rs.getString(4), "yyyy-MM-dd"));
			doctor1.setByyx(rs.getString(5));
			doctor1.setCynx(rs.getInt(6));
			doctor1.setKeshiId(rs.getInt(7));
			doctor1.setZhicheng(rs.getString(8));
			doctor1.setZhuanchang(rs.getString(9));
			doctors.add(doctor1);
		}
		return doctors;
	}
	public Doctor getDoctorById(Connection con, int e_doctorId) throws Exception {
		String sql = "select * from t_doctor where doctorId="+e_doctorId;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			Doctor doctor1  = new Doctor();
			doctor1.setDoctorId(rs.getInt(1));
			doctor1.setDoctorName(rs.getString(2));
			doctor1.setSex(rs.getString(3));
			doctor1.setBirthday(DateUtil.formatString(rs.getString(4), "yyyy-MM-dd"));
			doctor1.setByyx(rs.getString(5));
			doctor1.setCynx(rs.getInt(6));
			doctor1.setKeshiId(rs.getInt(7));
			doctor1.setZhicheng(rs.getString(8));
			doctor1.setZhuanchang(rs.getString(9));
			return doctor1;
		}
		return null;
	}
	
}
