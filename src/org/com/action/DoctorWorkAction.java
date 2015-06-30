package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.DoctorWorkDao;
import org.com.model.Doctor;
import org.com.model.DoctorWork;
import org.com.model.PageBean;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class DoctorWorkAction extends ActionSupport implements
		ServletRequestAware {

	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	
	private String page;// 分页数据
	private String rows;// 分页数据
	//查询数据
	private String delIds;// 批量删除数据的序列号
	private Doctor doctor;
	private String doctorId;
	private String s_doctorName = "";
	private String s_sex = "";
	private String s_keshiId;
	private int workid;
	private DoctorWork doctorwork;
	DbUtil dbUtil = new DbUtil();
	DoctorWorkDao doctorWorkDao = new DoctorWorkDao();
	User currentUser;

	@Override
	public String execute() throws Exception {
		// 获取Session
		HttpSession session = request.getSession();
		// 链接connection
		Connection con = null;
		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));// 分页pageBean
		if (doctor == null) {
			doctor = new Doctor();
		}
		currentUser = (User) session.getAttribute("currentUser");
		// 将查询条件赋值给doctor对象
		if (s_doctorName != null) {
			doctor.setDoctorName(s_doctorName);
			doctor.setSex(s_sex);
			if (StringUtil.isNotEmpty(s_keshiId)) {
				doctor.setKeshiId(Integer.parseInt(s_keshiId));
			}
		}
		try {
			con = dbUtil.getCon();
			JSONObject result = new JSONObject();
			JSONArray jsonArray = JsonUtil
					.formatRsToJsonArray(doctorWorkDao.doctorListRs(con, pageBean,
							doctor));
			int total = doctorWorkDao.doctorCount(con, doctor);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String save() throws Exception {
		// 判断patientId是否为空
		if (StringUtil.isNotEmpty(doctorId)) {
			doctorwork.setDid(Integer.parseInt(doctorId));
		}
		System.out.println(doctorwork.getTime() + "----" + doctorwork.getNum());
		doctorwork.setWorkid(workid);
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(doctorId)){
			//不为空，新增
				saveNums=doctorWorkDao.doctorWorkAdd(con, doctorwork);
			}else{
			//为空，修改信息
				saveNums=doctorWorkDao.doctorWorkModify(con, doctorwork);
			}
			if(saveNums>0){
				result.put("success", "true");
			}else{
				result.put("success", "true");//业务逻辑,需要返回success，但返回的是错误message
				result.put("errorMsg", "保存失败");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String delete(){
		Connection con=null;
		try {
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums = doctorWorkDao.doctorDelete(con,delIds);
			if(delNums>0){
				result.put("success", "true");
				result.put("delNums", delNums);
			}else{
				result.put("errorMsg", "删除失败");
			}
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return null;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public String getS_doctorName() {
		return s_doctorName;
	}

	public void setS_doctorName(String s_doctorName) {
		this.s_doctorName = s_doctorName;
	}

	public String getS_sex() {
		return s_sex;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public String getS_keshiId() {
		return s_keshiId;
	}

	public void setS_keshiId(String s_keshiId) {
		this.s_keshiId = s_keshiId;
	}

	public int getWorkid() {
		return workid;
	}

	public void setWorkid(int workid) {
		this.workid = workid;
	}

	public DoctorWork getDoctorwork() {
		return doctorwork;
	}

	public void setDoctorwork(DoctorWork doctorwork) {
		this.doctorwork = doctorwork;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

}
