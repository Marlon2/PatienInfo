package org.com.action;

import java.sql.Connection;

import org.com.dao.SickDao;
import org.com.model.Sick;
import org.com.util.DbUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserLoginAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Sick sick;
	private String msg;
	DbUtil dbUtil = new DbUtil();
	SickDao sickDao = new SickDao();

	@Override
	public String execute() throws Exception {
		// 链接connection
		Connection con = null;
		try {
			con = dbUtil.getCon();
			sick = sickDao.sickLogin(con, sick);
			if (sick != null) {
				ActionContext.getContext().getSession().put("sick", sick);
				return SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		msg = "用户名或密码错误！";
		return INPUT;
	}

	public Sick getSick() {
		return sick;
	}

	public void setSick(Sick sick) {
		this.sick = sick;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
