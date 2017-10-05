package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class TimeSheetObject {
	
	int id;
	int sequnces_no;
	String work_description="";
	String emp_code="";
	String emp_name="";
	String project_code="";
	Date date;
	String start_time="";
	String end_time="";
	String total_hours="";
	String day_hours="";
	String acitivity="";
	String work_remark="";
	String approved_status="";
	String approved_by="";
	String rejected_reason="";
	Date created_date;
	String created_by="";
	Date updated_date;
	String updated_by="";
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
	
	
	public void setsequnces_no(int sequnces_no)
	{
		  this.sequnces_no=sequnces_no;
	}
	public int getsequnces_no()
	{
			return sequnces_no;
	}
	
	
	
	public void setemp_code(String emp_code)
	{
		  this.emp_code=emp_code;
	}
	public String getemp_code()
	{
			return emp_code;
	}
	
	public void setday_hours(String day_hours)
	{
		  this.day_hours=day_hours;
	}
	public String getday_hours()
	{
			return day_hours;
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
	
	public void setdate(Date date)
	{
		  this.date=date;
	}
	public Date getdate()
	{
			return date;
	}
	
	

	public void setstart_time(String start_time)
	{
		  this.start_time=start_time;
	}
	public String getstart_time()
	{
			return start_time;
	}
	

	public void setend_time(String end_time)
	{
		  this.end_time=end_time;
	}
	public String getend_time()
	{
			return end_time;
	}
	
	public void settotal_hours(String total_hours)
	{
		  this.total_hours=total_hours;
	}
	public String gettotal_hours()
	{
			return total_hours;
	}
	
	public void setwork_description(String work_description)
	{
		  this.work_description=work_description;
	}
	public String getwork_description()
	{
			return work_description;
	}
	
	
	public void setacitivity(String acitivity)
	{
		  this.acitivity=acitivity;
	}
	public String getacitivity()
	{
			return acitivity;
	}
	
	public void setwork_remark(String work_remark)
	{
		  this.work_remark=work_remark;
	}
	public String getwork_remark()
	{
			return work_remark;
	}

	
	public void setapproved_status(String approved_status)
	{
		  this.approved_status=approved_status;
	}
	public String getapproved_status()
	{
			return approved_status;
	}
	
	public void setapproved_by(String approved_by)
	{
		  this.approved_by=approved_by;
	}
	public String getapproved_by()
	{
			return approved_by;
	}
	
	public void setrejected_reason(String rejected_reason)
	{
		  this.rejected_reason=rejected_reason;
	}
	public String getrejected_reason()
	{
			return rejected_reason;
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
