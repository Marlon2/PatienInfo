package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.DoctorDao;
import org.com.dao.SickDao;
import org.com.dao.YuyueDao;
import org.com.model.Doctor;
import org.com.model.PageBean;
import org.com.model.Sick;
import org.com.model.User;
import org.com.model.YuYue;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class YuYueAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private YuYue yuYue;
	private Sick sick;
	private Doctor doctor;
	private String page;// 分页数据
	private String rows;// 分页数据
	private String delIds;// 批量删除数据的序列号

	// 查询条件的变量
	private String s_sickName;
	private String s_sex;
	private String s_bGhDate;
	private String s_eGhDate;
	private String s_doctorName;
	private String s_keshiId;
	private HttpServletRequest request;

	DbUtil dbUtil = new DbUtil();
	DoctorDao doctorDao = new DoctorDao();
	SickDao sickDao = new SickDao();
	YuyueDao yuyueDao = new YuyueDao();
	// 当前用户
	User currentUser;

	@Override
	public String execute() throws Exception {
		// 获取Session
		HttpSession session = request.getSession();
		// 链接connection
		Connection con = null;
		currentUser=(User) session.getAttribute("currentUser");
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));// 分页pageBean
		if(yuYue==null){
			yuYue = new YuYue();
		}
		if(sick==null){
			sick = new Sick();
		}
		if(doctor==null){
			doctor = new Doctor();
		}
		//session中获取当前用户的ID 只查询当前用户增加的患者 只有管理员才全部查询
		currentUser=(User) session.getAttribute("currentUser");
		if(s_sickName!=null){
			sick.setSickName(s_sickName);
		}
		if(s_sex!=null){
			sick.setSex(s_sex);
		}
		if(s_doctorName!=null){
			doctor.setDoctorName(s_doctorName);
		}
		if(StringUtil.isNotEmpty(s_keshiId)){
			doctor.setKeshiId(Integer.parseInt(s_keshiId));
		}
		System.out.println(s_sickName+"--"+s_sex+"--"+s_doctorName+"--"+s_keshiId+"--"+s_bGhDate);
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(yuyueDao.guahaoList(con, pageBean,sick,yuYue,doctor,s_bGhDate,s_eGhDate));
			int total=yuyueDao.guahaoCount(con,sick,yuYue,doctor,s_bGhDate,s_eGhDate);
			result.put("rows", jsonArray);
			result.put("total", total);
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

	// 删除数据
	public String delete() throws Exception {
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums=yuyueDao.guahaoDelete(con, delIds);
			if(delNums>0){
				result.put("success", "true");
				result.put("delNums", delNums);
			}else{
				result.put("errorMsg", "删除失败");
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

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public YuYue getYuYue() {
		return yuYue;
	}

	public void setYuYue(YuYue yuYue) {
		this.yuYue = yuYue;
	}

	public Sick getSick() {
		return sick;
	}

	public void setSick(Sick sick) {
		this.sick = sick;
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

	public String getS_sickName() {
		return s_sickName;
	}

	public void setS_sickName(String s_sickName) {
		this.s_sickName = s_sickName;
	}

	public String getS_sex() {
		return s_sex;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public String getS_bGhDate() {
		return s_bGhDate;
	}

	public void setS_bGhDate(String s_bGhDate) {
		this.s_bGhDate = s_bGhDate;
	}

	public String getS_eGhDate() {
		return s_eGhDate;
	}

	public void setS_eGhDate(String s_eGhDate) {
		this.s_eGhDate = s_eGhDate;
	}

	public String getS_doctorName() {
		return s_doctorName;
	}

	public void setS_doctorName(String s_doctorName) {
		this.s_doctorName = s_doctorName;
	}

	public String getS_keshiId() {
		return s_keshiId;
	}

	public void setS_keshiId(String s_keshiId) {
		this.s_keshiId = s_keshiId;
	}


}
