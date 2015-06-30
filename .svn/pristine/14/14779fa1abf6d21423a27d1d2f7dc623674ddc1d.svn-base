package org.com.action;

import java.sql.Connection;
import java.util.List;

import org.com.dao.DoctorDao;
import org.com.dao.DoctorWorkDao;
import org.com.dao.KeshiDao;
import org.com.dao.YuyueDao;
import org.com.model.Doctor;
import org.com.model.DoctorWork;
import org.com.model.YuYue;
import org.com.util.DbUtil;

import com.opensymphony.xwork2.ActionSupport;

public class FrontDoctorWorkAction  extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private int f_doctorid;
	private String f_keshiname;
	private Doctor doctor;
	private List<DoctorWork> doctorWorks;
	DbUtil dbUtil = new DbUtil();
	DoctorDao doctorDao = new DoctorDao();
	KeshiDao keshiDao = new KeshiDao();
	DoctorWorkDao doctorWorkDao = new DoctorWorkDao();
	@Override
	public String execute() throws Exception {
		System.out.println(f_doctorid+"=====");
		return super.execute();
	}
	public String detailWork() throws Exception{
//		System.out.println(f_doctorid+"=====");
		Connection con = null;
		con = dbUtil.getCon();
		doctor = doctorDao.getDoctorById(con, f_doctorid);
		f_keshiname = keshiDao.getKeshiNameById(con, doctor.getKeshiId());
		doctorWorks = doctorWorkDao.getWorksByDid(con, f_doctorid);
		return "detailWork";
	}
	public int getF_doctorid() {
		return f_doctorid;
	}
	public void setF_doctorid(int f_doctorid) {
		this.f_doctorid = f_doctorid;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public String getF_keshiname() {
		return f_keshiname;
	}
	public void setF_keshiname(String f_keshiname) {
		this.f_keshiname = f_keshiname;
	}
	public List<DoctorWork> getDoctorWorks() {
		return doctorWorks;
	}
	public void setDoctorWorks(List<DoctorWork> doctorWorks) {
		this.doctorWorks = doctorWorks;
	}
}
