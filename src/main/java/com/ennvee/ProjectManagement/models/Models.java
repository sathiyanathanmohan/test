package com.ennvee.ProjectManagement.models;

import com.ennvee.ProjectManagement.beans.Allocationobject;
import com.ennvee.ProjectManagement.beans.Employeobject;
import com.ennvee.ProjectManagement.beans.LoginObject;
import com.ennvee.ProjectManagement.beans.ProjectObject;

public class Models {

	public LoginObject login;

	public ProjectObject project;

	public Employeobject employee;

	public Allocationobject allocation;

	public LoginObject oldlogin;

	public ProjectObject oldproject;

	public Employeobject  oldemployee;

	public Allocationobject oldallocation;

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

public ProjectObject getprojectObject()
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

public ProjectObject getoldprojectObject()
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
