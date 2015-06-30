package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.DoctorDao;
import org.com.model.Doctor;
import org.com.model.PageBean;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class DoctorAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private Doctor doctor;// patient对象
	private String page;// 分页数据
	private String rows;// 分页数据
	private String delIds;// 批量删除数据的序列号
	private String doctorId;// 修改患者资料传递的患者编号
	// 查询条件的变量
	private String s_doctorName = "";
	private String s_sex = "";
	private String s_keshiId = "";

	DbUtil dbUtil = new DbUtil();
	DoctorDao doctorDao = new DoctorDao();
	HttpServletRequest request;
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
					.formatRsToJsonArray(doctorDao.doctorListRs(con, pageBean,
							doctor));
			int total = doctorDao.doctorCount(con, doctor);
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

	public void printDoctor(){
		System.out.println(doctor.getDoctorName());
		System.out.println(doctor.getSex());
		System.out.println(doctor.getBirthday());
		System.out.println(doctor.getByyx());
		System.out.println(doctor.getCynx());
		System.out.println(doctor.getKeshiId());
		System.out.println(doctor.getZhicheng());
	}
	// 保存医生数据(新增和修改)
	public String save() throws Exception {
		// 判断patientId是否为空
		if (StringUtil.isNotEmpty(doctorId)) {
			doctor.setDoctorId(Integer.parseInt(doctorId));
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(doctorId)){
			//不为空，修改患者信息
				saveNums=doctorDao.doctorModify(con, doctor);
			}else{
			//patientId为空，新增患者
				saveNums=doctorDao.doctorAdd(con, doctor);
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

	public String delete()throws Exception{
		Connection con=null;
		try {
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums = doctorDao.doctorDelete(con,delIds);
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
	public String doctorNameComboList(){
		Connection con=null;
		// 获取Session,判断当前用户类型
		HttpSession session=request.getSession();
		//管理员用户
		try{
			con=dbUtil.getCon();
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("doctorName", "");
			jsonObject.put("doctorName", "请选择...");
			jsonArray.add(jsonObject);
			Doctor doctor1 = new Doctor();
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(doctorDao.doctorListRs(con,null,doctor1)));
			ResponseUtil.write(ServletActionContext.getResponse(), jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
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

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
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
}
