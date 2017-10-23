package com.ennvee.ProjectManagement.beans;

import java.io.File;
import java.io.InputStream;
import java.util.Date;

public class ProjectObject {
  
	public	int id;
	public	String project_code;
	
	public	String project_name="";
	public	String project_description;
	public    Date start_date;
	public	Date end_date;
	public	String center;
	public	String location;
	public	String contract_type;
	public	String project_status;
	public	String technology;
	public	String customer_portfolio;
	public	int customer_id;
	public	String services_offered;
	public	 String offshore_effort;
	public	String total_effort;
	public	String onsite_effort;
	public	String project_manager;
	public	String delivery_manger;
	public	String onsite_cooedinator="";
	public	String manager_remark;
	public	String general_remark;
	public	String filename="";
	
	public	InputStream file;

	public String filedescription=" ";
	public	Date created_date;
	public	String created_by;
	public	Date updated_date;
	public	String updated_by;
	public	int  status=1;
	public	String remark;
	
	
	public void setid(int id)
	{
		this.id=id;
	}
	public int getid()
	{
		return id;
	}

	
	
public void setproject_code(String project_code)
{
	this.project_code=project_code;
}
public String getproject_code()
{
	return project_code;
}








public void setproject_description(String project_description)
{
	this.project_description=project_description;
}
public String getproject_description()
{
	return project_description;
}



public void setproject_name(String project_name)
{
	this.project_name=project_name;
}
public String getproject_name() {
	// TODO Auto-generated method stub
	return project_name;
}



public void setstart_date(Date start_date)
{
	this.start_date=start_date;
}

public Date getstart_date()
{
	return start_date;
}





public Date getend_date()
{
	return end_date;
}

public void setend_date(Date end_date)
{
	this.end_date=end_date;
}





public String getcenter()
{
	return center;
}
public void setcenter(String center)
{
	this.center=center;
}



public String getlocation()
{
	return location;
}
public void setlocation(String location)
{
	this.location=location;
}



public String getcontract_type()
{
	return contract_type;
}
public void setcontract_type(String contract_type)
{
	this.contract_type=contract_type;
}


public String getproject_status()
{
	return project_status;
}
public void setproject_status(String project_status)
{
	this.project_status=project_status;
}


public String gettechnology()
{
	return technology;
}
public void settechnology(String technology)
{
	this.technology=technology;
}



public String getcustomer_portfolio()
{
	return customer_portfolio;
}
public void setcustomer_portfolio(String customer_portfolio)
{
	this.customer_portfolio=customer_portfolio;
}



public void setcustomer_id(int customer_id)
{
	this.customer_id=customer_id;
}
public int getcustomer_id()
{
	return customer_id;
}



public String getservices_offered()
{
	return services_offered;
}
public void setservices_offered(String services_offered)
{
	this.services_offered=services_offered;
}



public String gettotal_effort()
{
	return total_effort;
}
public void settotal_effort(String total_effort)
{
	this.total_effort=total_effort;
}


public String getonsite_effort()
{
	return onsite_effort;
}
public void setonsite_effort(String onsite_effort)
{
	this.onsite_effort=onsite_effort;
}

public void setoffshore_effort(String offshore_effort)
{
	this.offshore_effort=offshore_effort;
}
public String getoffshore_effort()
{
	return offshore_effort;
}



public String getproject_manager()
{
	return project_manager;
}
public void setproject_manager(String project_manager)
{
	this.project_manager=project_manager;
}



public String getdelivery_manger()
{
	return delivery_manger;
}
public void setdelivery_manger(String delivery_manger)
{
	this.delivery_manger=delivery_manger;
}



public String getonsite_cooedinator()
{
	return onsite_cooedinator;
}
public void setonsite_cooedinator(String onsite_cooedinator)
{
	this.onsite_cooedinator=onsite_cooedinator;
}


public String getmanager_remark()
{
	return manager_remark;
}
public void setmanager_remark(String manager_remark)
{
	this.manager_remark=manager_remark;
}

public String getgeneral_remark()
{
	return general_remark;
}
public void setgeneral_remark(String general_remark)
{
	this.general_remark=general_remark;
}


//*************************************************************************
//file part
public void setfilename(String filename)
{
	this.filename=filename;
}
public String getfilename()
{
	return filename;
}

public void setfile(InputStream file)
{
	this.file=file;
}
public InputStream getfile()
{
	return file;
}

public void setfiledescription(String filediscrprtion)
{
	this.filedescription=filediscrprtion;
}
public String getfiledescription()
{
	return filedescription;
}



//*************************************************************************


public Date getcreated_date()
{
	return created_date;
}
public void setcreated_date(Date created_date)
{
	this.created_date=created_date;
}



public String getcreated_by()
{
	return created_by;
}
public void setcreated_by(String created_by)
{
	this.created_by=created_by;
}


public Date getupdated_date()
{
	return updated_date;
}
public void setupdated_date(Date updated_date)
{
	this.updated_date=updated_date;
}

public String getupdated_by()
{
	return updated_by;
}
public void setupdated_by(String updated_by)
{
	this.updated_by=updated_by;
}

public int getstatus()
{
	return status;
}
public void setstatus(int status)
{
	this.status=status;
}



public String getremark()
{
	return remark;
}
public void setremark(String remark)
{
	this.remark=remark;
}



}
