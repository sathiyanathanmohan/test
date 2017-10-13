package com.ennvee.ProjectManagement.dao;


import javax.jcr.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import org.apache.jackrabbit.commons.JcrUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.ennvee.ProjectManagement.beans.Allocationobject;
import com.ennvee.ProjectManagement.beans.ContactPersonObject;
import com.ennvee.ProjectManagement.beans.CustomerObject;
import com.ennvee.ProjectManagement.beans.Employeobject;
import com.ennvee.ProjectManagement.beans.LoginObject;
import com.ennvee.ProjectManagement.beans.MasterObject;
import com.ennvee.ProjectManagement.beans.ProjectObject;
import com.ennvee.ProjectManagement.beans.StatusObject;
import com.ennvee.ProjectManagement.beans.TimeSheetObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;


public class DataHandler {
	
	
	private ServerSocket s;

	public StatusObject insertproject(ProjectObject obj1)
	{
		StatusObject status=new StatusObject();
	
		String create="insert into project_details(project_code,project_name,project_description,start_date,end_date,"
				+ "center,location,contract_type,project_status,technology,customer_portfolio,services_offered,total_effort,"
				+ "onsite_effort,offshore_effort,project_manager,delivery_manager,onsite_coordinator,manager_remark,general_remark,created_date,create_by,"
				+ "updated_date,updated_by,status,remark,file_description,customer_id )"
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			ProjectObject obj=obj1;
		
			PreparedStatement pre=con.prepareStatement(create,Statement.RETURN_GENERATED_KEYS);
			pre.setString(1, obj.getproject_code().trim());
			if(obj.getproject_name().trim().length()!=0){
			pre.setString(2,obj.getproject_name());
			}
			pre.setString(3, obj.getproject_description());
			pre.setDate(4, (Date) obj.getstart_date());
			pre.setDate(5, (Date) obj.getend_date());
			pre.setString(6, obj.getcenter());
			pre.setString(7, obj.getlocation());
			pre.setString(8, obj.getcontract_type());
			pre.setString(9,obj.getproject_status());
			pre.setString(10,obj.gettechnology());
			pre.setString(11,obj.getcustomer_portfolio());
			pre.setString(12, obj.getservices_offered());
			pre.setString(13,obj.gettotal_effort());
			pre.setString(14, obj.getonsite_effort());
			pre.setString(15, obj.getoffshore_effort());
			pre.setString(16,obj.getproject_manager());
			pre.setString(17,obj.getdelivery_manger());
			pre.setString(18,obj.getonsite_cooedinator());
			pre.setString(19, obj.getmanager_remark());
			pre.setString(20, obj.getgeneral_remark());
			pre.setDate(21, (Date) obj.getcreated_date());
			pre.setString(22, obj.getcreated_by());
			pre.setDate(23,(Date) obj.getupdated_date());
			pre.setString(24,obj.getupdated_by());
			pre.setInt(25, obj.getstatus());
			pre.setString(26, obj.getremark());
			 pre.setString(27,obj.getfiledescription());
			 pre.setInt(28, obj.getcustomer_id());
			pre.executeUpdate();
			ResultSet rs = pre.getGeneratedKeys();
			if(rs.next()){
			int ud = rs.getInt(1);
			status.setprojectid(ud);
			}
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}

	//**************************************************************************************
	
	public List<Allocationobject> all_allocation_emp(String emp_code)
	{
		
		List<Allocationobject> list1=new ArrayList<Allocationobject>();
		String sql="select * from project_emp_mapping_details where emp_code='"+emp_code+"' and status=0";
		Allocationobject allocation;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				allocation=new Allocationobject();
				allocation.setid(res.getInt("id"));
				allocation.setproject_code(res.getString("project_code"));
				allocation.setemp_name(res.getString("emp_name"));
				allocation.setemp_code(res.getString("emp_code"));
				allocation.setpercentage_allocation(res.getInt("percentage_allocation"));
				allocation.setstart_date(res.getDate("start_date"));
				allocation.setend_date(res.getDate("end_date"));
				allocation.setproject_manager(res.getString("project_manager"));
				allocation.setlocation(res.getString("location"));
				list1.add(allocation);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	//*******************************************************************************
	//**************************************************************************************
	
		public List<Allocationobject> all_allocation_manager(String emp_code)
		{
			
			List<Allocationobject> list1=new ArrayList<Allocationobject>();
			String sql="select  distinct project_code from project_emp_mapping_details where project_manager='"+emp_code+"' and status=0";
			Allocationobject allocation;
			
			Connection con;
			
			Statement stm;
			try {
				con=DatabaseManagement.getConnection();
				stm = con.createStatement();
				ResultSet res=stm.executeQuery(sql);
				
				while(res.next())
				{
					allocation=new Allocationobject();
										allocation.setproject_code(res.getString("project_code"));
//					allocation.setemp_name(res.getString("emp_name"));
//					allocation.setemp_code(res.getString("emp_code"));
//					allocation.setpercentage_allocation(res.getInt("percentage_allocation"));
//					allocation.setstart_date(res.getDate("start_date"));
//					allocation.setend_date(res.getDate("end_date"));
//					allocation.setproject_manager(res.getString("project_manager"));
//					allocation.setlocation(res.getString("location"));
					list1.add(allocation);
									
				}
			} catch (SQLException e) {
			System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			
			return list1;
			
			
		}
		//*******************************************************************************
	public StatusObject editproject(ProjectObject obj1)
	{
		StatusObject status=new StatusObject();
		ProjectObject obj=obj1;
		Connection con;
		Statement stm;
		con=DatabaseManagement.getConnection();
		if(obj.getproject_status().equalsIgnoreCase("Closed")&&obj.getproject_status().equalsIgnoreCase("Completed")){
			System.out.println(obj.getproject_status());
			
			
			String all="update  project_emp_mapping_details set status=1 where project_code='"+obj.getproject_code()+"'";
			
			
			try {
				stm = con.createStatement();
				stm.execute(all);
				obj.setstatus(1);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
				}else
				{
					String all="update  project_emp_mapping_details set status=0 where project_code='"+obj.getproject_code()+"'";
					
					
					try {
						stm = con.createStatement();
						stm.execute(all);
						obj.setstatus(0);
					} catch (SQLException e) {
						
						e.printStackTrace();
					}	
				}
		
		String edit="UPDATE project_details SET project_code=?,project_name=?,project_description=?,start_date=?,end_date=?,"
				+ "center=?,location=?,contract_type=?,project_status=?,technology=?,customer_portfolio=?,services_offered=?,total_effort=?,"
				+ "onsite_effort=?,offshore_effort=?,project_manager=?,delivery_manager=?,onsite_coordinator=?,manager_remark=?,general_remark=?,"
				+ "updated_date=?,updated_by=?,status=?,remark=?,file_description=?,customer_id=? "
				                  + " WHERE id= ?";
		
		try {
			
			
		
			PreparedStatement pre=con.prepareStatement(edit);
			pre.setString(1, obj.getproject_code());
			pre.setString(2,obj.getproject_name());
			pre.setString(3, obj.getproject_description());
			pre.setDate(4, (Date) obj.getstart_date());
			pre.setDate(5, (Date) obj.getend_date());
			pre.setString(6, obj.getcenter());
			pre.setString(7, obj.getlocation());
			pre.setString(8, obj.getcontract_type());
			pre.setString(9,obj.getproject_status());
			pre.setString(10,obj.gettechnology());
			pre.setString(11,obj.getcustomer_portfolio());
			pre.setString(12, obj.getservices_offered());
			pre.setString(13,obj.gettotal_effort());
			pre.setString(14, obj.getonsite_effort());
			pre.setString(15, obj.getoffshore_effort());
			pre.setString(16,obj.getproject_manager());
			pre.setString(17,obj.getdelivery_manger());
			pre.setString(18,obj.getonsite_cooedinator());
			pre.setString(19, obj.getmanager_remark());
			pre.setString(20, obj.getgeneral_remark());
			
			pre.setDate(21,(Date) obj.getupdated_date());
			pre.setString(22,obj.getupdated_by());
			pre.setInt(23, obj.getstatus());
			pre.setString(24, obj.getremark());
			pre.setString(25, obj.getfiledescription());
			pre.setInt(26, obj.getcustomer_id());
			pre.setInt(27, obj.getid()); 
			pre.executeUpdate();
			
			status.setStatusCode(0);
			status.setprojectid( obj.getid());
		} 
		catch (SQLException e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		return status ;
		
	}

	
	//**************************************************************************************

	public List<CustomerObject> getcustomerdeatils()
	{
		
		
		List<CustomerObject> list = new ArrayList<CustomerObject>();
		CustomerObject cus;
		String sql="select *  from customer_portfolio_details ";
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next())
			{
				cus=new CustomerObject();
				cus.setcustomer_code(res.getString("customer_code"));
				list.add(cus);
			}
			
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return list;		
	}
	//**************************************************************************************

	
	public List<Employeobject> getemployeedetails(String designation)
	{
		List<Employeobject> list=new ArrayList<Employeobject>();
		Employeobject emp;
		String sql="select * from employee_details where designation='"+designation+"'";
	//	System.out.println(sql);
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next())
			{
				emp=new Employeobject();
				emp.setemp_code(res.getString("emp_code"));
				emp.setfirst_name(res.getString("first_name"));
				emp.setlast_name(res.getString("last_name"));
				emp.setlocation(res.getString("location"));
				emp.setdesignation(res.getString("designation"));
				list.add(emp);
			//	System.out.println(res.getString("emp_code"));
				
			}

		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list;
		
		
		
		
	}
	
	//**************************************************************************************

	//**************************************************************************************

	
		public List<Employeobject> getemployee(String emp_code)
		{
			List<Employeobject> list=new ArrayList<Employeobject>();
			Employeobject emp;
			String sql="select * from employee_details where emp_code='"+emp_code+"' ";
			try
			{
				Connection con;
				con=DatabaseManagement.getConnection();
				Statement stm=con.createStatement();
				ResultSet res=stm.executeQuery(sql);
				while(res.next())
				{
					emp=new Employeobject();
	                emp.setid(res.getInt("id"));
					emp.setemp_code(res.getString("emp_code"));
					emp.setfirst_name(res.getString("first_name"));
					emp.setlast_name(res.getString("last_name"));
					emp.setlocation(res.getString("location"));
					emp.setdesignation(res.getString("designation"));
					emp.setemp_mail(res.getString("mail"));
					emp.setstatus(res.getInt("status"));
					list.add(emp);
					
					
				}

			}catch(SQLException e)
			{
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			
			return list;
			
			
			
			
		}
		
		//**************************************************************************************
		//**************************************************************************************

		
			public List<Employeobject> getemployeekeypress(String emp_code)
			{
				List<Employeobject> list=new ArrayList<Employeobject>();
				Employeobject emp;
				String sql="Select * from employee_details  where emp_code LIKE '"+emp_code+"%' order by emp_code asc ";
				try
				{
					Connection con;
					con=DatabaseManagement.getConnection();
					Statement stm=con.createStatement();
					ResultSet res=stm.executeQuery(sql);
					while(res.next())
					{
						emp=new Employeobject();
						emp.setemp_code(res.getString("emp_code"));
//						emp.setfirst_name(res.getString("first_name"));
//						emp.setlast_name(res.getString("last_name"));
						list.add(emp);
						
						
					}

				}catch(SQLException e)
				{
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				
				return list;
				
				
				
				
			}

			
			public List<Employeobject> getemployeenamekeypress(String emp_name)
			{
				List<Employeobject> list=new ArrayList<Employeobject>();
				Employeobject emp;
				String sql="Select * from employee_details  where first_name LIKE '"+emp_name+"%' order by first_name asc ";
				try
				{
					Connection con;
					con=DatabaseManagement.getConnection();
					Statement stm=con.createStatement();
					ResultSet res=stm.executeQuery(sql);
					while(res.next())
					{
						emp=new Employeobject();
//						emp.setemp_code(res.getString("emp_code"));
						emp.setfirst_name(res.getString("first_name"));
//						emp.setlast_name(res.getString("last_name"));
						list.add(emp);
						
						
					}

				}catch(SQLException e)
				{
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				
				return list;
				
				
				
				
			}

			
					
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			public List<Employeobject> get_employeecodekeypress(String emp_code)
			{
				List<Employeobject> list=new ArrayList<Employeobject>();
				Employeobject emp;
				String sql="Select * from employee_details  where emp_code LIKE '"+emp_code+"%'";
				try
				{
					Connection con;
					con=DatabaseManagement.getConnection();
					Statement stm=con.createStatement();
					ResultSet res=stm.executeQuery(sql);
											
					emp=new Employeobject();
					
					if (!res.next() ) {
						
						emp.setstatus(0);
					} else {
emp.setstatus(1);
					}
				}catch(SQLException e)
				{
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				
				return list;
				
				
				
				
			}
			

			
			//**************************************************************************************

	public List<ProjectObject> get_allprojectdetails()
	{
	
		List<ProjectObject> list=new ArrayList<ProjectObject>();
		ProjectObject pro;
		String sql="select * from project_details ";
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next())
			{
				pro=new ProjectObject();
				pro.setid(res.getInt("id"));
				pro.setproject_code(res.getString("project_code"));
			pro.setproject_name(res.getString("project_name"));
			pro.setproject_description(res.getString("project_description"));
			pro.setproject_status(res.getString("project_status"));
			pro.setstart_date(res.getDate("start_date"));
			pro.setend_date(res.getDate("end_date"));
			pro.setproject_manager(res.getString("project_manager"));
			list.add(pro);
				
				
		}

	}catch(SQLException e)
	{
		
		System.out.println(e.getMessage());
		e.printStackTrace();
		
	}
		
		
		return list;
	
	
	
	}
	
	

	//**************************************************************************************
	
	
	public StatusObject project_allocation(Allocationobject obj1 )
	{
		
		
		StatusObject status=new StatusObject();

		String allocate="insert into project_emp_mapping_details (emp_code,emp_name,project_code,location,project_manager,percentage_allocation,start_date,end_date,created_date,created_by,updated_date,"
				+ "updated_by,status,remark) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		
		
		
		
		boolean already=true;
		
		
		
		try {
			Allocationobject obj=obj1;
			Connection con;
			con=DatabaseManagement.getConnection();
			String check="select emp_code,project_code from project_emp_mapping_details where project_code='"+obj.getproject_code()+ "' and emp_code='"+obj.getemp_code()+"' ";
			Statement stm=con.createStatement();
			System.out.println(check);
		ResultSet res=stm.executeQuery(check);
			while(res.next()){
				System.out.println(res.getString("emp_code"));
				already=false;
			}
			
			if(already){
			
			PreparedStatement pre=con.prepareStatement(allocate);
			pre.setString(1, obj.getemp_code());
			pre.setString(2, obj.getemp_name());
			pre.setString(3,obj.getproject_code());
			pre.setString(4,obj.getlocation());
			pre.setString(5,obj.getproject_manager());
		    pre.setInt(6, obj.getpercentage_allocation());
		    pre.setDate(7, (Date) obj.getstart_date());
		    pre.setDate(8,(Date)obj.getend_date());
			pre.setDate(9, (Date) obj.getcreated_date());
			pre.setString(10, obj.getcreated_by());
			pre.setDate(11,(Date) obj.getupdated_date());
			pre.setString(12,obj.getupdated_by());
			pre.setInt(13, 0);
			pre.setString(14, obj.getremark());
			 
			pre.executeUpdate();
			
			status.setStatusCode(0);
			}else{
				status.setStatusCode(1);
				System.out.println(" already allocated ");
				status.setStatusCode(5);
				status.setStatusMessage("already employee allocated ");
				
			}
			
		} 
		catch (SQLException e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
		return status;
		
	}
	

	//**************************************************************************************
	
	
	public StatusObject update_allocation(Allocationobject obj1 )
	{
		boolean already=true;
		
		StatusObject status=new StatusObject();
		
		
		
		
		
		
		
		
		String edit="UPDATE project_emp_mapping_details SET emp_code=?,emp_name=?,location=?,project_manager=?,percentage_allocation=?,start_date=?,end_date=?,created_date=?,created_by=?,updated_date=?,"
				+ "updated_by=?,status=?,remark=? where id=?";
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Allocationobject obj=obj1;
			
			
			PreparedStatement pre=con.prepareStatement(edit);
			pre.setString(1, obj.getemp_code());
			pre.setString(2, obj.getemp_name());
			pre.setString(3,obj.getlocation());
			pre.setString(4,obj.getproject_manager());
		    pre.setInt(5, obj.getpercentage_allocation());
		    pre.setDate(6, (Date) obj.getstart_date());
		    pre.setDate(7,(Date)obj.getend_date());
			pre.setDate(8, (Date) obj.getcreated_date());
			pre.setString(9, obj.getcreated_by());
			pre.setDate(10,(Date) obj.getupdated_date());
			pre.setString(11,obj.getupdated_by());
			pre.setInt(12, obj.getstatus());
			pre.setString(13, obj.getremark());
			 pre.setInt(14,obj.getid());
			pre.executeUpdate();
			
			status.setStatusCode(0);
			
		} 
		catch (SQLException e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
		return status;
		
	}
	//**************************************************************************************
		public List<Employeobject> getemployees_login()
		{
			List<Employeobject> list=new ArrayList<Employeobject>();
			Employeobject emp;
			String sql="select * from employee_details order by emp_code asc";
		//	System.out.println(sql);
			try
			{
				Connection con;
				con=DatabaseManagement.getConnection();
				Statement stm=con.createStatement();
				ResultSet res=stm.executeQuery(sql);
				while(res.next())
				{
					emp=new Employeobject();
					emp.setemp_code(res.getString("emp_code"));
					emp.setfirst_name(res.getString("first_name"));
					emp.setlast_name(res.getString("last_name"));
					emp.setlocation(res.getString("location"));
					emp.setdesignation(res.getString("designation"));
					emp.setstatus(res.getInt("status"));
					list.add(emp);
				//	System.out.println(res.getString("emp_code"));
					
				}

			}catch(SQLException e)
			{
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			
			return list;
			
			
			
			
		}
		
		
		public StatusObject create_employee(Employeobject obj1) 
		{
			boolean already=true;
			
			StatusObject status=new StatusObject();
			
			
			
			
			
			
			
			
			String insert="insert into employee_details(emp_code,first_name,mail,designation,status) values(?,?,?,?,?)";
			try {
				Connection con;
				con=DatabaseManagement.getConnection();
				Employeobject obj=obj1;
				
				
				PreparedStatement pre=con.prepareStatement(insert);
				pre.setString(1, obj.getemp_code());
				pre.setString(2,obj.getfirst_name());
				pre.setString(3, obj.getemp_mail());
				pre.setString(4, obj.getdesignation());
				pre.setInt(5, obj.getstatus());
				pre.executeUpdate();
				
				status.setStatusCode(0);
				
			} 	
//			catch(SQLIntegrityConstraintViolationException e) 
//			{
//				System.out.println("prepare statement error");
//				status.setStatusCode(-5);
//				status.setStatusMessage("emplyee code already exit");
//				e.printStackTrace();
//			}
			catch(NullPointerException e)
			{
				System.out.println("prepare statement error1");
				status.setStatusCode(-1);
				status.setStatusMessage("project code empty");
				e.printStackTrace();
			}catch(SQLException e){
			    if(e.getErrorCode() == 2627 ){
			    	System.out.println("prepare statement error");
					status.setStatusCode(-5);
					status.setStatusMessage("emplyee code already exit");
					e.printStackTrace(); 
			    }else
			    {
			    	int errorcode=e.getErrorCode();
			    	System.out.println("prepare statement error");
					status.setStatusCode(-1);
					status.setStatusMessage(" unknow error"+errorcode);
					e.printStackTrace();

			    }
			}
			
			
		
			return status;
					
			
			
		}
		

		public StatusObject edit_employee(Employeobject obj1) 
		{
			boolean already=true;
			
			StatusObject status=new StatusObject();
			
			
			
			
			
			
			
			
			String insert="update  employee_details set  emp_code=?,first_name=?,mail=?,designation=?,status=? where id=?";
			try {
				Connection con;
				con=DatabaseManagement.getConnection();
				Employeobject obj=obj1;
				
				
				PreparedStatement pre=con.prepareStatement(insert);
				pre.setString(1, obj.getemp_code());
				pre.setString(2,obj.getfirst_name());
				pre.setString(3, obj.getemp_mail());
				pre.setString(4, obj.getdesignation());
				pre.setInt(5, obj.getstatus());
				pre.setInt(6, obj.getid());
				pre.executeUpdate();
				
				status.setStatusCode(0);
				
			} 	
//			catch(SQLIntegrityConstraintViolationException e) 
//			{
//				System.out.println("prepare statement error");
//				status.setStatusCode(-5);
//				status.setStatusMessage("emplyee code already exit");
//				e.printStackTrace();
//			}
			catch(NullPointerException e)
			{
				System.out.println("prepare statement error1");
				status.setStatusCode(-1);
				status.setStatusMessage("project code empty");
				e.printStackTrace();
			}catch(SQLException e){
			    if(e.getErrorCode() == 2627 ){
			    	System.out.println("prepare statement error");
					status.setStatusCode(-5);
					status.setStatusMessage("emplyee code already exit");
					e.printStackTrace(); 
			    }else
			    {
			    	int errorcode=e.getErrorCode();
			    	System.out.println("prepare statement error");
					status.setStatusCode(-1);
					status.setStatusMessage(" unknow error"+errorcode);
					e.printStackTrace();

			    }
			}
			
			
		
			return status;
					
			
			
		}
		

		
		
		
		//**************************************************************************************
		public StatusObject login_creation(LoginObject obj1)
		{
			StatusObject status=new StatusObject();
			String create="insert into login_details(user_name,password,emp_id,created_date,created_by,updated_date,updated_by,status,remark,role)" 
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			
			
			
				boolean already=true;
			
			
			
			try {
				LoginObject obj=obj1;
				Connection con;
				con=DatabaseManagement.getConnection();
				String check="select * from login_details where emp_id='"+obj.getemp_id()+"'";
				Statement stm=con.createStatement();
				System.out.println(check);
				ResultSet res=stm.executeQuery(check);
				
				while(res.next()){
//				System.out.println("data"+res.getInt("Company"));
					already=false;
				}
				System.out.println("Boolean"+already);
				if(already){
					PreparedStatement pre=con.prepareStatement(create,Statement.RETURN_GENERATED_KEYS);
					pre.setString(1, obj.getuser_name().trim());
					pre.setString(2, obj.getpassword());
					pre.setString(3, obj.getemp_id());
					pre.setDate(4, (Date) obj.getcreated_date());
					pre.setString(5, obj.getcreated_by());
					pre.setDate(6,(Date) obj.getupdated_date());
					pre.setString(7,obj.getupdated_by());
					pre.setInt(8, obj.getstatus());
					pre.setString(9, obj.getremark());
					pre.setString(10, obj.getrole());
					pre.executeUpdate();
					status.setStatusCode(0);
				
				}else{
					status.setStatusCode(1);
					System.out.println("Login Already Created");
					status.setStatusCode(5);
					status.setStatusMessage("Login already created");	
				}	
			} 
			catch (SQLException e) {
				System.out.println("prepare statement error");
				status.setStatusCode(-1);
				status.setStatusMessage(e.getMessage());
				e.printStackTrace();
			}  
			return status;
		}

		//****************************************************************************************************
				public StatusObject updatepass(LoginObject obj1)
				{
					StatusObject status=new StatusObject();
					LoginObject obj=obj1;
					Connection con;
					
					con=DatabaseManagement.getConnection();
				
						
						
						String all="update  login_details set password=? where emp_id=?";
					
					
						
						try {
							PreparedStatement pre=con.prepareStatement(all);
							pre.setString(1, obj.getpassword());
							pre.setString(2, obj.getemp_id());
							pre.executeUpdate();
							status.setStatusCode(0);
							System.out.println("query"+all);
							
						}
							catch(SQLIntegrityConstraintViolationException e) 
							{
								System.out.println("prepare statement error");
								status.setStatusCode(-5);
								status.setStatusMessage("customer code code already exit");
								e.printStackTrace();
							}
							catch(NullPointerException e)
							{
								System.out.println("prepare statement error");
								status.setStatusCode(-1);
								status.setStatusMessage("project code empty");
								e.printStackTrace();
							}
							catch (Exception e) {
								System.out.println("prepare statement error");
								status.setStatusCode(-1);
								status.setStatusMessage(e.getMessage());
								e.printStackTrace();
							}  
					  
							
							
							return status ;
				}

				
				//**************************************************************************************
	//**************************************************************************************

	public List<LoginObject> getlogin(String empid,String password)
	{
		
		
		String sql="select * from login_details where emp_id='"+empid+"' and password='"+password+"'";
		LoginObject login;
	
		List<LoginObject> list=new ArrayList<LoginObject>();
		StatusObject status=new StatusObject();
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			System.out.println(sql);
			while(res.next())
			{
				
				login=new LoginObject();
				//login.setuser_name(res.getString("user_name"));
		
				login.setrole(res.getString("role"));
				login.setemp_id(res.getString("emp_id"));
				login.setcreated_date(res.getDate("created_date"));
				login.setcreated_by(res.getString("created_by"));
				login.setupdated_date(res.getDate("updated_date"));
				login.setupdated_by(res.getString("updated_by"));
				login.setstatus(res.getInt("status"));
				login.setremark(res.getString("remark"));
				list.add(login);
				
				status.setStatusCode(0);
				
			}
			
		}catch(Exception e)
		{
			System.out.println("data base error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//**************************************************************************************

	public List<MasterObject> get_master_deatils(String category)
	{
		
		List<MasterObject> list=new ArrayList<MasterObject>();
		MasterObject master;
		String sql="select * from master_table_details where category ='"+category+"'";
//		System.out.println(sql);
		StatusObject status=new StatusObject();
		try
		{
		
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
		
			while(res.next()) {
				 master=new MasterObject();
				master.setcategory(res.getString("category"));
				master.setitem(res.getString("item"));
				master.setitem_descrption(res.getString("item_description"));
				list.add(master);
				
				status.setStatusCode(0);
				
				
				
				
			}
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	
	//**************************************************************************************
	public List<Allocationobject> all_allocation(String project_code)
	{
		
		List<Allocationobject> list1=new ArrayList<Allocationobject>();
		String sql="Select * from project_emp_mapping_details where project_code='"+project_code+"' and status=0";
		Allocationobject allocation;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				allocation=new Allocationobject();
				allocation.setid(res.getInt("id"));
				allocation.setproject_code(res.getString("project_code"));
				allocation.setemp_name(res.getString("emp_name"));
				allocation.setemp_code(res.getString("emp_code"));
				allocation.setpercentage_allocation(res.getInt("percentage_allocation"));
				allocation.setstart_date(res.getDate("start_date"));
				allocation.setend_date(res.getDate("end_date"));
				allocation.setproject_manager(res.getString("project_manager"));
				allocation.setlocation(res.getString("location"));
				list1.add(allocation);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	public List<Allocationobject> one_allocation(int id)
	{
		
		List<Allocationobject> list1=new ArrayList<Allocationobject>();
		String sql="Select * from project_emp_mapping_details where id="+id;
		Allocationobject allocation;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next())
			{
				allocation=new Allocationobject();
				allocation.setid(res.getInt("id"));
				allocation.setproject_code(res.getString("project_code"));
				allocation.setemp_name(res.getString("emp_name"));
				allocation.setemp_code(res.getString("emp_code"));
				allocation.setpercentage_allocation(res.getInt("percentage_allocation"));
				allocation.setstart_date(res.getDate("start_date"));
				allocation.setend_date(res.getDate("end_date"));
				allocation.setproject_manager(res.getString("project_manager"));
				allocation.setlocation(res.getString("location"));
				list1.add(allocation);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	

	public List<ProjectObject> get_project(int id)
	{
		List<ProjectObject> list=new ArrayList<ProjectObject>();
		ProjectObject pro;
		String sql="select * from project_details where id='"+id+"'";
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			pro=new ProjectObject();
			while(res.next())
			{
			pro.setid(res.getInt("id"));	
			pro.setproject_code(res.getString("project_code"));
			pro.setproject_name(res.getString("project_name"));
			pro.setproject_description(res.getString("project_description"));
		
			pro.setproject_description(res.getString("project_description"));
			pro.setstart_date(res.getDate("start_date"));
			pro.setend_date(res.getDate("end_date"));
			pro.setcenter(res.getString("center"));
			pro.setlocation(res.getString("location"));
			pro.setcontract_type(res.getString("contract_type"));
			pro.setproject_status(res.getString("project_status"));
			pro.settechnology(res.getString("technology"));
			pro.setcustomer_portfolio(res.getString("customer_portfolio"));
			pro.setservices_offered(res.getString("services_offered"));
			pro.settotal_effort(res.getString("total_effort"));
			pro.setonsite_cooedinator(res.getString("onsite_coordinator"));
			pro.setmanager_remark(res.getString("manager_remark"));
			pro.setgeneral_remark(res.getString("general_remark"));
			pro.setonsite_effort(res.getString("onsite_effort"));
			pro.setoffshore_effort(res.getString("offshore_effort"));
			pro.setproject_manager(res.getString("project_manager"));
			pro.setdelivery_manger(res.getString("delivery_manager"));
			pro.setfilename(res.getString("filename"));
			pro.setfiledescription(res.getString("file_description"));
		    pro.setcustomer_id(res.getInt("customer_id"));
		   
			list.add(pro);
		
	}
	
	
			
	}catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	
		return list;
}
	
	
	
	
	public List<ProjectObject> get_projectcode(String project_code)
	{
		List<ProjectObject> list=new ArrayList<ProjectObject>();
		ProjectObject pro;
		String sql="select * from project_details where project_code='"+project_code+"'";
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			pro=new ProjectObject();
			while(res.next())
			{
			pro.setid(res.getInt("id"));	
			pro.setproject_code(res.getString("project_code"));
			pro.setproject_name(res.getString("project_name"));
			pro.setproject_description(res.getString("project_description"));
		
			pro.setproject_description(res.getString("project_description"));
			pro.setstart_date(res.getDate("start_date"));
			pro.setend_date(res.getDate("end_date"));
			pro.setcenter(res.getString("center"));
			pro.setlocation(res.getString("location"));
			pro.setcontract_type(res.getString("contract_type"));
			pro.setproject_status(res.getString("project_status"));
			pro.settechnology(res.getString("technology"));
			pro.setcustomer_portfolio(res.getString("customer_portfolio"));
			pro.setservices_offered(res.getString("services_offered"));
			pro.settotal_effort(res.getString("total_effort"));
			pro.setonsite_cooedinator(res.getString("onsite_coordinator"));
			pro.setmanager_remark(res.getString("manager_remark"));
			pro.setgeneral_remark(res.getString("general_remark"));
			pro.setonsite_effort(res.getString("onsite_effort"));
			pro.setoffshore_effort(res.getString("offshore_effort"));
			pro.setproject_manager(res.getString("project_manager"));
			pro.setdelivery_manger(res.getString("delivery_manager"));
			pro.setfilename(res.getString("filename"));
			pro.setfiledescription(res.getString("file_description"));
		    pro.setcustomer_id(res.getInt("customer_id"));
		   
			list.add(pro);
		
	}
	
	
			
	}catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	
		return list;
}
	
	
	public List<ProjectObject> get_all_file_name(int project_id)
	{
		List<ProjectObject> list=new ArrayList<ProjectObject>();
		ProjectObject pro;
		System.out.println(project_id);
		String sql="select * from projectid_file_mapping where project_id="+project_id;
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				pro=new ProjectObject();
			pro.setid(res.getInt("id"));	
			System.out.println(res.getString("file_name"));
			pro.setfilename(res.getString("file_name"));
					   
			list.add(pro);
		
	}
	
	
			
	}catch (SQLException e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	
		return list;
}
	
	
	
	
	
	
	
	
	
	
	
	public StatusObject fileUpload(ProjectObject obj1)
	{
		StatusObject status=new StatusObject();
	
		
	ProjectObject obj=obj1;
		String edit="UPDATE project_details SET filename=?"
				                  + " WHERE id= ?";
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			
		
			PreparedStatement pre=con.prepareStatement(edit);
			
			pre.setString(1,obj.getfilename());
			pre.setInt(2,obj.getid());
			 
			pre.executeUpdate();
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		String  UPLOAD_PATH = null;
		 try
		    {
			 int id=obj.getid();
			 String filename=obj.getfilename();
			 InputStream fileInputStream=obj.getfile();
			

			
			 
		    	 File dic = new File("d:\\temp\\"+id+"\\files");
		    	
		         if (!dic.exists()) {
		             if (dic.mkdirs()) {
		                 System.out.println("Multiple directories are created!");
		                 dic.mkdir();
		                 UPLOAD_PATH = "d:/temp/"+id+"/files";
		                 int read = 0;
		 		        byte[] bytes = new byte[1024];

		 		        OutputStream out = new FileOutputStream(new File(UPLOAD_PATH+"/" + filename));
		 		        while ((read = fileInputStream.read(bytes)) != -1) 
		 		        {
		 		            out.write(bytes, 0, read);
		 		        }
		 		        out.flush();
		 		        out.close();
		 		        status.setStatusCode(0);
		 		        status.setStatusMessage("upload");
		             } else {
		                 System.out.println("Failed to create multiple directories!");
		             }
		         }
		    
		       
		       
		    } catch (IOException e) 
		    {
		    	status.setStatusCode(1);
		    	e.printStackTrace();
		    	status.setStatusMessage(e.getMessage());
				
		    }
		
		
		return status ;
		
	}
	
	
	
	public StatusObject filechange(ProjectObject obj1) throws IOException, RepositoryException
	{
		StatusObject status=new StatusObject();
	
		
		
		Repository repository = JcrUtils.getRepository();
		System.out.println("after repository");
		javax.jcr.Session session = repository.login(new SimpleCredentials("admin",
				"admin".toCharArray()));
		ProjectObject obj=obj1;
		String filename=obj.getfilename();
//		String rootPath = System.getProperty("catalina.home");
//		System.out.println(rootPath);
		

		
		String id=String.valueOf(obj.getid());
		
		 
		
		InputStream stream = obj.getfile();
		try
		{
	         Node folder = session.getRootNode(); 
	         Node checkNode=null;
	         if(folder.hasNode(id))
	         {
	         checkNode=folder.getNode(id);
	         }else
	         {
	        	 checkNode=folder.addNode(id);
	         }
	        		 
	         
	         Node file = checkNode.addNode(filename,"nt:file");
	         Node content = file.addNode("jcr:content","nt:resource");
	         Binary binary = session.getValueFactory().createBinary(stream);
	         content.setProperty("jcr:data",binary);
	         session.save();
	         stream.close();
	      
		}
		catch(Exception e)
		{
			status.setStatusCode(-1);
 			status.setStatusMessage("Filename already Exit");
 			e.printStackTrace();
		}finally{
            session.logout(); 
        }

         
         String edit="insert into projectid_file_mapping(file_name,project_id,file_descrption) values(?,?,?) ";
 		try {
 			Connection con;
 			con=DatabaseManagement.getConnection();
 			
 		
 			PreparedStatement pre=con.prepareStatement(edit);
 			
 			pre.setString(1,obj.getfilename());
 			pre.setInt(2,obj.getid());
 			 pre.setString(3, obj.getfiledescription());
 			pre.executeUpdate();
 			
 			status.setStatusCode(0);
 			
 		} 
 		catch(NullPointerException e)
 		{
 			System.out.println("prepare statement error");
 			status.setStatusCode(-1);
 			status.setStatusMessage("project code empty");
 			e.printStackTrace();
 		}
 		catch (Exception e) {
 			System.out.println("prepare statement error");
 			status.setStatusCode(-1);
 			status.setStatusMessage(e.getMessage());
 			e.printStackTrace();
 		}  

         
         status.setStatusCode(0);
         status.setStatusMessage("file reupload success");
		
		
		
		
		
		
		

		
		return status ;
		
	}
	
	
	
	
	public List<CustomerObject> all_customer()
	{
		//StatusObject status=new StatusObject();
		List<CustomerObject> list1=new ArrayList<CustomerObject>();
		String sql="Select * from  customer_portfolio_details";
		CustomerObject customer;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
			customer=new CustomerObject();
			customer.setid(res.getInt("customer_id"));
			customer.setcustomer_code(res.getString("customer_code"));
			customer.setcompany_name(res.getString("company_name"));
			customer.setcustomer_state(res.getString("customer_state"));
			customer.setcustomer_country(res.getString("customer_country"));
			
			list1.add(customer);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	public List<ContactPersonObject> all_contactperson(int customer_id)
	{
		//StatusObject status=new StatusObject();
		List<ContactPersonObject> list1=new ArrayList<ContactPersonObject>();
		String sql="Select * from  customercode_contactperson_mapping where customer_id="+customer_id;
		ContactPersonObject contactperson;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				contactperson=new ContactPersonObject();
				contactperson.setid(res.getInt("id"));
				contactperson.setcustomer_code(res.getString("customer_code"));
				contactperson.setcustomer_id(res.getInt("customer_id"));
				contactperson.setmail(res.getString("contact_mail"));
				contactperson.setperson_name(res.getString("person_name"));
				contactperson.setcontact_no1(res.getLong("contact_number1"));
				contactperson.setcontact_no2(res.getLong("contact_number2"));
				
				
				list1.add(contactperson);
				
				
				
				
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	public List<ContactPersonObject> get_allcontact_person_onproject(int customer_id,int project_id)
	{
		//StatusObject status=new StatusObject();
		List<ContactPersonObject> list1=new ArrayList<ContactPersonObject>();
		String sql="Select * from  customercontactperson_project_mapping where customer_id="+customer_id+" and project_id="+project_id;
		ContactPersonObject contactperson;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				contactperson=new ContactPersonObject();
				contactperson.setid(res.getInt("contact_person_id"));
				contactperson.setcustomer_id(res.getInt("customer_id"));
				contactperson.setproject_id(res.getInt("project_id"));
				
				list1.add(contactperson);
				
				
				
				
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	public List<ContactPersonObject> one_contactperson(int id)
	{
		//StatusObject status=new StatusObject();
		List<ContactPersonObject> list1=new ArrayList<ContactPersonObject>();
		String sql="Select * from  customercode_contactperson_mapping where id="+id;
		ContactPersonObject contactperson;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				contactperson=new ContactPersonObject();
				contactperson.setid(res.getInt("id"));
				contactperson.setcustomer_code(res.getString("customer_code"));
				contactperson.setcustomer_id(res.getInt("customer_id"));
				contactperson.setmail(res.getString("contact_mail"));
				contactperson.setperson_name(res.getString("person_name"));
				contactperson.setcontact_no1(res.getLong("contact_number1"));
				contactperson.setcontact_no2(res.getLong ("contact_number2"));
				
				
				list1.add(contactperson);
				
				
				
				
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	public List<CustomerObject> one_contact(int id)
	{
		//StatusObject status=new StatusObject();
		List<CustomerObject> list1=new ArrayList<CustomerObject>();
		String sql="Select * from  customer_portfolio_details where customer_id="+id;
		CustomerObject customer;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				customer=new CustomerObject();
				customer.setid(res.getInt("customer_id"));
				customer.setcustomer_code(res.getString("customer_code"));
				customer.setcompany_name(res.getString("company_name"));
				customer.setarea_code(res.getString("area_code"));
				customer.setcontact_phone1(res.getLong("contact_phone1"));
				customer.setcustomer_mail(res.getString("customer_mail"));
				customer.setwebsite_name(res.getString("website_name"));
				customer.setcustomer_street1(res.getString("customer_street1"));
				customer.setcustomer_street2(res.getString("customer_street2"));
				customer.setcustomer_city(res.getString("customer_city"));
				customer.setcustomer_state(res.getString("customer_state"));
				customer.setcustomer_country(res.getString("customer_country"));
				customer.setcustomer_zipcode(res.getString("customer_zipcode"));
				
				
				list1.add(customer);
				
				
				
				
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	public StatusObject updatecontactperson(ContactPersonObject obj1)
	{
		StatusObject status=new StatusObject();
	
		String create="insert into customercontactperson_project_mapping(project_id,customer_id,contact_person_id) "
				+ "values(?,?,?)";
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			ContactPersonObject obj=obj1;
		
			PreparedStatement pre=con.prepareStatement(create);
			pre.setInt(1, obj.getproject_id());
			pre.setInt(2, obj.getcustomer_id());
			pre.setInt(3, obj.getid());
			pre.executeUpdate();
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	
	public void deleteallcontact(int project_id ){
		

		String create="delete  from customercontactperson_project_mapping where project_id=? ";
			System.out.println(create);
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
		
		
			PreparedStatement pre=con.prepareStatement(create);
			pre.setInt(1, project_id);
			
			pre.executeUpdate();
		
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
		
		
	}
	
	public StatusObject contactpersonreupdate(ContactPersonObject obj1)
	{
		StatusObject status=new StatusObject();
	
		String create="insert into customercontactperson_project_mapping(project_id,customer_id,contact_person_id) "
				+ "values(?,?,?)";
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			ContactPersonObject obj=obj1;
		
			PreparedStatement pre=con.prepareStatement(create);
			pre.setInt(1, obj.getproject_id());
			pre.setInt(2, obj.getcustomer_id());
			pre.setInt(3, obj.getid());
			pre.executeUpdate();
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	public StatusObject createcustomer(CustomerObject obj1)
	{
		StatusObject status=new StatusObject();
		Connection con;
		String create="insert into customer_portfolio_details(customer_code,company_name,contact_phone1,website_name,customer_mail,customer_door,customer_street1,customer_street2,customer_city,"+
		"customer_state,customer_country,customer_zipcode,area_code) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			CustomerObject obj=obj1;
			con=DatabaseManagement.getConnection();
			PreparedStatement pre=con.prepareStatement(create,Statement.RETURN_GENERATED_KEYS);
			pre.setString(1,obj.getcustomer_code());
			pre.setString(2,obj.getcompany_name());
			pre.setLong(3,obj.getcontact_phone1());
			pre.setString(4,obj.getwebsite_name());
			pre.setString(5,obj.getcustomer_mail());
			pre.setString(6,"");
			pre.setString(7,obj.getcustomer_street1());
			pre.setString(8,obj.getcustomer_street2());
			pre.setString(9,obj.getcustomer_city());
			pre.setString(10,obj.getcustomer_state());
			pre.setString(11,obj.getcustomer_country());
			pre.setString(12,obj.getcustomer_zipcode());
			pre.setString(13, obj.getarea_code());
			pre.executeUpdate();
			ResultSet rs = pre.getGeneratedKeys();
			if(rs.next()){
			int ud = rs.getInt(1);
			status.setprojectid(ud);
			}
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("customer code code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (SQLException e) {
		    if (e instanceof SQLIntegrityConstraintViolationException) {
		    	System.out.println("Dupilcate Client code");
				status.setStatusCode(-5);
				status.setStatusMessage("customer code code already exit");
				e.printStackTrace();
		    } else {
		    	System.out.println("prepare statement error");
				status.setStatusCode(-1);
				status.setStatusMessage(e.getMessage());
				e.printStackTrace();
		    }
		}
		
		
		
		return status ;
		
	}
	
	
	public StatusObject editcustomer(CustomerObject obj1)
	{
		StatusObject status=new StatusObject();
		Connection con;
		String edit="UPDATE customer_portfolio_details SET customer_code=?,company_name=?,contact_phone1=?,website_name=?,"+
		"customer_mail=?,customer_street1=?,customer_street2=?,customer_city=?,customer_state=?,customer_country=?,customer_zipcode=?,area_code=?"+
				" where customer_id=?";
		
		try {
			CustomerObject obj=obj1;
			con=DatabaseManagement.getConnection();
			PreparedStatement pre=con.prepareStatement(edit);
			pre.setString(1,obj.getcustomer_code());
			pre.setString(2,obj.getcompany_name());
			pre.setLong(3,obj.getcontact_phone1());
			pre.setString(4,obj.getwebsite_name());
			pre.setString(5,obj.getcustomer_mail());
		
			pre.setString(6,obj.getcustomer_street1());
			pre.setString(7,obj.getcustomer_street2());
			pre.setString(8,obj.getcustomer_city());
			pre.setString(9,obj.getcustomer_state());
			pre.setString(10,obj.getcustomer_country());
			pre.setString(11,obj.getcustomer_zipcode());
			pre.setString(12, obj.getarea_code());
			pre.setInt(13, obj.getid());
			pre.executeUpdate();
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("customer code code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (SQLException e) {
		    if (e instanceof SQLIntegrityConstraintViolationException) {
		    	System.out.println("Dupilcate Client code");
				status.setStatusCode(-5);
				status.setStatusMessage("customer code code already exit");
				e.printStackTrace();
		    } else {
		    	System.out.println("prepare statement error");
				status.setStatusCode(-1);
				status.setStatusMessage(e.getMessage());
				e.printStackTrace();
		    }
		}
			
		
		return status ;
		
	}
	
	
	public StatusObject createconatctperson(ContactPersonObject obj1)
	{
		StatusObject status=new StatusObject();
		Connection con;
		String create="insert into customercode_contactperson_mapping(customer_id,person_name,contact_number1,contact_number2,contact_mail)"+
		"values (?,?,?,?,?)";
		
		try {
			ContactPersonObject obj=obj1;
			con=DatabaseManagement.getConnection();
			PreparedStatement pre=con.prepareStatement(create);
			pre.setInt(1, obj.getcustomer_id());
			pre.setString(2, obj.getperson_name());
			pre.setLong(3, obj.getcontact_no1());
			pre.setLong(4, obj.getcontact_no2());
			pre.setString(5, obj.getmail());
			pre.executeUpdate();
			status.setStatusCode(0);
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("customer code code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	
	
	public StatusObject contactpersonedit(ContactPersonObject obj1)
	{
		StatusObject status=new StatusObject();
		Connection con;
		
		
		try {
			ContactPersonObject obj=obj1;
			con=DatabaseManagement.getConnection();
			CallableStatement stmt=con.prepareCall("{call editcontactperson(?,?,?,?,?,?)}");  
			stmt.setInt(1,obj.getid());  
			stmt.setInt(2,obj.getcustomer_id());  
			stmt.setString(3, obj.getperson_name());
			stmt.setString(4, obj.getmail());
			stmt.setLong(5, obj.getcontact_no1());
			stmt.setLong(6, obj.getcontact_no2());
			stmt.execute();  
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("customer code code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	
//	public int deleteallcontactperson(int id)
//	{
//		int delete=1;
//		String create="delete  from customercode_contactperson_mapping where customer_id=? ";
//		System.out.println(create);
//	
//	try {
//		Connection con;
//		con=DatabaseManagement.getConnection();
//	
//	
//		PreparedStatement pre=con.prepareStatement(create);
//		pre.setInt(1,id);
//		
//		pre.executeUpdate();
//		delete=0;
//		
//	} 
//	catch(SQLIntegrityConstraintViolationException e) 
//	{
//		System.out.println("prepare statement error");
//		
//		e.printStackTrace();
//	}
//	catch(NullPointerException e)
//	{
//		System.out.println("prepare statement error");
//		
//		e.printStackTrace();
//	}
//	catch (Exception e) {
//		System.out.println("prepare statement error");
//		
//		e.printStackTrace();
//	}  
//
//		
//		return delete;
//	}
//	
//	
	public StatusObject inserttimesheet(TimeSheetObject obj1)
	{
		StatusObject status=new StatusObject();
	
		String create="insert into time_sheet(emp_code,emp_name,project_code,date,start_time,"
				+ "end_time,total_hours,acitivity,work_remark,approved_status,approved_by,rejected_reason,work_description)"
			
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			TimeSheetObject obj=obj1;
		
			PreparedStatement pre=con.prepareStatement(create);
			pre.setString(1,obj.getemp_code());
			pre.setString(2, obj.getemp_name());
			pre.setString(3,obj.getproject_code());
			pre.setDate(4, (Date) obj.getdate());
			pre.setString(5, obj.getstart_time());
			pre.setString(6, obj.getend_time());
			pre.setString(7, obj.gettotal_hours());
			pre.setString(8, obj.getacitivity());
			pre.setString(9, obj.getwork_remark());
			pre.setString(10, obj.getapproved_status());
			pre.setString(11,obj.getapproved_by());
			pre.setString(12, obj.getrejected_reason());
			pre.setString(13, obj.getwork_description());
			pre.executeUpdate();
		
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}

	
	
	public StatusObject edittimesheet(TimeSheetObject obj1)
	{
		StatusObject status=new StatusObject();
		Connection con;
		
		
		try {
			TimeSheetObject obj=obj1;
			con=DatabaseManagement.getConnection();
			CallableStatement stmt=con.prepareCall("{call timesheetupdate(?,?,?,?,?,?,?,?,?,?,?,?,?)}");  
			stmt.setInt(1,obj.getid());  
			System.out.println(obj.getid());
			stmt.setString(2,obj.getemp_code());
			
			stmt.setString(3, obj.getemp_name());
			stmt.setString(4, obj.getproject_code());
			stmt.setDate(5,(Date) obj.getdate());
			stmt.setString(6, obj.getstart_time());
			stmt.setString(7, obj.getend_time());
			stmt.setString(8, obj.getday_hours());
			stmt.setString(9, obj.gettotal_hours());
			stmt.setInt(10, obj.getsequnces_no());	
			stmt.setString(11, obj.getacitivity());
			stmt.setString(12, obj.getapproved_status());
			stmt.setString(13, obj.getwork_description());
			
			stmt.execute();  
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("customer code code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
	}
	public StatusObject deletedtimesheetrow(int rowid)
	{
		StatusObject status=new StatusObject();
	
		String create="delete  from time_sheet where id="+rowid;
			
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement	stmt = con.createStatement();		
			stmt.execute(create);
			status.setStatusCode(0);
			
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	
	public StatusObject timesheetapproved(TimeSheetObject obj1)
	{
		StatusObject status=new StatusObject();
	
		String create="UPDATE time_sheet SET approved_status=?,approved_by=?,rejected_reason=? where emp_code=? and date=?";
			
			
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			TimeSheetObject obj=obj1;
		
			PreparedStatement pre=con.prepareStatement(create);
			pre.setString(1, obj.getapproved_status());
			pre.setString(2, obj.getapproved_by());
			pre.setString(3, obj.getrejected_reason());
			
			pre.setString(4, obj.getemp_code());
			pre.setDate(5, (Date) obj.getdate());
			pre.executeUpdate();
		
			
			status.setStatusCode(0);
			
		} 
		catch(SQLIntegrityConstraintViolationException e) 
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-5);
			status.setStatusMessage("project code already exit");
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	
	
	
	
	
	public JsonArray report(String emp_code)
	{
		String project_code;
		
		JsonArray status=new JsonArray();
		String select="select employee_details.emp_code,employee_details.first_name,employee_details.designation,project_emp_mapping_details.project_code,project_emp_mapping_details.percentage_allocation,project_emp_mapping_details.start_date,project_emp_mapping_details.end_date,project_emp_mapping_details.project_manager  from employee_details inner join project_emp_mapping_details on  employee_details.emp_code=project_emp_mapping_details.emp_code where employee_details.emp_code='"+emp_code+"' and project_emp_mapping_details.status=0";
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			Statement stm2=con.createStatement();
			Statement stm3=con.createStatement();
			ResultSet res=stm.executeQuery(select);
		
			while(res.next())
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("emp_code",res.getString("emp_code") );
				jo.addProperty("first_name",res.getString("first_name") );
				jo.addProperty("designation", res.getString("designation"));
				jo.addProperty("percentage_allocation", res.getString("percentage_allocation"));
				jo.addProperty("Start_date",res.getString("start_date") );
				jo.addProperty("end_date",res.getString("end_date") );
				jo.addProperty("project_manager",res.getString("project_manager"));
				
				String select2="select project_details.project_code,project_details.project_name,project_details.project_description,project_details.project_manager as manager,project_details.delivery_manager"
						+ " from project_details where project_details.project_code='"+res.getString("project_code")+"'";
				ResultSet res1=stm2.executeQuery(select2);
				while(res1.next())
				{
					jo.addProperty("project_code",res1.getString("project_code"));
					jo.addProperty("project_name",res1.getString("project_name"));
					jo.addProperty("project_description",res1.getString("project_description"));
					jo.addProperty("manager", res1.getString("manager"));
					jo.addProperty("delivery_manager", res1.getString("delivery_manager"));
					
				}
				
				res1.close();
				String select3="select project_details.project_manager,project_details.delivery_manager,employee_details.first_name as projectmanager_name,e.first_name as deliverymanager_name "
						+ "from project_details,employee_details,employee_details e  "
						+ "where employee_details.emp_code=project_details.project_manager "
						+ "and e.emp_code=project_details.delivery_manager and project_details.project_code='"+res.getString("project_code")+"'";
				
				ResultSet res2=stm3.executeQuery(select3);
				while(res2.next())
				{
//					jo.addProperty("project_manager",res1.getString("project_manager"));
//					jo.addProperty("delivery_manager",res1.getString("delivery_manager"));
					
					jo.addProperty("projectmanager_name", res2.getString("projectmanager_name"));
					jo.addProperty("deliverymanager_name", res2.getString("deliverymanager_name"));
					
				}
				res2.close();
				status.add(jo);
				
				
			}
			res.close();
			
		
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}

	
	//****************************************************************
public List<Allocationobject> timesheet_view(String project_manager)
	
	{
		List<Allocationobject> list=new ArrayList<Allocationobject>();
		Allocationobject emp;
		int size= 0;
		String sql="select emp_code,emp_name from project_emp_mapping_details where project_manager='"+project_manager+"' and emp_code !='"+project_manager+"' and status=0 union select distinct emp_code,emp_name from time_sheet where emp_code not in (select emp_code from project_emp_mapping_details)";
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			
			while(res.next())
			{
				emp=new Allocationobject();
				System.out.println(res.getString("emp_code"));
				System.out.println(res.getString("emp_name"));
				emp.setemp_code(res.getString("emp_code"));
				emp.setemp_name(res.getString("emp_name"));
				list.add(emp);
			}
		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list;
		
		
		
		
	}
	//*************************************************************
	
	public JsonArray reportproject(String project_code)
	{
		
		JsonObject jo3 = new JsonObject();
		JsonArray status=new JsonArray();
		JsonArray status1=new JsonArray();
		String select="select * from project_details where project_code='"+project_code+"'"; 
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			Statement stm2=con.createStatement();
			ResultSet res=stm.executeQuery(select);
			Statement stm3=con.createStatement();
		String select3;
			while(res.next())
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("project_code",res.getString("project_code") );
				jo.addProperty("project_name",res.getString("project_name") );
				jo.addProperty("desigproject_descriptionnation", res.getString("project_description"));
				jo.addProperty("start_date", res.getString("start_date"));
				jo.addProperty("end_date",res.getString("end_date") );
				jo.addProperty("end_date",res.getString("end_date") );
				jo.addProperty("location",res.getString("location") );
			//	jo.addProperty("customer_id",res.getInt("customer_id"));
				select3="select * from customer_portfolio_details where customer_id="+res.getInt("customer_id");
				ResultSet res3=stm3.executeQuery(select3);
				while(res3.next())
				{
				jo.addProperty("customer_code", res3.getString("customer_code"));
				jo.addProperty("company_name", res3.getString("company_name"));
				
				}
				res3.close();
				
				String select2="select * from project_emp_mapping_details where project_code='"+project_code+"' and status=0";
				ResultSet res1=stm2.executeQuery(select2);
				while(res1.next())
				{
					JsonObject jo1 = new JsonObject();
					jo1.addProperty("emp_code",res1.getString("emp_code"));
					jo1.addProperty("emp_name",res1.getString("emp_name"));
					jo1.addProperty("start_date",res1.getString("start_date"));
					jo1.addProperty("end_date",res1.getString("end_date"));
					jo1.addProperty("percentage_allocation",res1.getInt("percentage_allocation"));
					status1.add(jo1);
				}
				jo.add("employee", status1);
				res1.close();
				status.add(jo);
				
				
			}
			res.close();
			
		
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}

	//**********************************************************************************************************************
	
	
	public JsonArray reportclient(String cus_code)
	{
		
		JsonObject jo3 = new JsonObject();
		JsonArray status=new JsonArray();
		JsonArray status1=new JsonArray();
		String select="select * from project_details where customer_id='"+cus_code+"'"; 
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			Statement stm2=con.createStatement();
			ResultSet res=stm.executeQuery(select);
			Statement stm3=con.createStatement();
		String select3;
		int count=0;
			while(res.next())
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("id", res.getInt("id"));
				jo.addProperty("project_code",res.getString("project_code") );
				jo.addProperty("project_name",res.getString("project_name") );
				jo.addProperty("location",res.getString("location") );
				select3="select * from customercontactperson_project_mapping where customer_id="+cus_code+" and project_id="+res.getInt("id");
				ResultSet res3=stm3.executeQuery(select3);
				count=0;
				while(res3.next())
				{
				count++;	
				}
				jo.addProperty("count", count);
				res3.close();
				status.add(jo);
			}
			res.close();
			
		
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	//***************************************************************************************
	public JsonArray reportclientview(String pro_id,String cus_code)
	{
		
		JsonObject jo3 = new JsonObject();
		JsonArray status=new JsonArray();
		JsonArray status1=new JsonArray();
		String select="select * from customercontactperson_project_mapping where customer_id="+cus_code+" and project_id="+pro_id; 
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			Statement stm2=con.createStatement();
			ResultSet res=stm.executeQuery(select);
			Statement stm3=con.createStatement();
		String select3;
		int count=0;
			while(res.next())
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("id", res.getInt("contact_person_id"));
				select3="select * from customercode_contactperson_mapping where id="+res.getInt("contact_person_id");
				ResultSet res3=stm3.executeQuery(select3);
				count=0;
				while(res3.next())
				{
				jo.addProperty("person_name", res3.getString("person_name"));
				jo.addProperty("contact_number1", res3.getInt("contact_number1"));
				jo.addProperty("contact_number2", res3.getInt("contact_number2"));
				jo.addProperty("contact_mail", res3.getString("contact_mail"));
				}
				res3.close();
				status.add(jo);
			}
			res.close();	
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	//***************************************************************************************
	public List<TimeSheetObject> get_timesheet(String  emp_code,Date start_date,Date end_date)
	{
		//StatusObject status=new StatusObject();
		List<TimeSheetObject> list1=new ArrayList<TimeSheetObject>();
		String sql="select * from time_sheet where emp_code = '"+emp_code+"' and date >= '"+start_date+"' and date <= '"+end_date+"' and sequence_no=1 and approved_status !='Saved' ORDER BY date ASC";
         System.out.println(sql);
		TimeSheetObject timelist;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
		
			while(res.next())
			{
				timelist= new TimeSheetObject();
				timelist.setid(res.getInt("id"));	
				timelist.setemp_code(res.getString("emp_code"));
				timelist.setemp_name(res.getString("emp_name"));
				
				
				timelist.setdate(res.getDate("date"));
				
				timelist.setday_hours(res.getString("day_total_hours"));
				
				timelist.setapproved_status(res.getString("approved_status"));
				
				timelist.setrejected_reason(res.getString("rejected_reason"));
				
				
				
			list1.add(timelist);
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	public List<TimeSheetObject> get_timesheet_one_emp(String  emp_code,Date start_date)
	{
		//StatusObject status=new StatusObject();
		List<TimeSheetObject> list1=new ArrayList<TimeSheetObject>();
		String sql="select * from time_sheet where emp_code = '"+emp_code+"' and date = '"+start_date+"' ORDER BY sequence_no ASC";
         System.out.println(sql);
		TimeSheetObject timelist;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
		
			while(res.next())
			{
				timelist= new TimeSheetObject();
				timelist.setid(res.getInt("id"));	
				timelist.setemp_code(res.getString("emp_code"));
				timelist.setemp_name(res.getString("emp_name"));
				timelist.setsequnces_no(res.getInt("sequence_no"));
				timelist.setproject_code(res.getString("project_code"));
				timelist.setdate(res.getDate("date"));
				timelist.setstart_time(res.getString("start_time"));
				timelist.setend_time(res.getString("end_time"));
				timelist.settotal_hours(res.getString("total_hours"));
				timelist.setwork_description(res.getString("work_description"));
				timelist.setapproved_status(res.getString("approved_status"));
				timelist.setacitivity(res.getString("acitivity"));
				timelist.setrejected_reason(res.getString("rejected_reason"));
				timelist.setday_hours(res.getString("day_total_hours"));
				
				
			list1.add(timelist);
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	
//	public List<TimeSheetObject> get_timesheetall(Date start_date,Date end_date)
//	{
//		//StatusObject status=new StatusObject();
//		List<TimeSheetObject> list1=new ArrayList<TimeSheetObject>();
//		String sql="select * from time_sheet where date >= '"+start_date+"' and date <= '"+end_date+"' and sequence_no=1 and approved_status !='Saved' ORDER BY date ASC";
//         
//		TimeSheetObject timelist;
//		
//		Connection con;
//		
//		Statement stm;
//		try {
//			con=DatabaseManagement.getConnection();
//			stm = con.createStatement();
//			ResultSet res=stm.executeQuery(sql);
//		
//			while(res.next())
//			{
//				timelist= new TimeSheetObject();
//				timelist.setid(res.getInt("id"));	
//				timelist.setemp_code(res.getString("emp_code"));
//				timelist.setemp_name(res.getString("emp_name"));
//				
//				
//				timelist.setdate(res.getDate("date"));
//				
//				timelist.setday_hours(res.getString("day_total_hours"));
//				
//				timelist.setapproved_status(res.getString("approved_status"));
//				
//				timelist.setrejected_reason(res.getString("rejected_reason"));
//				
//				
//				
//			list1.add(timelist);
//				
//				
//								
//			}
//		} catch (SQLException e) {
//		System.out.println(e.getMessage());
//			e.printStackTrace();
//		}
//		
//		
//		return list1;
//		
//		
//	}
//	
	public List<TimeSheetObject> get_timesheetall(Date start_date,Date end_date,String project_manager)
	{
		//StatusObject status=new StatusObject();
		List<TimeSheetObject> list1=new ArrayList<TimeSheetObject>();
	//	String sql="select * from time_sheet where date >= '"+start_date+"' and date <= '"+end_date+"' and sequence_no=1 and approved_status !='Saved' ORDER BY date ASC";
         String sql="select time_sheet.id,time_sheet.emp_code,time_sheet.emp_name,time_sheet.date,time_sheet.day_total_hours,time_sheet.rejected_reason,time_sheet.remark,time_sheet.approved_status,project_emp_mapping_details.emp_code,project_emp_mapping_details.project_manager from time_sheet inner join  project_emp_mapping_details on  time_sheet.emp_code=project_emp_mapping_details.emp_code where project_emp_mapping_details.project_manager='"+project_manager+"' and time_sheet.date >= '"+start_date+"' and time_sheet.date <= '"+end_date+"'and project_emp_mapping_details.status=0 and sequence_no=1 and approved_status !='Saved' ORDER BY date ASC";

		TimeSheetObject timelist;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
		
			while(res.next())
			{
				timelist= new TimeSheetObject();
				timelist.setid(res.getInt("id"));	
				timelist.setemp_code(res.getString("emp_code"));
				timelist.setemp_name(res.getString("emp_name"));
				
				
				timelist.setdate(res.getDate("date"));
				
				timelist.setday_hours(res.getString("day_total_hours"));
				
				timelist.setapproved_status(res.getString("approved_status"));
				
				timelist.setrejected_reason(res.getString("rejected_reason"));
				
				
				
			list1.add(timelist);
				
				
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	public JsonArray managerdashboard1(String project_manager)
	{
		
		int count=0;
		JsonArray status=new JsonArray();
		JsonArray status1=new JsonArray();
		try{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm1=con.createStatement();
		
		String projectcodequery="select distinct project_code from project_emp_mapping_details where project_manager='"+project_manager+"' and status=0";
		ResultSet res5=stm1.executeQuery(projectcodequery);
		while(res5.next()){
			String projectcode=res5.getString("project_code");
		
		String select="select * from project_details where project_code='"+projectcode+"' and status=0"; 
		
					Statement stm=con.createStatement();
			Statement stm2=con.createStatement();
			ResultSet res=stm.executeQuery(select);
			Statement stm3=con.createStatement();
		String select3;
			while(res.next()) 
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("id", res.getString("id"));
				jo.addProperty("project_code",res.getString("project_code") );
				jo.addProperty("project_name",res.getString("project_name") );
				jo.addProperty("desigproject_descriptionnation", res.getString("project_description"));
				jo.addProperty("start_date", res.getString("start_date"));
				jo.addProperty("end_date",res.getString("end_date") );
				jo.addProperty("end_date",res.getString("end_date") );
				jo.addProperty("location",res.getString("location") );
				jo.addProperty("effort", res.getString("total_effort"));
				jo.addProperty("project_manager", res.getString("project_manager"));
				jo.addProperty("delivery_manager", res.getString("delivery_manager"));
			//	jo.addProperty("customer_id",res.getInt("customer_id"));
				select3="select * from customer_portfolio_details where customer_id="+res.getInt("customer_id");
				ResultSet res3=stm3.executeQuery(select3);
				while(res3.next())
				{
				jo.addProperty("customer_code", res3.getString("customer_code"));
				jo.addProperty("company_name", res3.getString("company_name"));
				
				}
				res3.close();
				count=0;
				String select2="select * from project_emp_mapping_details where project_code='"+res.getString("project_code")+"' AND project_manager='"+project_manager+"' and status=0";
				ResultSet res1=stm2.executeQuery(select2);
			
				while(res1.next())
				{
					count=count+1;
					System.out.println("counting"+count);
				}
				jo.addProperty("count", count);
				res1.close();
				status.add(jo);
				
				String select4="select project_details.project_manager,project_details.delivery_manager,employee_details.first_name as projectmanager_name,e.first_name as deliverymanager_name "
						+ "from project_details,employee_details,employee_details e  "
						+ "where employee_details.emp_code=project_details.project_manager "
						+ "and e.emp_code=project_details.delivery_manager and project_details.project_code='"+res.getString("project_code")+"'";
				Statement stm4=con.createStatement();
				ResultSet res6=stm4.executeQuery(select4);
				while(res6.next())
				{
//					jo.addProperty("project_manager",res1.getString("project_manager"));
//					jo.addProperty("delivery_manager",res1.getString("delivery_manager"));
					
					jo.addProperty("projectmanager_name", res6.getString("projectmanager_name"));
					jo.addProperty("deliverymanager_name", res6.getString("deliverymanager_name"));
					
				}
				res6.close();
			}
			res.close();
		}res5.close();
		
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	public List<Allocationobject> manager_dashboard(String project_code,String project_manager)
	{
		
		List<Allocationobject> list1=new ArrayList<Allocationobject>();
		String sql="select * from project_emp_mapping_details where project_manager='"+project_manager+"' AND project_code='"+project_code+"' and status=0";
		
		Allocationobject allocation;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				allocation=new Allocationobject();
				allocation.setid(res.getInt("id"));
				allocation.setproject_code(res.getString("project_code"));
				allocation.setemp_name(res.getString("emp_name"));
				allocation.setemp_code(res.getString("emp_code"));
				allocation.setpercentage_allocation(res.getInt("percentage_allocation"));
				allocation.setstart_date(res.getDate("start_date"));
				allocation.setend_date(res.getDate("end_date"));
				allocation.setproject_manager(res.getString("project_manager"));
				allocation.setlocation(res.getString("location"));
				list1.add(allocation);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list1;
		
		
	}
	
	
	
	
	public StatusObject forgetpassword(String empcode) throws UnknownHostException
	{
		StatusObject status=new StatusObject();
		Connection con;
		con=DatabaseManagement.getConnection();
		
		String get="select mail from employee_details where emp_code='"+empcode+"'";
			
			String mail="";
		boolean found=false;
		try {
			
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(get);
			if(res!=null){
			while(res.next())
			{
			mail=res.getString("mail");	
			status.setStatusCode(0);
			found=true;
				}
			if(found!=true)
			{
				status.setStatusCode(-5);
				System.out.println("EMP CODE NOT FOUND");
				
				status.setStatusMessage("EMP CODE NOT FOUND");
				return status ;
			}
		}
		else{
			status.setStatusCode(-5);
			System.out.println("EMP CODE NOT FOUND");
			
			status.setStatusMessage("EMP CODE NOT FOUND");
			return status ;
		}
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		int aNumber = 0; 
		aNumber = (int)((Math.random() * 9000000)+1000000); 
		int reset_code=aNumber;
		con=DatabaseManagement.getConnection();
		CallableStatement stmt;
		try {
			stmt = con.prepareCall("{call resetpassword(?,?)}");
			stmt.setString(1,empcode);  
			
			stmt.setInt(2,reset_code);
			stmt.execute();  
		} catch (SQLException e) {
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
			System.out.println("RENDOM NUMBER FAIL");
			return status;
		}  
		
	 Properties prop = new Properties();
	 InputStream input = null;
	 try {

 		String filename = "mail.properties";
 		input = DataHandler.class.getClassLoader().getResourceAsStream(filename);
 		if(input==null){
 	            System.out.println("Sorry, unable to find " + filename);
 		    
 		}

 		 		prop.load(input);

          
 	} catch (IOException ex) {
 		ex.printStackTrace();
     } finally{
     	if(input!=null){
     		try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
     	}
     }

	String hostname=InetAddress.getLocalHost().getHostName();
int port=8080;
		String to=mail;//change accordingly 
		final String from=prop.getProperty("mail");//change accordingly 
		final String password=prop.getProperty("password");//change accordingly 

		//Get the session object 
		Properties props = new Properties(); 
		props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.host", "m.outlook.com");
		props.put("mail.smtp.auth", "true");
		javax.mail.Session	 session = javax.mail.Session.getInstance(props, new Authenticator() {
		    @Override
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(from,password);
		    }
		});
	
//		try {
//			s = new ServerSocket();
//			port=s.getLocalPort();
//			System.out.println("listening on port: " + s.getLocalPort());
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		//compose message 
		try { 
		MimeMessage message = new MimeMessage(session); 
		message.setFrom(new InternetAddress(from)); 
		message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
		message.setSubject("Password reset code...","text/html"); 
		 message.setContent("<h4><u>ENNVEE PROJECT MANAGEMENT PASSWORD RESET LINK :</u> </h4><br>"
		 		+ "<h1><a href='http://"+hostname+":8521/test/resetcodecheck.jsp?emp_code="+empcode+"&reset_code="+reset_code+"'>reset link</a></h1>","text/html; charset=utf-8" );  

		//send message 
		Transport.send(message); 
		status.setStatusCode(0);
		status.setStatusMessage("MESSAGE SENT SUCCESS");

		System.out.println("message sent successfully"); 

		}catch(Exception e)
		{
			e.printStackTrace();
			status.setStatusCode(-1);
			status.setStatusMessage("mail id Error");
			return status ;
		} 

		
		
		
		
		return status ;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	public StatusObject passwordchange(String emp_code,String newpassword)
	{
		StatusObject status=new StatusObject();
	
		String update="UPDATE login_details SET password=? where emp_id=? ";
		
		try {
			Connection con;
			
			con=DatabaseManagement.getConnection();
			PreparedStatement pre=con.prepareStatement(update);
			pre.setString(1, newpassword);
			pre.setString(2, emp_code);
			pre.execute();
			status.setStatusCode(0);
			
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}

	
	public StatusObject filedeleted(int projectid,String filename)
	{
		StatusObject status=new StatusObject();
	
		String update="delete from projectid_file_mapping where project_id=? and file_name=?";
		
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			
			PreparedStatement pre=con.prepareStatement(update);
			pre.setString(2,filename);
			pre.setInt(1,projectid);
			pre.execute();
			status.setStatusCode(0);
			
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage("project code empty");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("prepare statement error");
			status.setStatusCode(-1);
			status.setStatusMessage(e.getMessage());
			e.printStackTrace();
		}  
  
		
		
		return status ;
		
	}
	
	public List<LoginObject> update_login(String emp_code)
	{
		
		List<LoginObject> list1=new ArrayList<LoginObject>();
		String sql="select * from login_details where emp_id='"+emp_code+"'";
		LoginObject login;
		
		Connection con;
		
		Statement stm;
		try {
			con=DatabaseManagement.getConnection();
			stm = con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			
			while(res.next())
			{
				login=new LoginObject();
				login.setemp_id(res.getString("emp_id"));
				System.out.println("empid"+res.getString("emp_id"));
				login.setuser_name(res.getString("user_name"));
				login.setpassword(res.getString("password"));
				list1.add(login);
								
			}
		} catch (SQLException e) {
		System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list1;
	}
	
public List<Allocationobject> managerviewemp(String project_manager)
	
	{
		List<Allocationobject> list=new ArrayList<Allocationobject>();
		Allocationobject emp;
		
		String sql="select * from project_emp_mapping_details where project_manager='"+project_manager+"' and emp_code !='"+project_manager+"' and status=0";
	//	System.out.println(sql);
		try
		{
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next())
			{
				emp=new Allocationobject();
				emp.setemp_code(res.getString("emp_code"));
				emp.setemp_name(res.getString("emp_name"));
				
				emp.setlocation(res.getString("location"));
				
				list.add(emp);
			//	System.out.println(res.getString("emp_code"));
				
			}

		}catch(SQLException e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		return list;
		
		
		
		
	}





public JsonArray designation_get(String empcode)
{
	
	int count=0;
	JsonArray status=new JsonArray();
	JsonArray status1=new JsonArray();
	String select="select * from project_details where project_manager='"+empcode+"' and status=0"; 
	try {
		Connection con;
		con=DatabaseManagement.getConnection();
		Statement stm=con.createStatement();
		Statement stm2=con.createStatement();
		ResultSet res=stm.executeQuery(select);
		Statement stm3=con.createStatement();
	String select3;
		while(res.next())
		{
			JsonObject jo = new JsonObject();
			jo.addProperty("project_code",res.getString("project_code") );
			jo.addProperty("project_name",res.getString("project_name") );
			jo.addProperty("desigproject_descriptionnation", res.getString("project_description"));
			jo.addProperty("start_date", res.getString("start_date"));
			jo.addProperty("end_date",res.getString("end_date") );
			jo.addProperty("end_date",res.getString("end_date") );
			jo.addProperty("location",res.getString("location") );
			jo.addProperty("effort", res.getString("total_effort"));
		//	jo.addProperty("customer_id",res.getInt("customer_id"));
			select3="select * from customer_portfolio_details where customer_id="+res.getInt("customer_id");
			ResultSet res3=stm3.executeQuery(select3);
			while(res3.next())
			{
			jo.addProperty("customer_code", res3.getString("customer_code"));
			jo.addProperty("company_name", res3.getString("company_name"));
			
			}
			res3.close();
			count=0;
			String select2="select * from project_emp_mapping_details where project_code='"+res.getString("project_code")+"' and status=0";
			ResultSet res1=stm2.executeQuery(select2);
		
			while(res1.next())
			{
				count=count+1;
				System.out.println("counting"+count);
			}
			jo.addProperty("count", count);
			res1.close();
			status.add(jo);
			
			
		}
		res.close();
		
	
	} 
	
	catch(NullPointerException e)
	{
		System.out.println("prepare statement error");
		
		e.printStackTrace();
	}
	catch (Exception e) {
		System.out.println("prepare statement error");
		
		e.printStackTrace();
	}  

	
	
	return status ;
	
}






	
	
	
	
	
	
	
	
	public JsonArray projectmanagername(String emp_code)
	{
		
		JsonArray status=new JsonArray();
//	String select="select employee_details.first_name as manager_name,employee_details.emp_code as manager_code,project_emp_mapping_details.emp_code,project_emp_mapping_details.emp_name "
//				+ "from employee_details inner join project_emp_mapping_details on "
//				+ "employee_details.emp_code=project_emp_mapping_details.project_manager"
//				+ "where project_emp_mapping_details.emp_code='"+emp_code+"'";
//	
	
	String select="select e.designation as employee_designation,employee_details.first_name as manager_name,employee_details.emp_code as manager_code,project_emp_mapping_details.emp_code,project_emp_mapping_details.emp_name from employee_details, project_emp_mapping_details ,employee_details e where employee_details.emp_code=project_emp_mapping_details.project_manager and e.emp_code=project_emp_mapping_details.emp_code and project_emp_mapping_details.emp_code='"+emp_code+"'";
	System.out.println(select);
		try {
			Connection con;
			con=DatabaseManagement.getConnection();
			Statement stm=con.createStatement();
//			Statement stm2=con.createStatement();
			ResultSet res=stm.executeQuery(select);
		
			while(res.next())
			{
				JsonObject jo = new JsonObject();
				jo.addProperty("emp_code",res.getString("emp_code") );
				jo.addProperty("manager_name",res.getString("manager_name") );
				jo.addProperty("emp_name", res.getString("emp_name"));
				jo.addProperty("manager_code", res.getString("manager_code"));
				jo.addProperty("designation", res.getString("employee_designation"));
				
				
//				String select2="select employee_details.designation,project_emp_mapping_details.emp_name,project_emp_mapping_details.emp_code "
//						+ "from employee_details"
//						+ " inner join project_emp_mapping_details on employee_details.emp_code=project_emp_mapping_details.emp_code "
//						+ "where project_emp_mapping_details.emp_code='"+emp_code+"'";
//				ResultSet res1=stm2.executeQuery(select2);
//				while(res1.next())
//				{
//					jo.addProperty("designation", res1.getString("designation"));
//				}
//				res1.close();
				status.add(jo);
				
				
			}
			res.close();
			con.close();
		
		} 
		
		catch(NullPointerException e)
		{
			System.out.println("prepare statement error");
			
			e.printStackTrace();
		}
		catch (Exception e) {
		System.out.println("prepare statement error");
			
		e.printStackTrace();
		}  
 
		
		
		return status ;
		
	}

}
//*************************






















