package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.UserDao;
import org.com.model.PageBean;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private User user;
	private String page;// 分页数据
	private String rows;// 分页数据
	private String delIds;// 批量删除数据的序列号
	private String userId;// 修改管理员资料传递的管理员编号

	DbUtil dbUtil = new DbUtil();
	UserDao userDao = new UserDao();
	// 当前用户
	User currentUser;

	@Override
	public String execute() throws Exception {
		// 获取Session
		HttpSession session = request.getSession();
		// 链接connection
		Connection con = null;
		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));// 分页pageBean
		if (user == null) {
			user = new User();
		}
		//session中获取当前用户的ID 只查询当前用户增加的患者 只有管理员才全部查询
		currentUser=(User) session.getAttribute("currentUser");
		try {
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(userDao.userList(con,pageBean));
			int total= userDao.userCount(con);
			result.put("rows", jsonArray);
			result.put("total", total);
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

	// 保存医生数据(新增和修改)
	public String save() throws Exception {
		// 判断patientId是否为空
		if (StringUtil.isNotEmpty(userId)) {
			user.setUserId(Integer.parseInt(userId));
		}
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(userId)){
			//不为空，修改患者信息
				saveNums=userDao.doctorModify(con, user);
			}else{
			//patientId为空，新增患者
				saveNums=userDao.doctorAdd(con, user);
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
			int delNums = userDao.userDelete(con,delIds);
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

}
