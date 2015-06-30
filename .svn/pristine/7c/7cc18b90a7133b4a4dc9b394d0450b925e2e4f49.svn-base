package org.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.com.model.GuaHao;
import org.com.model.PageBean;
import org.com.model.Patient;
import org.com.util.DateUtil;
import org.com.util.StringUtil;

public class GuaHaoDao {
	
	public ResultSet guahaoList(Connection con,PageBean pageBean,Patient patient,GuaHao guahao, String s_bGhDate, String s_eGhDate)throws Exception{
		StringBuffer sb=new StringBuffer("SELECT * FROM t_ghinfo g ,t_patient p ,t_user u WHERE p.userId=u.userId AND g.patientId=p.patientId");
		if(patient.getUserId()!=-1){			
			sb.append(" and p.userId = '"+patient.getUserId()+"'");
		}
		if(StringUtil.isNotEmpty(guahao.getPatientName())){
			sb.append(" and p.patientName like '%"+guahao.getPatientName()+"%'");
		}
		if(StringUtil.isNotEmpty(patient.getSex())){
			sb.append(" and p.sex ='"+patient.getSex()+"'");
		}
		if(StringUtil.isNotEmpty(s_bGhDate)){
			sb.append(" and TO_DAYS(g.date)>=TO_DAYS('"+s_bGhDate+"')");
		}
		if(StringUtil.isNotEmpty(s_eGhDate)){
			sb.append(" and TO_DAYS(g.date)<=TO_DAYS('"+s_eGhDate+"')");
		}
		if(StringUtil.isNotEmpty(guahao.getOfficeName())){
			sb.append(" and g.officeName ='"+guahao.getOfficeName()+"'");
		}
		//分页
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	/**
	 * 获取数据总条数
	 * @param con
	 * @param grade
	 * @return
	 * @throws Exception
	 */
	public int guahaoCount(Connection con,Patient patient, GuaHao guahao, String s_bGhDate, String s_eGhDate)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_ghinfo g ,t_patient p ,t_user u WHERE p.userId=u.userId AND g.patientId=p.patientId");
		if(patient.getUserId()!=-1){			
			sb.append(" and p.userId = '"+patient.getUserId()+"'");
		}
		if(StringUtil.isNotEmpty(guahao.getPatientName())){
			sb.append(" and p.patientName like '%"+guahao.getPatientName()+"%'");
		}
		if(StringUtil.isNotEmpty(patient.getSex())){
			sb.append(" and p.sex ='"+patient.getSex()+"'");
		}
		if(StringUtil.isNotEmpty(s_bGhDate)){
			sb.append(" and TO_DAYS(g.date)>=TO_DAYS('"+s_bGhDate+"')");
		}
		if(StringUtil.isNotEmpty(s_eGhDate)){
			sb.append(" and TO_DAYS(g.date)<=TO_DAYS('"+s_eGhDate+"')");
		}
		if(StringUtil.isNotEmpty(guahao.getOfficeName())){
			sb.append(" and g.officeName ='"+guahao.getOfficeName()+"'");
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	/**
	 *  数据库插入数据
	 * @param con
	 * @param guahao
	 * @return
	 * @throws Exception
	 */
	public int guahaoAdd(Connection con, GuaHao guahao)throws Exception{
		String sql="insert into t_ghinfo values(null,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, guahao.getPatientId());
		pstmt.setString(2, new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));//将当前时间作为流水号码
		pstmt.setString(3, DateUtil.formatDate(guahao.getDate(), "yyyy-MM-dd"));
		pstmt.setString(4, guahao.getOfficeName());
		pstmt.setString(5, guahao.getGhDesc());
		return pstmt.executeUpdate();
	}
	/**
	 * 修改数据
	 * @param con
	 * @param guahao
	 * @return
	 * @throws Exception
	 */
	public int guahaoModify(Connection con, GuaHao guahao)throws Exception{
		String sql="update t_ghinfo set patientId=? , date=? , officeName=? , ghDesc=? where ghId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, guahao.getPatientId());
		pstmt.setString(2, DateUtil.formatDate(guahao.getDate(), "yyyy-MM-dd"));
		pstmt.setString(3, guahao.getOfficeName());
		pstmt.setString(4, guahao.getGhDesc());
		pstmt.setInt(5, guahao.getGhId());
		return pstmt.executeUpdate();
	}
	/**
	 * 删除数据
	 * @param con
	 * @param delIds
	 * @return
	 * @throws Exception
	 */
	public int guahaoDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_ghinfo where ghId in("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	/**
	 * 统计每个科室的挂号数量
	 * @param con
	 * @return
	 * @throws Exception
	 */
	public ResultSet guahaoChart(Connection con,Patient patient, GuaHao guahao) throws Exception {
		StringBuffer sb=new StringBuffer("SELECT g.officeName,COUNT(*) FROM t_ghinfo g ,t_patient p ,t_user u WHERE p.userId=u.userId AND g.patientId=p.patientId");
		if(patient.getUserId()!=-1){			
			sb.append(" AND p.userId = '"+patient.getUserId()+"'");
		}
		sb.append(" GROUP BY g.officeName");			
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
}
