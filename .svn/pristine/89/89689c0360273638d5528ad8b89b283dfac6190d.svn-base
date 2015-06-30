package org.com.action;

import java.awt.Font;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.com.dao.GuaHaoDao;
import org.com.model.GuaHao;
import org.com.model.Patient;
import org.com.model.User;
import org.com.util.DbUtil;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;

import com.opensymphony.xwork2.ActionSupport;



public class ViewResultAction extends ActionSupport implements ServletRequestAware{

    //供ChartResult调用->ActionInvocation.getStack().findValue("chart")
    private JFreeChart chart;
    private GuaHao guahao;//guahao对象
	private Patient patient;//patient对象
		
	public GuaHao getGuahao() {
		return guahao;
	}
	public void setGuahao(GuaHao guahao) {
		this.guahao = guahao;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public JFreeChart getChart() {
		return chart;
	}
	public void setChart(JFreeChart chart) {
		this.chart = chart;
	}

	DbUtil dbUtil=new DbUtil();
	GuaHaoDao guahaoDao=new GuaHaoDao();
	HttpServletRequest request;
	//当前用户
	User currentUser;
	
	@Override
    public String execute() throws Exception {
		//柱状图数据集合
		DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
		Connection con=null;
		// 获取Session
		HttpSession session=request.getSession();
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
		try{
		con=dbUtil.getCon();
		ResultSet rs = guahaoDao.guahaoChart(con,patient, guahao);
		int i=1;
		while(rs.next()){
				dataset.addValue((Number) rs.getObject(2), i++, (Comparable) rs.getObject(1));
		}	   
    	  
    	chart = ChartFactory.createBarChart3D(   
    	                                    "", // 图表标题   
    	                                    "挂号科室", // 目录轴的显示标签   
    	                                    "挂号数量", // 数值轴的显示标签   
    	                                    dataset, // 数据集   
    	                                    PlotOrientation.VERTICAL , // 图表方向：垂直   
    	                                    false, // 是否显示图例(对于简单的柱状图必须是false)   
    	                                    false, // 是否生成工具   
    	                                    false // 是否生成URL链接   
    	                            );   
    	          
    	//重新设置图标标题，改变字体   
    	chart.setTitle(new TextTitle("当前挂号情况统计", new Font("黑体", Font.ITALIC , 22)));   
    	CategoryPlot plot=(CategoryPlot)chart.getPlot();//获得图标中间部分，即plot
        
    	//设置柱状图最高一个柱到图片上端的距离  
        ValueAxis rangeAxis = plot.getRangeAxis();  
        rangeAxis.setUpperMargin(0.25);
        rangeAxis.setLowerMargin(0.15);
        
    	//取得横轴   
        CategoryAxis categoryAxis = plot.getDomainAxis();   
        //设置横轴显示标签的字体   
        categoryAxis.setLabelFont(new Font("宋体" , Font.BOLD , 16));   
        //分类标签以45度角倾斜   
        categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);   
        categoryAxis.setTickLabelFont(new Font("宋体" , Font.BOLD , 14));   
          
        //取得纵轴   
        NumberAxis numberAxis = (NumberAxis)plot.getRangeAxis();   
        //设置纵轴显示标签的字体   
        numberAxis.setLabelFont(new Font("宋体" , Font.BOLD , 18));   
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
        
        return SUCCESS;
    }
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

    
}