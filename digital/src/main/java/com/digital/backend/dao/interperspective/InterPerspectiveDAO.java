package com.digital.backend.dao.interperspective;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.digital.backend.bean.hotnews.HotNewsBean;
import com.digital.backend.bean.interperspective.InterPerspectiveBean;
import com.digital.backend.common.bean.CommonDataBean;

public class InterPerspectiveDAO {
	private static InterPerspectiveDAO interPerspectiveDAO;
	
	private InterPerspectiveDAO(){}
	
	public synchronized static InterPerspectiveDAO getInstance(){
		return interPerspectiveDAO == null ? new InterPerspectiveDAO() : interPerspectiveDAO;
	}
	
	public int getMaxId() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int id = 0;
		
		try{
			String sql = "select ifnull(max(id),0) as id from digital_interperspective";
			conn = DriverManager.getConnection("proxool.digital"); 
			pstmt= conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				id = rs.getInt("id");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		return id;
	}
	
	public void insertNewData(CommonDataBean bean) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			//prepare sql script
			StringBuffer sql = new StringBuffer();
			sql.append("insert into digital_interperspective (serialno, id, lang_id, title, subtitle, description, author, linkA, ")
				.append(" linkB, linkC, imgPathA, imgPathB, imgPathC, breadcrumbA, breadcrumbB, breadcrumbC, ")
				.append(" filePathA, filePathB, filePathC, createDate, top, enabled, isDelete, displayOrder ) ")
				.append(" values (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,now(), ?,?,?,0) ");
			
			conn = DriverManager.getConnection("proxool.digital"); 
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setNull(1, java.sql.Types.INTEGER);
			pstmt.setInt(2, bean.getId());
			pstmt.setInt(3, bean.getLang_id());
			pstmt.setNString(4, bean.getTitle());
			pstmt.setString(5, bean.getSubtitle());
			pstmt.setString(6, bean.getDescription());
			pstmt.setString(7, bean.getAuthor());
			pstmt.setString(8, bean.getLinkA());
			pstmt.setString(9, bean.getLinkB());
			pstmt.setString(10, bean.getLinkC());
			pstmt.setString(11, bean.getImageApath());
			pstmt.setString(12, bean.getImageBpath());
			pstmt.setString(13, bean.getImageCpath());
			pstmt.setInt(14, bean.getBreadcrumbA());
			pstmt.setInt(15, bean.getBreadcrumbB());
			pstmt.setInt(16, bean.getBreadcrumbC());
			pstmt.setString(17, bean.getFileApath());
			pstmt.setString(18, bean.getFileBpath());
			pstmt.setString(19, bean.getFileCpath());
			//pstmt.setNull(20, java.sql.Types.DATE);//default is now()
			pstmt.setBoolean(20, bean.getTop() == 1 ? true : false);
			pstmt.setBoolean(21, bean.getEnabled() == 1 ? true : false);
			pstmt.setBoolean(22, false);
			
			pstmt.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	}
	
	public void updateData(CommonDataBean bean) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			//prepare sql script
			StringBuffer sql = new StringBuffer();
			sql.append("update digital_interperspective set title = ?, subtitle = ?, description = ?, ")
				.append("                                           author = ?, linkA = ?, linkB = ?, linkC = ?,  ")
				.append("                                           breadcrumbA = ?, breadcrumbB = ?, breadcrumbC = ?,")
				.append("                                           top = ?, enabled = ? ");
			
			if(!"".equals(bean.getImageApath())){
				sql.append(",imgPathA = '" + bean.getImageApath() + "'");	
			}
			if(!"".equals(bean.getImageBpath())){
				sql.append(",imgPathB = '" + bean.getImageBpath() + "'");	
			}
			if(!"".equals(bean.getImageCpath())){
				sql.append(",imgPathC = '" + bean.getImageCpath() + "'");	
			}
			if(!"".equals(bean.getFileApath())){
				sql.append(", filePathA = '" + bean.getFileApath() + "'");
			}
			if(!"".equals(bean.getFileBpath())){
				sql.append(", filePathB = '" + bean.getFileBpath() + "'");
			}
			if(!"".equals(bean.getFileCpath())){
				sql.append(", filePathC = '" + bean.getFileCpath() + "'");
			}
			
			sql.append(" where id = " + bean.getId() + " and lang_id = " + bean.getLang_id());
			
			conn = DriverManager.getConnection("proxool.digital"); 
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getSubtitle());
			pstmt.setString(3, bean.getDescription());
			pstmt.setString(4, bean.getAuthor());
			pstmt.setString(5, bean.getLinkA());
			pstmt.setString(6, bean.getLinkB());
			pstmt.setString(7, bean.getLinkC());
			pstmt.setInt(8, bean.getBreadcrumbA());
			pstmt.setInt(9, bean.getBreadcrumbB());
			pstmt.setInt(10, bean.getBreadcrumbC());
			pstmt.setBoolean(11, bean.getTop() == 1 ? true : false);
			pstmt.setBoolean(12, bean.getEnabled() == 1 ? true : false);
			
			pstmt.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	}
	
	public ArrayList<CommonDataBean> getData(int id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommonDataBean> list = new ArrayList<CommonDataBean>();
		
		try{
			String sql = "select * from digital_interperspective where id = ? ";
			
			conn = DriverManager.getConnection("proxool.digital");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommonDataBean bean = new CommonDataBean();
				bean.setId(rs.getInt("id"));
				bean.setLang_id(rs.getInt("lang_id"));
				bean.setTitle(rs.getString("title"));
				bean.setSubtitle(rs.getString("subtitle"));
				bean.setAuthor(rs.getString("author"));
				bean.setDescription(rs.getString("description"));
				bean.setLinkA(rs.getString("linkA"));
				bean.setLinkB(rs.getString("linkB"));
				bean.setLinkC(rs.getString("linkC"));
				bean.setImageApath(rs.getString("imgPathA"));
				bean.setImageBpath(rs.getString("imgPathB"));
				bean.setImageCpath(rs.getString("imgPathC"));
				bean.setBreadcrumbA(rs.getInt("breadcrumbA"));
				bean.setBreadcrumbB(rs.getInt("breadcrumbB"));
				bean.setBreadcrumbC(rs.getInt("breadcrumbC"));
				bean.setFileApath(rs.getString("filePathA"));
				bean.setFileBpath(rs.getString("filePathB"));
				bean.setFileCpath(rs.getString("filePathC"));
				bean.setTop(rs.getInt("top"));
				bean.setEnabled(rs.getInt("enabled"));
				bean.setCreateDate(rs.getString("createDate"));
				bean.setPageviews(rs.getInt("pageViews"));
				bean.setDisplayOrder(rs.getInt("displayOrder"));
				list.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		return list;
	}
	
	public ArrayList<CommonDataBean> getDataByPage(int page, int page_size) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommonDataBean> list = new ArrayList<CommonDataBean>();
		
		try{
			String sql = "select * from digital_interperspective where lang_id = 1 and isDelete = false order by id desc limit ?, ? ";//only get cht version
			conn = DriverManager.getConnection("proxool.digital");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * page_size);
			pstmt.setInt(2, page_size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommonDataBean bean = new CommonDataBean();
				bean.setId(rs.getInt("id"));
				bean.setLang_id(rs.getInt("lang_id"));
				bean.setTitle(rs.getString("title"));
				bean.setSubtitle(rs.getString("subtitle"));
				bean.setAuthor(rs.getString("author"));
				bean.setDescription(rs.getString("description"));
				bean.setLinkA(rs.getString("linkA"));
				bean.setLinkB(rs.getString("linkB"));
				bean.setLinkC(rs.getString("linkC"));
				bean.setImageApath(rs.getString("imgPathA"));
				bean.setImageBpath(rs.getString("imgPathB"));
				bean.setImageCpath(rs.getString("imgPathC"));
				bean.setBreadcrumbA(rs.getInt("breadcrumbA"));
				bean.setBreadcrumbB(rs.getInt("breadcrumbB"));
				bean.setBreadcrumbC(rs.getInt("breadcrumbC"));
				bean.setFileApath(rs.getString("filePathA"));
				bean.setFileBpath(rs.getString("filePathB"));
				bean.setFileCpath(rs.getString("filePathC"));
				bean.setTop(rs.getInt("top"));
				bean.setEnabled(rs.getInt("enabled"));
				bean.setCreateDate(rs.getString("createDate"));
				bean.setDisplayOrder(rs.getInt("displayOrder"));
				list.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		return list;
	}

	public int getTotal() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		try{
			String sql = "select count(*) as count from digital_interperspective where lang_id = 1 and isDelete = false ";//only get cht version
			conn = DriverManager.getConnection("proxool.digital");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt("count");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		return total;
	}

	public void delDataById(int id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "update digital_interperspective set isDelete = true where id = ? ";
			conn = DriverManager.getConnection("proxool.digital");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	}
	
	public void updateDisplayOrderById(int id, int order) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "update digital_interperspective set displayOrder = ? where id = ? ";
			conn = DriverManager.getConnection("proxool.digital");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order);
			pstmt.setInt(2, id);
			pstmt.execute();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	}
}
