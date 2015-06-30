package org.com.model;

import java.util.Date;

public class Doctor {

	private int doctorId;
	private String doctorName;
	private String sex;
	private Date birthday;
	private String byyx;
	private int cynx;
	private int keshiId=-1;
	private String zhicheng;
	private String zhuanchang;
	public Doctor(){
		super();
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getByyx() {
		return byyx;
	}
	public void setByyx(String byyx) {
		this.byyx = byyx;
	}
	public int getCynx() {
		return cynx;
	}
	public void setCynx(int cynx) {
		this.cynx = cynx;
	}
	
	public int getKeshiId() {
		return keshiId;
	}
	public void setKeshiId(int keshiId) {
		this.keshiId = keshiId;
	}
	public String getZhicheng() {
		return zhicheng;
	}
	public void setZhicheng(String zhicheng) {
		this.zhicheng = zhicheng;
	}
	public String getZhuanchang() {
		return zhuanchang;
	}
	public void setZhuanchang(String zhuanchang) {
		this.zhuanchang = zhuanchang;
	}
}
