package org.com.action;

import java.sql.Connection;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.com.dao.DoctorWorkDao;
import org.com.dao.YuyueDao;
import org.com.model.Sick;
import org.com.model.YuYue;
import org.com.util.DbUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FrontYuyueAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private int workid;
	private YuYue yuyue;
	private List<YuYue> yuyues;
	private boolean flag=false;
	//你已经预约过这个医生，一天不能重复预约
	private String yuyuemsg;

	DbUtil dbUtil = new DbUtil();
	YuyueDao yuyueDao = new YuyueDao();
	DoctorWorkDao doctorWorkDao = new DoctorWorkDao();

	public String save() throws Exception {
//		System.out.println(yuyue.getTurnnum() + "num");
		// 链接connection
		Connection con = null;
		con = dbUtil.getCon();
		boolean flag1 = yuyueDao.getYuyueBySidAndDid(con, yuyue);
		if(flag1){
			yuyuemsg ="你已经预约过这个医生，一天不能重复预约.";
			flag = false;
			return "save";
		}
		int num = yuyueDao.saveYuyue(con, yuyue);
		if (num > 0) {
			doctorWorkDao.updateNum(con,workid);
			flag = true;
		}else{
			flag = false;
		}
		
		return "save";
	}

	public String detail() throws Exception{
		Connection con = null;
		con = dbUtil.getCon();
		Sick sick = (Sick) ActionContext.getContext().getSession().get("sick");
//		System.out.println(sick.getSickId()+"---"+sick.getSickName());
		yuyues = yuyueDao.getYuyueBySid(con, sick.getSickId());
		return "detail";
	}
	
	public int getWorkid() {
		return workid;
	}

	public void setWorkid(int workid) {
		this.workid = workid;
	}

	public YuYue getYuyue() {
		return yuyue;
	}

	public void setYuyue(YuYue yuyue) {
		this.yuyue = yuyue;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public List<YuYue> getYuyues() {
		return yuyues;
	}

	public void setYuyues(List<YuYue> yuyues) {
		this.yuyues = yuyues;
	}

	public String getYuyuemsg() {
		return yuyuemsg;
	}

	public void setYuyuemsg(String yuyuemsg) {
		this.yuyuemsg = yuyuemsg;
	}

}
