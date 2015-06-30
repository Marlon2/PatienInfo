package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.GuaHaoDao;
import org.com.dao.PatientDao;
import org.com.dao.UserDao;
import org.com.model.GuaHao;
import org.com.model.PageBean;
import org.com.model.Patient;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class GuaHaoAction extends ActionSupport implements ServletRequestAware{
	
	private GuaHao guahao;//guahao对象
	private Patient patient;//patient对象
	private String page;//分页数据
	private String rows;//分页数据
	private String delIds;//批量删除数据的序列号
	private String ghId;//修改挂号信息资料的参数
	//查询条件的变量
	private String s_patientName;
	private String s_sex;
	private String s_bGhDate;
	private String s_eGhDate;
	private String s_userId;
	private String s_officeName;
	
	public GuaHao getGuahao() {
		return guahao;
	}
	public void setGuahao(GuaHao guahao) {
		this.guahao = guahao;
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
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public String getGhId() {
		return ghId;
	}
	public void setGhId(String ghId) {
		this.ghId = ghId;
	}
	public String getS_patientName() {
		return s_patientName;
	}
	public void setS_patientName(String s_patientName) {
		this.s_patientName = s_patientName;
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
	public String getS_userId() {
		return s_userId;
	}
	public void setS_userId(String s_userId) {
		this.s_userId = s_userId;
	}
	public String getS_officeName() {
		return s_officeName;
	}
	public void setS_officeName(String s_officeName) {
		this.s_officeName = s_officeName;
	}

	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	GuaHaoDao guahaoDao=new GuaHaoDao();
	PatientDao patientDao=new PatientDao();
	HttpServletRequest request;
	//当前用户
	User currentUser;
	
	@Override
	public String execute() throws Exception {
		// 获取Session
		HttpSession session=request.getSession();	
		//链接connection
		Connection con=null;
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));//分页pageBean
		if(guahao==null){
			guahao=new GuaHao();		
		}
		if(patient==null){
			patient=new Patient();
		}
		//session中获取当前用户的ID 只查询当前用户增加的患者 只有管理员才全部查询
		currentUser=(User) session.getAttribute("currentUser");
		if(currentUser.getRole()!=0){
			//非管理员用户赋值，显示所属用户患者，管理员不赋值查询所有结果
			patient.setUserId(currentUser.getUserId());
		}
		//将查询条件赋值给guahao对象和patient对象
		if(s_patientName!=null){
			guahao.setPatientName(s_patientName);
			patient.setSex(s_sex);
			guahao.setOfficeName(s_officeName);
			if(StringUtil.isNotEmpty(s_userId)){
				patient.setUserId(Integer.parseInt(s_userId));
			}
		}
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(guahaoDao.guahaoList(con, pageBean,patient,guahao,s_bGhDate,s_eGhDate));
			int total=guahaoDao.guahaoCount(con,patient,guahao,s_bGhDate,s_eGhDate);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	//保存患者数据(新增和修改)
		public String save()throws Exception{
			//判断ghId是否为空，不为空则赋值，用作修改挂号信息
			if(StringUtil.isNotEmpty(ghId)){
				guahao.setGhId(Integer.parseInt(ghId));
			}
			Connection con=null;
			try{
				con=dbUtil.getCon();
				int saveNums=0;
				JSONObject result=new JSONObject();
				if(StringUtil.isNotEmpty(ghId)){
				//不为空，修改挂号信息
					saveNums=guahaoDao.guahaoModify(con, guahao);
				}else{
				//ghId为空，新增挂号
					saveNums=guahaoDao.guahaoAdd(con, guahao);
				}
				if(saveNums>0){
					result.put("success", "true");
				}else{
					result.put("success", "true");//业务逻辑
					result.put("errorMsg", "保存失败");
				}
				ResponseUtil.write(ServletActionContext.getResponse(), result);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					dbUtil.closeCon(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
	}
		//删除数据
	public String delete()throws Exception{
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			int delNums=guahaoDao.guahaoDelete(con, delIds);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}		


	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
