package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class CustomerObject {
	int id;
	String customer_code=null;
	String company_name=null;
	String contact_person=null;
	long contact_phone1;
	String area_code="";
	long contact_phone2;
	String website_name=null;
	String customer_mail=null;
	String customer_door=null;
	String customer_street1=null;
	String customer_street2=null;
	String customer_city=null;
	String customer_state=null;
	String customer_country=null;
	String customer_zipcode=null;
	Date created_date=null;
	String created_by=null;
	Date updated_date=null;
	String updated_by=null;
	int  status=1;
	String remark=null;

	public void setid(int id)
	{
		this.id=id;
	}
	public int getid()
	{
		return id;
	}
	
	
	
	
	public void setcustomer_code(String customer_code)
	{
		this.customer_code=customer_code;
	}
	public String getcustomer_code()
	{
		return customer_code;
	}
	
	public void setcompany_name(String company_name)
	{
		this.company_name=company_name;
	}
	public String getcompany_name()
	{
		return company_name;
	}	
	
	

	public void setcontact_person(String contact_person)
	{
		this.contact_person=contact_person;
	}
	public String getcontact_person()
	{
		return contact_person;
	}
	
	public void setcontact_phone1(long contact_phone1)
	{
		this.contact_phone1=contact_phone1;
	}
	public long getcontact_phone1()
	{
		return contact_phone1;
	}
	
	

	public void setarea_code(String area_code)
	{
		this.area_code=area_code;
	}
	public String getarea_code()
	{
		return area_code;
	}
	
	
	
	
	
	
	
	
	
	public void setcontact_phone2(long contact_phone2)
	{
		this.contact_phone2=contact_phone2;
	}
	public long getcontact_phone2()
	{
		return contact_phone2;
	}
	

	public void setwebsite_name(String website_name)
	{
		this.website_name=website_name;
	}
	public String getwebsite_name()
	{
		return website_name;
	}
	
	
	public void setcustomer_mail(String customer_mail)
	{
		this.customer_mail=customer_mail;
	}
	public String getcustomer_mail()
	{
		return customer_mail;
	}	
	
	
	public void setcustomer_door(String customer_door)
	{
		this.customer_door=customer_door;
	}
	public String getcustomer_door()
	{
		return customer_door;
	}
	
	public void setcustomer_street1(String customer_street1)
	{
		this.customer_street1=customer_street1;
	}
	public String getcustomer_street1()
	{
		return customer_street1;
	}	
	

	public void setcustomer_street2(String customer_street2)
	{
		this.customer_street2=customer_street2;
	}
	public String getcustomer_street2()
	{
		return customer_street2;
	}
	

	public void setcustomer_city(String customer_city)
	{
		this.customer_city=customer_city;
	}
	public String getcustomer_city()
	{
		return customer_city;
	}
	

	public void setcustomer_state(String customer_state)
	{
		this.customer_state=customer_state;
	}
	public String getcustomer_state()
	{
		return customer_state;
	}
	

	public void setcustomer_country(String customer_country)
	{
		this.customer_country=customer_country;
	}
	public String getcustomer_country()
	{
		return customer_country;
	}
	

	public void setcustomer_zipcode(String customer_zipcode)
	{
		this.customer_zipcode=customer_zipcode;
	}
	public String getcustomer_zipcode()
	{
		return customer_zipcode;
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
