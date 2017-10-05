package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class LoginObject {
	
	
	String user_name=null;
	String password=null;
	String emp_id=null;
	String role=null;
	Date created_date=null;
	String created_by=null;
	String updated_by=null;
	Date updated_date=null;
	int status=-1;
	String remark=null;
	
	public void setuser_name(String user_name)
	{
		this.user_name=user_name;
		
	}
	public String getuser_name()
	{
		return user_name;
		
		
	}
	
	public void setpassword(String password)
	{
		this.password=password;
		
	}
	public String getpassword()
	{
		return password;
		
		
	}
	
	
	public void setrole(String role)
	{
		this.role=role;
		
	}
	public String getrole()
	{
		return role;
		
		
	}
	public void setemp_id(String emp_id)
	{
		this.emp_id=emp_id;
		
	}
	public String getemp_id()
	{
		return emp_id;
		
		
	}
	
	
	public void setcreated_date(Date created_date)
	{
		this.created_date=created_date;
		
	}
	public Date getcreated_date()
	{
		return created_date;
		
		
	}
	public void setcreated_by(String created_by)
	{
		this.created_by=created_by;
		
	}
	public String getcreated_by()
	{
		return created_by;
		
		
	}
	public void setupdated_by(String updated_by)
	{
		this.updated_by=updated_by;
		
	}
	public String getupdated_by()
	{
		return updated_by;
		
		
	}
	public void setupdated_date(Date updated_date)
	{
		this.updated_date=updated_date;
		
	}
	public Date getupdated_date()
	{
		return updated_date;
		
		
	}
	public void setstatus(int status)
	{
		this.status=status;
		
	}
	public  int getstatus()
	{
		return status;
		
		
	}
	public void setremark(String remark)
	{
		this.remark=remark;
		
	}
	public String getremark()
	{
		return remark;
		
		
	}
	
	

}
