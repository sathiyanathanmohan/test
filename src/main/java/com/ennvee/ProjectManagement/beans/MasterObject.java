package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class MasterObject {
	
	
	String category=null;
	String item=null;
	String item_descrption=null;
	Date created_date=null;
	String created_by=null;
	Date updated_date=null;
	String updated_by=null;
	int  status=-1;
	String remark=null;

	
	public void setcategory(String category)
	{
		  this.category=category;
	}
	public String getcategory()
	{
			return category;
	}
	
	
	public void setitem(String item)
	{
		  this.item=item;
	}
	public String getitem()
	{
			return item;
	}
	
	
	public void setitem_descrption(String item_descrption)
	{
		  this.item_descrption=item_descrption;
	}
	public String getitem_descrption()
	{
			return item_descrption;
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
