package org.com.test;

import java.sql.Connection;
import java.sql.ResultSet;

import org.com.dao.DoctorDao;
import org.com.model.Doctor;
import org.com.model.PageBean;
import org.com.util.DbUtil;
import org.junit.Test;



public class DoctorTest {

	@Test
	public void test01() throws Exception{
		DbUtil dbUtil = new DbUtil();
		DoctorDao doctorDao = new DoctorDao();
		Connection con = null;
		con=dbUtil.getCon();
		Doctor d = new Doctor();
//		ResultSet rs = doctorDao.doctorList(con, null,d,null,null);
//		while(rs.next()){
//			System.out.println(rs.getString(2));
//		}
	}
	
	@Test
	public void testSave() throws Exception{
		DbUtil dbUtil = new DbUtil();
		DoctorDao doctorDao = new DoctorDao();
		Connection con = null;
		con=dbUtil.getCon();
		Doctor d = new Doctor();
		doctorDao.doctorAdd(con, d);
	}
	@Test
	public void testDelete() throws Exception{
		DbUtil dbUtil = new DbUtil();
		DoctorDao doctorDao = new DoctorDao();
		Connection con = null;
		con=dbUtil.getCon();
		String delIds = "45";
		doctorDao.doctorDelete(con, delIds);
	}
	
	@Test
	public void testAllDoctor() throws Exception{
		DbUtil dbUtil = new DbUtil();
		DoctorDao doctorDao = new DoctorDao();
		Connection con = null;
		con=dbUtil.getCon();
		PageBean pageBean = new PageBean(1,
				3);// 分页pageBean
//		doctorDao.doctorList(con, pageBean);
	}
}
