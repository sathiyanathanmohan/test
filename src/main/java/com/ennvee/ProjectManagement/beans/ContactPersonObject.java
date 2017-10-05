package com.ennvee.ProjectManagement.beans;

import java.util.Date;

public class ContactPersonObject {

	
	int id;
	int customer_id;
	int project_id;
	String person_name;
	long  contact_no1;
	long  contact_no2;
	String mail;
	String project_code;
	String customer_code;
	String created_by;
	String updated_by;
	Date created_date;
	Date updated_date;
	int status;
    String remark;
	
   
  
	 public void setid(int id)
		{
			this.id=id;
		}
		public int getid()
		{
			return id;
		}
		
		 public void setproject_id(int project_id)
			{
				this.project_id=project_id;
			}
			public int getproject_id()
			{
				return project_id;
			}
			 
		 
		
		public void setcustomer_id(int customer_id)
			{
				this.customer_id=customer_id;
			}
			public int getcustomer_id()
			{
				return customer_id;
			}
			 
    
			
			 public void setcontact_no1(long  contact_no1)
				{
					this.contact_no1=contact_no1;
				}
				public long  getcontact_no1()
				{
					return contact_no1;
				}
				
				 public void setcontact_no2(long  contact_no2)
					{
						this.contact_no2=contact_no2;
					}
					public long  getcontact_no2()
					{
						return contact_no2;
					}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
    
    
    public void setperson_name(String person_name)
    {
    	  this.person_name=person_name;
    }
    public String getperson_name()
    {
    		return person_name;
    }
    	
    
    public void setmail(String mail)
    {
    	  this.mail=mail;
    }
    public String getmail()
    {
    		return mail;
    }
    	
    public void setproject_code(String project_code)
    {
    	  this.project_code=project_code;
    }
    public String getproject_code()
    {
    		return project_code;
    }
    
    
    public void setcustomer_code(String customer_code)
    {
    	  this.customer_code=customer_code;
    }
    public String getcustomer_code()
    {
    		return customer_code;
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
