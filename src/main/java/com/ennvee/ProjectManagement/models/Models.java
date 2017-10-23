package com.ennvee.ProjectManagement.models;

import com.ennvee.ProjectManagement.beans.Allocationobject;
import com.ennvee.ProjectManagement.beans.Employeobject;
import com.ennvee.ProjectManagement.beans.LoginObject;
import com.ennvee.ProjectManagement.beans.ProjectObject;

public class Models {

	public LoginObject login;

	public static ProjectObject project;

	public Employeobject employee;

	public Allocationobject allocation;

	public LoginObject oldlogin;

	public static ProjectObject oldproject;

	public Employeobject  oldemployee;

	public Allocationobject oldallocation;
	public	String log_emp_code="";

	
	

public void setlog_emp_code(String log_emp_code)
{
	this.log_emp_code=log_emp_code;
}

public String getlog_emp_code()
{
	return log_emp_code;
}

	
public void setloginobject(LoginObject login)
{
	this.login=login;
}

public LoginObject getloginObject()
{
	return login;
}

public void setprojectobject(ProjectObject project)
{
	this.project=project;
}

public static ProjectObject getprojectObject()
{
	return project;
}

public void setemployeeobject(Employeobject employee)
{
	this.employee=employee;
}

public Employeobject getemployeeObject()
{
	return employee;
}

public void setallocationobject(Allocationobject allocation)
{
	this.allocation=allocation;
}

public Allocationobject getallocationObject()
{
	return allocation;
}

public void setoldloginobject(LoginObject oldlogin)
{
	this.oldlogin=oldlogin;
}

public LoginObject getoldloginObject()
{
	return oldlogin;
}

public void setoldprojectobject(ProjectObject oldproject)
{
	this.oldproject=oldproject;
}

public static ProjectObject getoldprojectObject()
{
	return oldproject;
}

public void setoldemployeeobject(Employeobject oldemployee)
{
	this.oldemployee=oldemployee;
}

public Employeobject getoldemployeeObject()
{
	return oldemployee;
}

public void setoldallocationobject(Allocationobject oldallocation)
{
	this.oldallocation=oldallocation;
}

public Allocationobject getoldallocationObject()
{
	return oldallocation;
}



}
