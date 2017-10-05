package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class Allocationobject {
	int id;
	String emp_code;
	String project_code;
	String emp_name;
	int percentage_allocation=0;
	String location;
	String project_manager;
	  Date start_date;
	    Date end_date;
	Date created_date;
	String created_by;
	Date updated_date;
	String updated_by;
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
	
 
 public void setemp_name(String emp_name)
 {
	  this.emp_name=emp_name;
 }
public String getemp_name()
 {
		return emp_name;
 }
	
	
 
 public void setproject_code(String project_code)
 {
	  this.project_code=project_code;
 }
public String getproject_code()
 {
		return project_code;
 }



public void setpercentage_allocation(int percentage_allocation)
{
	  this.percentage_allocation=percentage_allocation;
}
public int getpercentage_allocation()
{
		return percentage_allocation;
}


public void setlocation(String location)
{
	  this.location=location;
}
public String getlocation()
{
		return location;
}


public void setproject_manager(String project_manager)
{
	  this.project_manager=project_manager;
}
public String getproject_manager()
{
		return project_manager;
}



public void setstart_date(Date start_date)
{
	  this.start_date=start_date;
}
public Date getstart_date()
{
		return start_date;
}
	
public void setend_date(Date end_date)
{
	  this.end_date=end_date;
}
public Date getend_date()
{
		return end_date;
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
