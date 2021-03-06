package org.com.action;

import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.SickDao;
import org.com.dao.UserDao;
import org.com.model.PageBean;
import org.com.model.Sick;
import org.com.model.User;
import org.com.util.DbUtil;
import org.com.util.JsonUtil;
import org.com.util.ResponseUtil;
import org.com.util.StringUtil;

import com.opensymphony.xwork2.ActionSupport;

public class SickAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	private Sick sick;
	private String page;// 分页数据
	private String rows;// 分页数据
	private String delIds;// 批量删除数据的序列号
	private String sickId;// 修改患者资料传递的患者编号

	// 查询条件的变量
	private String s_sickName;
	private String s_trueName;
	private String s_sex;
	private String s_age;

	DbUtil dbUtil = new DbUtil();
	UserDao userDao = new UserDao();
	SickDao sickDao = new SickDao();
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
		if (sick == null) {
			sick = new Sick();
		}
		//session中获取当前用户的ID 只查询当前用户增加的患者 只有管理员才全部查询
		currentUser=(User) session.getAttribute("currentUser");
		sick.setSickName(s_sickName);
		sick.setTrueName(s_trueName);
		sick.setSex(s_sex);
		if(StringUtil.isNotEmpty(s_age)){
			sick.setAge(Integer.parseInt(s_age));
		}
		try {
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(sickDao.sickList(con,pageBean,sick));
			int total= sickDao.sickCount(con,sick);
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
	
	
	public String save()throws Exception{
		//判断sickId是否为空
		if(StringUtil.isNotEmpty(sickId)){
			sick.setSickId(Integer.parseInt(sickId));
		}
		
		Connection con=null;
		try{
			con=dbUtil.getCon();
			int saveNums=0;
			JSONObject result=new JSONObject();
			if(StringUtil.isNotEmpty(sickId)){
				//不为空，修改患者信息
				saveNums=sickDao.sickModify(con, sick);
			}else{
			//sickId为空，新增患者
				saveNums=sickDao.sickAdd(con, sick);
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
	//删除数据
		public String delete()throws Exception{
			Connection con=null;
			try{
				con=dbUtil.getCon();
				JSONObject result=new JSONObject();
				int delNums=sickDao.sickDelete(con, delIds);
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
		/*
	// 输出excel表格（xls）
	public void exportSick() throws Exception {
		// 创建Excel的工作书册 Workbook,对应到一个excel文档
		HSSFWorkbook wb = new HSSFWorkbook();

		// 创建Excel的工作sheet,对应到一个excel文档的tab
		HSSFSheet sheet = wb.createSheet("sheet1");

		// 设置excel每列宽度
		sheet.setColumnWidth(0, 4000);
		sheet.setColumnWidth(1, 3500);

		// 创建字体样式
		HSSFFont font = wb.createFont();
		font.setFontName("Verdana");
		font.setBoldweight((short) 100);
		font.setFontHeight((short) 300);
		font.setColor(HSSFColor.BLUE.index);
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		// 设置边框
		style.setBottomBorderColor(HSSFColor.RED.index);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);

		style.setFont(font);// 设置字体
		style.setWrapText(true);// 自动换行

		// 创建Excel的sheet的一行
		HSSFRow row = sheet.createRow(0);
		row.setHeight((short) 500);// 设定行的高度
		HSSFCell cell = null;
		// 创建一个Excel的单元格
		String[] cellTitle = { "编号", "用户名", "密码", "真实姓名", "性别", "年龄", "身份证号",
				"症状描述" };
		for (int i = 0; i < cellTitle.length; i++) {
			cell = row.createCell(i);
			// 给Excel的单元格设置样式和赋值
			cell.setCellStyle(style);
			cell.setCellValue(cellTitle[i]);
		}
		// 获取Session
		HttpSession session = request.getSession();
		// 链接connection
		Connection con = null;
		if (sick == null) {
			sick = new Sick();
		}
		// 将查询条件赋值给doctor对象
		if (s_sickName != null) {
			sick.setSickName(s_sickName);
			sick.setTrueName(s_trueName);
			sick.setSex(s_sex);
			if (StringUtil.isNotEmpty(s_age)) {
				sick.setAge(Integer.parseInt(s_age));
			}
		}
		ResultSet rs = null;
		try {
			con = dbUtil.getCon();
			rs = sickDao.sickList(con, null, sick);
			int rowIndex = 1;
			while (rs.next()) {
				row = sheet.createRow(rowIndex++);
				cell = row.createCell(0);
				cell.setCellValue(rs.getString("sickId"));
				cell = row.createCell(1);
				cell.setCellValue(rs.getString("sickName"));
				cell = row.createCell(2);
				cell.setCellValue(rs.getString("sickPwd"));
				cell = row.createCell(3);
				cell.setCellValue(rs.getString("trueName"));
				cell = row.createCell(4);
				cell.setCellValue(rs.getString("sex"));
				cell = row.createCell(5);
				cell.setCellValue(rs.getInt("age"));
				cell = row.createCell(6);
				cell.setCellValue(rs.getInt("sid"));
				cell = row.createCell(7);
				cell.setCellValue(rs.getString("sickDesc"));
			}
			String exportFileName = "sick.xls";

			ServletActionContext.getResponse().setHeader(
					"Content-Disposition",
					"attachment;filename="
							+ new String((exportFileName).getBytes(),
									"ISO8859-1"));// 设定输出文件头
			ServletActionContext.getResponse().setContentType(
					"application/vnd.ms-excel;charset=UTF-8");// 定义输出类型

			OutputStream out = ServletActionContext.getResponse()
					.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}*/
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Sick getSick() {
		return sick;
	}
	public void setSick(Sick sick) {
		this.sick = sick;
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
	public String getSickId() {
		return sickId;
	}
	public void setSickId(String sickId) {
		this.sickId = sickId;
	}
	public String getS_sickName() {
		return s_sickName;
	}
	public void setS_sickName(String s_sickName) {
		this.s_sickName = s_sickName;
	}
	
	public String getS_trueName() {
		return s_trueName;
	}
	public void setS_trueName(String s_trueName) {
		this.s_trueName = s_trueName;
	}

	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}
	public String getS_age() {
		return s_age;
	}
	public void setS_age(String s_age) {
		this.s_age = s_age;
	}
}
