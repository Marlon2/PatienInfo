package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.UserDao;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = 1L;
	private User user;
	private String error;
	private String imageCode;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
	

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	DbUtil dbUtil=new DbUtil();
	UserDao userDao=new UserDao();
	HttpServletRequest request;
	
	
	@Override
	public String execute() throws Exception {
		// 获取Session
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(user.getUserName())||StringUtil.isEmpty(user.getUserPwd())){
			error="用户名或密码为空！";
			return ERROR;
		}
		if(StringUtil.isEmpty(imageCode)){
			error="验证码为空！";
			return ERROR;
		}
		if(!imageCode.equals(session.getAttribute("sRand"))){
			error="验证码错误！";
			return ERROR;
		}
		Connection con=null;
		try {
			con=dbUtil.getCon();
			User currentUser=userDao.login(con, user);
			if(currentUser==null){
				error="用户名或密码错误！";
				return ERROR;
			}else{
				session.setAttribute("currentUser", currentUser);
				if(currentUser.getRole()==0){
					return "admin";
				}else{
					return "user";
				}
		
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ERROR;
	}
	
	public String logout() throws Exception {
		//获取session
		HttpSession session=request.getSession();
		session.removeAttribute("currentUser");
		return "logout";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
}