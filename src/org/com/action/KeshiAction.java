package org.com.action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.KeshiDao;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;

import com.opensymphony.xwork2.ActionSupport;

public class KeshiAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	User currentUser;
	DbUtil dbUtil=new DbUtil();
	KeshiDao keshiDao = new KeshiDao();
	@Override
	public String execute() throws Exception {
		Connection con=null;
		// 获取Session,判断当前用户类型
		HttpSession session=request.getSession();
		currentUser=(User) session.getAttribute("currentUser");
		try{
			con=dbUtil.getCon();
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("keshiId", "");
			jsonObject.put("keshiName", "请选择...");
			jsonArray.add(jsonObject);
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(keshiDao.keshiList(con)));
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

}
