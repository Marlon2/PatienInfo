package org.com.action;

import java.sql.Connection;

import org.com.dao.SickDao;
import org.com.model.Sick;
import org.com.util.DbUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontSickAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private Sick sick;
	private String pwd;
	private boolean saveflag=false;
	private boolean updateflag = false;
	DbUtil dbUtil = new DbUtil();
	SickDao sickDao = new SickDao();
	
	public String save() throws Exception{
		Connection con = null;
		con = dbUtil.getCon();
		int savenum = sickDao.sickAdd(con, sick);
		saveflag = false;
		if(savenum>0){
			ActionContext.getContext().getSession().put("sick", sick);
			saveflag = true;
		}
		return "save";
	}
	public String update() throws Exception{
		Connection con = null;
		updateflag = false;
		con = dbUtil.getCon();
		Sick sick1 = (Sick) ActionContext.getContext().getSession().get("sick");
		sick.setSickId(sick1.getSickId());
		sick.setSickPwd(sick1.getSickPwd());
		printSick();
		int num = sickDao.sickModify(con, sick);
		if(num>0){
			ActionContext.getContext().getSession().put("sick", sick);
			updateflag = true;
		}
		return "update";
	}

	public void printSick(){
		System.out.println("id "+sick.getSickId());
		System.out.println("pwd "+sick.getSickPwd());
		System.out.println("sex "+sick.getSex());
		System.out.println("age "+sick.getAge());
	}
	public String modifyPwd() throws Exception{
		Connection con = null;
		saveflag = false;
		con = dbUtil.getCon();
		Sick sick1 = (Sick) ActionContext.getContext().getSession().get("sick");
		sick1.setSickPwd(pwd);
		int savenum = sickDao.sickModify(con, sick1);
		if(savenum>0){
			ActionContext.getContext().getSession().put("sick", sick1);
			saveflag = true;
		}	
		return "savepwd";
	}
	public Sick getSick() {
		return sick;
	}

	public void setSick(Sick sick) {
		this.sick = sick;
	}

	public boolean isSaveflag() {
		return saveflag;
	}

	public void setSaveflag(boolean saveflag) {
		this.saveflag = saveflag;
	}
	public boolean isUpdateflag() {
		return updateflag;
	}
	public void setUpdateflag(boolean updateflag) {
		this.updateflag = updateflag;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
