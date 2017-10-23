package com.ennvee.ProjectManagement.log;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.ennvee.ProjectManagement.dao.DatabaseManagement;

//import sun.tools.javac.Main;

public class ReportLog {

	public String log(Object newobject,Object oldobject,String updated_by,String updated_place,String updated_id) {
		boolean exec=false;
		String acit="";
		System.out.println("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGD");
//		Class<?> objClass = newobject.getClass().getDeclaredFields();
//		Class<?> oldobjClass = oldobject.getClass().;
try{
	Field[] newfields = newobject.getClass().getDeclaredFields();

		Field[] oldfields = oldobject.getClass().getDeclaredFields();
		int m=1;
		for(int j = 0; j < newfields.length; j++) {
			String newname = newfields[j].getName();
			Object newvalue = newfields[j].get(newobject);
			for (int i = 0; i < oldfields.length; i++) {
				String oldname = oldfields[i].getName();
				Object oldvalue =  oldfields[i].get(oldobject);
				if(newname.equals(oldname))
				{

					if(oldvalue.toString().equals(newvalue.toString())){		      

					}else{


						exec=true;

						acit= acit+m+"."+oldname+":"+oldvalue.toString()+"   into change "+newvalue.toString();


						System.out.println(oldname + ": " + oldvalue.toString());

						System.out.println(newname + ": " + newvalue.toString());


						m++;
						acit=acit+"    ";

					
					}


				}
			}

		} 
		if(exec){

			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time=dateFormat.format(cal.getTime());
			String sql="insert into log(emp_code,updated_place,updated_id,time,change) values(?,?,?,?,?);";
			System.out.println(sql);
					Connection con;

			con=DatabaseManagement.getConnection();
			try {
				PreparedStatement pre=con.prepareStatement(sql);
				pre.setString(1, updated_by);
				pre.setString(2, updated_place);
				pre.setString(3, updated_id);
				pre.setString(4, time);
				pre.setString(5, acit);
				pre.executeUpdate();
				con.close();

			} catch (SQLException h) {
				// TODO Auto-generated catch block
				h.printStackTrace();
			}

		}
		
		

}catch(Exception e)
{
//	e.printStackTrace();
	if(exec){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String time=dateFormat.format(cal.getTime());

		String sql="insert into log(emp_code,updated_place,updated_id,time,change) values(?,?,?,?,?);";
		System.out.println(sql);
				Connection con;

		con=DatabaseManagement.getConnection();
		try {
			PreparedStatement pre=con.prepareStatement(sql);
			pre.setString(1, updated_by);
			pre.setString(2, updated_place);
			pre.setString(3, updated_id);
			pre.setString(4, time);
			pre.setString(5, acit);
			pre.executeUpdate();
			con.close();


		} catch (SQLException h) {
			// TODO Auto-generated catch block
			h.printStackTrace();
		}

	}
}
return acit;
	}


	
	
	
	public void newadd(String updated_by,String updated_type,String updated_code,String acitivity){
		

		String sql="insert into log(emp_code,updated_place,updated_id,time,change) values(?,?,?,?,?);";
	
				Connection con;

		con=DatabaseManagement.getConnection();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time=dateFormat.format(cal.getTime());
			PreparedStatement pre=con.prepareStatement(sql);
			pre.setString(1, updated_by);
			pre.setString(2, updated_type);
			pre.setString(3, updated_code);
			pre.setString(4, time);
			pre.setString(5, acitivity);
			pre.executeUpdate();
			con.close();

			

		} catch (SQLException h) {
			// TODO Auto-generated catch block
			h.printStackTrace();
		}

		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
