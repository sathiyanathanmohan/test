package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class Employeobject {
	int id;
	String emp_code;
	String first_name;
	String last_name;
	String location;
	String designation;
	long contact_phone1;

	long contact_phone2;
String emp_mail;
    Date created_date;
	String created_by;
	Date updated_date;
	String updated_by=null;
	int  status=1;
	String remark;
	public void setid(int id)
	{
		  this.id=id;
	}
	public int getid()
	{
			return id;
	}

	
	public void setemp_code(String emp_code)
	{
		  this.emp_code=emp_code;
	}
	public String getemp_code()
	{
			return emp_code;
	}
		

	
	public void setfirst_name(String first_name)
	{
		  this.first_name=first_name;
	}
	public String getfirst_name()
	{
			return first_name;
	}
		

	
	public void setlast_name(String last_name)
	{
		  this.last_name=last_name;
	}
	public String getlast_name()
	{
			return last_name;
	}
		

	
	
	
	
	public void setlocation(String location)
	{
		  this.location=location;
	}
	public String getlocation()
	{
			return location;
	}
		

	
	
	
	public void setdesignation(String designation)
	{
		  this.designation=designation;
	}
	public String getdesignation()
	{
			return designation;
	}
		

	
	
	public void setcontact_phone2(long contact_phone2)
	{
		this.contact_phone2=contact_phone2;
	}
	public long getcontact_phone2()
	{
		return contact_phone2;
	}

	public void setcontact_phone1(long contact_phone1)
	{
		this.contact_phone1=contact_phone1;
	}
	public long getcontact_phone1()
	{
		return contact_phone1;
	}
	public void setemp_mail(String emp_mail)
	{
		this.emp_mail=emp_mail;
	}
	public String getemp_mail()
	{
		return emp_mail;
	}	
	
	
	
	public void setcreated_date(Date created_date)
	{
		  this.created_date=created_date;
	}
	public Date getcreated_date()
	{
			return created_date;
	}
		


	public void setcreated_bye(String created_by)
	{
		  this.created_by=created_by;
	}
	public String getcreated_by()
	{
			return created_by;
	}
		


	public void setupdated_date(Date updated_date)
	{
		  this.updated_date=updated_date;
	}
	public Date getupdated_date()
	{
			return updated_date;
	}


	public void setupdated_by(String updated_by)
	{
		  this.updated_by=updated_by;
	}
	public String getupdated_by()
	{
			return updated_by;
	}
		


	public void setstatus(int status)
	{
		  this.status=status;
	}
	public int getstatus()
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
