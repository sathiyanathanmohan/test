
package com.ennvee.ProjectManagement.webservice;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
// import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.tools.JavaFileObject;
// import javax.servlet.http.Part;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.StreamingOutput;
// import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
// import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import com.ennvee.ProjectManagement.beans.Allocationobject;
import com.ennvee.ProjectManagement.beans.ContactPersonObject;
import com.ennvee.ProjectManagement.beans.CustomerObject;
import com.ennvee.ProjectManagement.beans.Employeobject;
import com.ennvee.ProjectManagement.beans.LoginObject;
import com.ennvee.ProjectManagement.beans.MasterObject;
import com.ennvee.ProjectManagement.beans.ProjectObject;
import com.ennvee.ProjectManagement.beans.StatusObject;
import com.ennvee.ProjectManagement.beans.TimeSheetObject;
import com.ennvee.ProjectManagement.dao.DataHandler;
import com.ennvee.ProjectManagement.log.ReportLog;
import com.ennvee.ProjectManagement.models.Models;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.sun.tools.internal.ws.processor.model.Model;


@Path("/webservices")
public class Webservices
{
	
	// **************************************************************************************
	@POST
	@Path("/createproject")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String createproject(@FormParam("projectcode") String project_code,
			@FormParam("projectname") String project_name,
			@FormParam("pd") String project_description,
			@FormParam("center") String center,
			@FormParam("startdate") String start_date,
			@FormParam("enddate") String end_date,
			@FormParam("location") String location,
			@FormParam("contracttype") String contract_type,
			@FormParam("projectstatus") String project_status,
			@FormParam("customerportfolio") String customer_portfolio,
			@FormParam("customer_id") int customer_id,
			@FormParam("services") String services, @FormParam("tech") String technology,
			@FormParam("effortrequired") String effort_required,
			@FormParam("onsite") String onsite, @FormParam("offshore") String offshore,
			@FormParam("projectmanager") String project_manager,
			@FormParam("deliverymanager") String delivery_manager,
			@FormParam("onsitecoordinator") String onsite_coordinator,
			@FormParam("pm") String pm,
			@FormParam("conatctperson") List<String> conatctperson,
			@FormParam("general") String general,
			@FormParam("filedescr") String file_description,
			@FormParam("emp_code") String updated_by)
	{
	
		Date update_date = new Date(new java.util.Date().getTime());
		Date start_date1 = null;;
		Date end_date1 = null;;
		try
		{
			start_date1 = Date.valueOf(start_date);
			end_date1 = Date.valueOf(end_date);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(updated_by);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		ProjectObject update = new ProjectObject();
		try
		{
			update.setproject_code(project_code);
			update.setproject_name(project_name);
			update.setproject_description(project_description);
			update.setcenter(center);
			update.setcontract_type(contract_type);
			update.setcustomer_portfolio(customer_portfolio);
			update.setcustomer_id(customer_id);
			update.setdelivery_manger(delivery_manager);
			update.setlocation(location);
			update.setend_date(end_date1);
			update.setstart_date(start_date1);
			update.setservices_offered(services);
			update.settechnology(technology);
			update.settotal_effort(effort_required);
			update.setonsite_effort(onsite);
			update.setoffshore_effort(offshore);
			update.setproject_manager(project_manager);
			update.setonsite_cooedinator(onsite_coordinator);
			update.setmanager_remark(pm);
			update.setgeneral_remark(general);
			update.setfiledescription(file_description);
			update.setproject_status(project_status);
			update.setupdated_by(updated_by);
			update.setupdated_date(update_date);
			update.setstatus(0);
		}
		catch (Exception e)
		{
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.insertproject(update);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", sObject.getprojectid());
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	// get percentage allocation employee details on project_code based
	@GET
	@Path("/allallocationemp")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allaction_emp(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allallocation = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> allocationList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			allocationList = dataHandler.all_allocation_emp(emp_code);
			if (allocationList != null && allocationList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(allocationList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allallocation = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allallocation);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allallocation);
		}
		System.out.println("Result returned from get_allocation():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/all_allocation_manager")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allaction_manager(@QueryParam("emp_code") String emp_code)
	{
	
		System.out.println(emp_code);
		System.out.println("all_allocation_manager");
		JsonObject jsonResult = new JsonObject();
		JsonArray allallocation = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> allocationList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			allocationList = dataHandler.all_allocation_manager(emp_code);
			if (allocationList != null && allocationList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(allocationList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allallocation = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allallocation);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allallocation);
		}
		System.out.println("Result returned from get_allocation():" + jsonResult);
		return jsonResult.toString();
	}
	
	// **************************************************************************************getemployees_login()
	@POST
	@Path("/editproject")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String editproject(@FormParam("id") int id,
			@FormParam("projectcode") String project_code,
			@FormParam("projectname") String project_name,
			@FormParam("pd") String project_description,
			@FormParam("center") String center,
			@FormParam("startdate") String start_date,
			@FormParam("enddate") String end_date,
			@FormParam("location") String location,
			@FormParam("contracttype") String contract_type,
			@FormParam("projectstatus") String project_status,
			@FormParam("customerportfolio") String customer_portfolio,
			@FormParam("cc") int customer_id, @FormParam("services") String services,
			@FormParam("tech") String technology,
			@FormParam("effortrequired") String effort_required,
			@FormParam("onsite") String onsite, @FormParam("offshore") String offshore,
			@FormParam("projectmanager") String project_manager,
			@FormParam("deliverymanager") String delivery_manager,
			@FormParam("onsitecoordinator") String onsite_coordinator,
			@FormParam("pm") String pm, @FormParam("general") String general,
			@FormParam("filedescr") String file_description,
			@FormParam("emp_code") String updated_by)
	{
	
		System.out.println(onsite_coordinator);
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy/m/dd");
		Date start_date1 = null;;
		Date end_date1 = null;;
		try
		{
			start_date1 = Date.valueOf(start_date);
			end_date1 = Date.valueOf(end_date);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		ProjectObject update = new ProjectObject();
		try
		{
			update.setid(id);
			update.setproject_code(project_code);
			update.setproject_name(project_name);
			update.setproject_description(project_description);
			update.setcenter(center);
			update.setcontract_type(contract_type);
			update.setcustomer_portfolio(customer_portfolio);
			update.setdelivery_manger(delivery_manager);
			update.setlocation(location);
			update.setend_date(end_date1);
			update.setstart_date(start_date1);
			update.setservices_offered(services);
			update.settechnology(technology);
			update.settotal_effort(effort_required);
			update.setonsite_effort(onsite);
			update.setoffshore_effort(offshore);
			update.setproject_manager(project_manager);
			update.setonsite_cooedinator(onsite_coordinator);
			update.setmanager_remark(pm);
			update.setgeneral_remark(general);
			update.setfiledescription(file_description);
			update.setproject_status(project_status);
			update.setcustomer_id(customer_id);
			update.setupdated_by(updated_by);
			update.setstatus(0);
			Models newobject = new Models();
			newobject.setprojectobject(update);
		}
		catch (Exception e)
		{
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.editproject(update);
			status = sObject.getStatusCode();
			if (status == 0)
			{
				ReportLog log = new ReportLog();
				String updated_place = "Project";
				String updated_id = String.valueOf(id);
				String logg = log.log(Models.getprojectObject(),
						Models.getoldprojectObject(), updated_by, updated_place,
						updated_id);
			}
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", id);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	@POST
	@Path("/createemployee")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String create_employee(@FormParam("emp_code") String emp_code,
			@FormParam("emp_name") String emp_name,
			@FormParam("emp_mail") String emp_mail,
			@FormParam("emp_design") String emp_design,
			@FormParam("login_emp_code") String updated_by)
	{
	
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		Employeobject emp = new Employeobject();
		try
		{
			emp.setemp_code(emp_code);
			emp.setdesignation(emp_design);
			emp.setfirst_name(emp_name);
			emp.setemp_mail(emp_mail);
			emp.setupdated_by(updated_by);
			emp.setstatus(0);
			emp.setremark("");
		}
		catch (Exception e)
		{
			System.out.println("Error set Employeobject error");
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler data = new DataHandler();
			StatusObject statusObject = new StatusObject();
			statusObject = data.create_employee(emp);
			status = statusObject.getStatusCode();
			errorMessage = statusObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@POST
	@Path("/editemployee")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String edit_employee(@FormParam("row_id") int row_id,
			@FormParam("emp_code") String emp_code,
			@FormParam("emp_name") String emp_name,
			@FormParam("emp_mail") String emp_mail,
			@FormParam("emp_design") String emp_design,
			@FormParam("emp_status") int emp_status,
			@FormParam("login_emp_code") String updated_by)
	{
	
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		Employeobject emp = new Employeobject();
		try
		{
			emp.setid(row_id);
			emp.setemp_code(emp_code);
			emp.setdesignation(emp_design);
			emp.setfirst_name(emp_name);
			emp.setemp_mail(emp_mail);
			emp.setupdated_by(updated_by);
			emp.setstatus(emp_status);
			emp.setremark("");
			Models newobject = new Models();
			newobject.setemployeeobject(emp);
		}
		catch (Exception e)
		{
			System.out.println("Error set Employeobject error");
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler data = new DataHandler();
			StatusObject statusObject = new StatusObject();
			statusObject = data.edit_employee(emp);
			status = statusObject.getStatusCode();
			if (status == 0)
			{
				ReportLog log = new ReportLog();
				String updated_place = "Employee";
				String updated_id = String.valueOf(row_id);
				String logg = log.log(Models.getemployeeObject(),
						Models.getoldemployeeObject(), updated_by, updated_place,
						updated_id);
			}
			errorMessage = statusObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Path("/projectallocation")
	public String project_allocation(@FormParam("empid") String emp_code,
			@FormParam("emp_name") String emp_name,
			@FormParam("pro_code") String project_code,
			@FormParam("percentage") int percentage_allocation,
			@FormParam("startdate") String start_date,
			@FormParam("enddate") String end_date,
			@FormParam("manager_id") String project_manager,
			@FormParam("location") String location,
			@FormParam("login_emp_code") String updated_by)
	{
	
		// System.out.println(emp_name+location+project_manager);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		Allocationobject allocation = new Allocationobject();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy/m/dd");
		Date start_date1 = null;;
		Date end_date1 = null;;
		try
		{
			start_date1 = Date.valueOf(start_date);
			end_date1 = Date.valueOf(end_date);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		try
		{
			allocation.setemp_code(emp_code);
			allocation.setemp_name(emp_name);
			allocation.setproject_code(project_code);
			allocation.setproject_manager(project_manager);
			allocation.setlocation(location);
			allocation.setpercentage_allocation(percentage_allocation);
			allocation.setstart_date(start_date1);
			allocation.setend_date(end_date1);
			// // allocation.setcreated_date(null);
			// // allocation.setcreated_by("");
			// allocation.setupdated_date(null);
			allocation.setupdated_by(updated_by);
			allocation.setstatus(0);
			allocation.setremark("");
		}
		catch (Exception e)
		{
			System.out.println("Error set Allocation error");
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler data = new DataHandler();
			StatusObject statusObject = new StatusObject();
			statusObject = data.project_allocation(allocation);
			status = statusObject.getStatusCode();
			errorMessage = statusObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Path("/updateallocation")
	public String update_allocation(@FormParam("eemp_id") String emp_code,
			@FormParam("eempname") String emp_name,
			@FormParam("epro_code") String project_code,
			@FormParam("epercentage") int percentage_allocation,
			@FormParam("estartdate") String start_date,
			@FormParam("eenddate") String end_date,
			@FormParam("emanager_id") String project_manager,
			@FormParam("elocation") String location, @FormParam("id") int id,
			@FormParam("login_emp_code") String updated_by)
	{
	
		// System.out.println(emp_name+location+project_manager+start_date+end_date+location+emp_code+percentage_allocation);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		Allocationobject allocation = new Allocationobject();
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy/m/dd");
		Date start_date1 = null;;
		Date end_date1 = null;;
		try
		{
			start_date1 = Date.valueOf(start_date);
			end_date1 = Date.valueOf(end_date);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		try
		{
			allocation.setid(id);
			allocation.setemp_code(emp_code);
			allocation.setemp_name(emp_name);
			allocation.setproject_code(project_code);
			allocation.setproject_manager(project_manager);
			allocation.setlocation(location);
			allocation.setpercentage_allocation(percentage_allocation);
			allocation.setstart_date(start_date1);
			allocation.setend_date(end_date1);
			// // allocation.setcreated_date(null);
			// // allocation.setcreated_by("");
			// allocation.setupdated_date(null);
			allocation.setupdated_by(updated_by);
			allocation.setstatus(0);
			allocation.setremark("");
			Models newobject = new Models();
			newobject.setallocationobject(allocation);
		}
		catch (Exception e)
		{
			System.out.println("Error set Allocation error");
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler data = new DataHandler();
			StatusObject statusObject = new StatusObject();
			statusObject = data.update_allocation(allocation);
			status = statusObject.getStatusCode();
			if (status == 0)
			{
				ReportLog log = new ReportLog();
				String updated_place = "Employee";
				String updated_id = String.valueOf(id);
				String logg = log.log(Models.getallocationObject(),
						Models.getoldallocationObject(), updated_by, updated_place,
						updated_id);
			}
			errorMessage = statusObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	@GET
	@Path("/getallproject")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allproject()
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allproject = null;
		int status = -1;
		String errorMessage = "";
		List<ProjectObject> proList = null;
		try
		{
			DataHandler dataHandler = new DataHandler();
			proList = dataHandler.get_allprojectdetails();
			if (proList != null && proList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(proList,
						new TypeToken<List<ProjectObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allproject = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "project details not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allproject);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allproject);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_allproject():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@POST
	@Path("/createcustomer")
	@Produces(MediaType.APPLICATION_JSON)
	public String create_customer(@FormParam("clientcode") String customer_code,
			@FormParam("clientname") String company_name,
			@FormParam("contact_person") String contact_person,
			@FormParam("areacode") String area_code,
			@FormParam("phoneno") long contact_phone1,
			@FormParam("contact_phone2") long contact_phone2,
			@FormParam("website") String website_name,
			@FormParam("email") String customer_mail,
			@FormParam("customer_door") String customer_door,
			@FormParam("address1") String customer_street1,
			@FormParam("address2") String customer_street2,
			@FormParam("city") String customer_city,
			@FormParam("state") String customer_state,
			@FormParam("country") String customer_country,
			@FormParam("zipcode") String customer_zipcode)
	{
	
		int status = -1;
		String errorMessage = " ";
		JsonObject jsonResult = new JsonObject();
		CustomerObject customer = new CustomerObject();
		try
		{
			customer.setcustomer_code(customer_code);
			customer.setcompany_name(company_name);
			customer.setcontact_phone1(contact_phone1);
			customer.setarea_code(area_code);
			customer.setcontact_phone2(contact_phone2);
			customer.setcustomer_mail(customer_mail);
			customer.setwebsite_name(website_name);
			customer.setcustomer_door(customer_door);
			customer.setcustomer_street1(customer_street1);
			customer.setcustomer_street2(customer_street2);
			customer.setcustomer_city(customer_city);
			customer.setcustomer_state(customer_state);
			customer.setcustomer_country(customer_country);
			customer.setcustomer_zipcode(customer_zipcode);
		}
		catch (Exception e)
		{
			System.out.println("Exception while all customer data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", " ");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.createcustomer(customer);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", sObject.getprojectid());
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/getallemployee")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allemployee(@QueryParam("designation") String designation)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployeedetails(designation);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_allemployee1():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/getallemployeemanager")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allemployeemanager(@QueryParam("designation") String designation)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getempmanagerdetails(designation);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_allemployee1():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **********************************************************************************************
	@POST
	@Path("/getlogin")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_login(@QueryParam("password") String password,
			@QueryParam("username") String empid)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray login = null;
		int status = 0;
		String errorMessage = "";
		List<LoginObject> loginList = new ArrayList<LoginObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			loginList = dataHandler.getlogin(empid, password);
			System.out.println(password);
			if (loginList != null && loginList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(loginList,
						new TypeToken<List<LoginObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				login = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "username or password mismatch";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", login);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", login);
		}
		// System.out.println("**********************************************************************");
		System.out.println("Result returned from get_getlogin():" + jsonResult);
		// System.out.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/all_employee_details")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_employee_login()
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployees_login();
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_employee_login( ):" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	// get allocation employee details on project_code based
	@GET
	@Path("/updatelogin")
	@Produces(MediaType.APPLICATION_JSON)
	public String update_login(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray update_login = null;
		int status = -1;
		String errorMessage = "";
		List<LoginObject> loginList = new ArrayList<LoginObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			loginList = dataHandler.update_login(emp_code);
			if (loginList != null && loginList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(loginList,
						new TypeToken<List<LoginObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				update_login = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "login details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", update_login);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", update_login);
		}
		System.out.println("Result Returned from login():" + jsonResult);
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@POST
	@Path("/logincreation")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String logincreation(@FormParam("empname") String user_name,
			@FormParam("pass") String password, @FormParam("designation") String role,
			@FormParam("empid") String emp_id)
	{
	
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		LoginObject update = new LoginObject();
		try
		{
			update.setuser_name(user_name);
			update.setpassword(password);
			update.setemp_id(emp_id);
			update.setrole(role);
			update.setstatus(0);
		}
		catch (Exception e)
		{
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.login_creation(update);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", sObject.getprojectid());
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	@POST
	@Path("/updatepassword")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String updatepass(@FormParam("id") String id,
			@FormParam("newpassword") String project_code)
	{
	
		// System.out.println(file_description);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		LoginObject update = new LoginObject();
		try
		{
			update.setemp_id(id);
			update.setpassword(project_code);
			update.setstatus(0);
		}
		catch (Exception e)
		{
			System.out.println("Exception while User data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", "");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.updatepass(update);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", id);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************
	@GET
	@Path("/getallcustomerdetails")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allcustomerdetails()
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allcus = null;
		int status = -1;
		String errorMessage = "";
		List<CustomerObject> cusList = null;
		try
		{
			DataHandler dataHandler = new DataHandler();
			cusList = dataHandler.getcustomerdeatils();
			if (cusList != null && cusList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(cusList,
						new TypeToken<List<CustomerObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allcus = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "custormer details not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allcus);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allcus);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from getcustomerdeatils():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/getmasterdetails")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_masterdetails(@QueryParam("category") String category)
	{
	
		MasterObject master = new MasterObject();
		JsonObject jsonResult = new JsonObject();
		JsonArray allmaster = null;
		int status = 0;
		String errorMessage = "";
		List<MasterObject> masterList = new ArrayList<MasterObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			masterList = dataHandler.get_master_deatils(category);
			if (masterList != null && masterList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(masterList,
						new TypeToken<List<MasterObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allmaster = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "Master details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allmaster);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allmaster);
		}
		// System.out.println("**********************************************************************");
		System.out.println("Result returned from get_masterdetails():" + jsonResult);
		// System.out.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	// get allocation employee details on project_code based
	@GET
	@Path("/allallocation")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allaction(@QueryParam("project_code") String Project_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allallocation = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> allocationList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			allocationList = dataHandler.all_allocation(Project_code);
			if (allocationList != null && allocationList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(allocationList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allallocation = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allallocation);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allallocation);
		}
		System.out.println("Result returned from get_allocation():" + jsonResult);
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/oneallocation")
	@Produces(MediaType.APPLICATION_JSON)
	public String oneallocation(@QueryParam("id") int id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allallocation = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> allocationList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			allocationList = dataHandler.one_allocation(id);
			if (allocationList != null && allocationList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(allocationList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allallocation = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allallocation);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allallocation);
		}
		System.out.println("Result returned from get_oneallocation():" + jsonResult);
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/getproject")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_projectdetails(@QueryParam("id") int id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allproject = null;
		int status = -1;
		String errorMessage = "";
		List<ProjectObject> projectList = new ArrayList<ProjectObject>();;
		try
		{
			DataHandler dataHandler = new DataHandler();
			projectList = dataHandler.get_project(id);
			if (projectList != null && projectList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(projectList,
						new TypeToken<List<ProjectObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allproject = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allproject);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allproject);
		}
		System.out.println("Result returned from get_project():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getprojectcodebased")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_projectdetailscode(@QueryParam("project_code") String project_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allproject = null;
		int status = -1;
		String errorMessage = "";
		List<ProjectObject> projectList = new ArrayList<ProjectObject>();;
		try
		{
			DataHandler dataHandler = new DataHandler();
			projectList = dataHandler.get_projectcode(project_code);
			if (projectList != null && projectList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(projectList,
						new TypeToken<List<ProjectObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allproject = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allproject);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allproject);
		}
		System.out.println("Result returned from get_project():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getemployee")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_employee(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployee(emp_code);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_employee():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getemployeekeypress")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_employeekeypress(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployeekeypress(emp_code);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_employee():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getemployeenamekeypress")
	@Produces(MediaType.APPLICATION_JSON)
	public String getemployeenamekeypress(@QueryParam("emp_name") String emp_name)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployeenamekeypress(emp_name);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_employee():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@POST
	@Path("/fileupload")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes({ MediaType.MULTIPART_FORM_DATA })
	public String uploadPdfFile(@FormDataParam("file") InputStream fileInputStream,
			@FormDataParam("file") FormDataContentDisposition fileMetaData,
			@FormDataParam("id") int id,
			@FormDataParam("id") FormDataContentDisposition project_codefileMetaData)
			throws Exception
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		ProjectObject update = new ProjectObject();
		try
		{
			update.setfile(fileInputStream);
			update.setid(id);
			update.setfilename(fileMetaData.getFileName());
			update.setstatus(0);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.fileUpload(update);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	@POST
	@Path("/filechange")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes({ MediaType.MULTIPART_FORM_DATA })
	public String filechange(@FormDataParam("file") InputStream fileInputStream,
			@FormDataParam("id") int id, @FormDataParam("filename") String filename,
			@FormDataParam("file_descrption") String file_descrprtion) throws Exception
	{
	
		System.out.println(filename);
		JsonObject jsonResult = new JsonObject();
		// JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		ProjectObject update = new ProjectObject();
		try
		{
			update.setfile(fileInputStream);
			update.setid(id);
			update.setfiledescription(file_descrprtion);
			update.setfilename(filename);
			System.out.println(filename);
			update.setstatus(0);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			// System.out.println("data handler");
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.filechange(update);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_all_file_name")
	public String get_all_file_name(@QueryParam("projectid") int id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allcustomer = null;
		int status = -1;
		String errorMessage = "";
		List<ProjectObject> filelist = new ArrayList<ProjectObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			filelist = dataHandler.get_all_file_name(id);
			if (filelist != null && filelist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(filelist,
						new TypeToken<List<ProjectObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allcustomer = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allcustomer);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allcustomer);
		}
		System.out.println("Result returned from getallcustomer():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/filedownload")
	public Response downloadPdfFile(@QueryParam("projectid") final String id,
			@QueryParam("filename") final String filename)
	{
	
		String file = "";
		System.out.println(id);
		StreamingOutput fileStream = new StreamingOutput() {
			
			@Override
			public void write(java.io.OutputStream output) throws IOException,
					WebApplicationException
			{
			
				try
				{
					String rootPath = System.getProperty("catalina.home");
					System.out.println(rootPath);
					String alreadypath = rootPath + File.separator + "projectmanagement"
							+ File.separator + "file" + File.separator + id
							+ File.separator + filename;
					System.out.println(alreadypath);
					java.nio.file.Path path = Paths.get(alreadypath);
					byte[] data = Files.readAllBytes(path);
					output.write(data);
					output.flush();
				}
				catch (Exception e)
				{
					throw new WebApplicationException("File Not Found !!");
				}
			}
		};
		return Response.ok(fileStream, MediaType.APPLICATION_OCTET_STREAM)
				.header("content-disposition", "attachment; filename =" + filename)
				.build();
	}
	
	@GET
	@Path("/filedelete")
	public String DeleteFile(@QueryParam("projectid") final int id,
			@QueryParam("filename") final String filename)
	{
	
		JsonObject jsonResult = new JsonObject();
		DataHandler datahandler = new DataHandler();
		StatusObject sObject = new StatusObject();
		try
		{
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", "");
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
			sObject = datahandler.filedeleted(id, filename);
			jsonResult.addProperty("status", sObject.getStatusCode());
			// jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			// deleting file failed
			jsonResult.addProperty("status", -1);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
			e.printStackTrace();
		}
		System.out.println(jsonResult.toString());
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getallcustomer")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_all_customer()
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allcustomer = null;
		int status = -1;
		String errorMessage = "";
		List<CustomerObject> customerlist = new ArrayList<CustomerObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			customerlist = dataHandler.all_customer();
			if (customerlist != null && customerlist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(customerlist,
						new TypeToken<List<CustomerObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allcustomer = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allcustomer);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allcustomer);
		}
		System.out.println("Result returned from getallcustomer():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getallcontactperson")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allcontact_person(@QueryParam("customer_id") int customer_id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<ContactPersonObject> personlist = new ArrayList<ContactPersonObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			personlist = dataHandler.all_contactperson(customer_id);
			if (personlist != null && personlist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(personlist,
						new TypeToken<List<ContactPersonObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_allcontact_person_onproject")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_allcontact_person_onproject(
			@QueryParam("customer_id") int customer_id,
			@QueryParam("project_id") int project_id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<ContactPersonObject> personlist = new ArrayList<ContactPersonObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			System.out.println(customer_id + project_id);
			personlist = dataHandler.get_allcontact_person_onproject(customer_id,
					project_id);
			if (personlist != null && personlist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(personlist,
						new TypeToken<List<ContactPersonObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getonecontact")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_onecontact(@QueryParam("id") int id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<CustomerObject> contactlist = new ArrayList<CustomerObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			contactlist = dataHandler.one_contact(id);
			if (contactlist != null && contactlist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(contactlist,
						new TypeToken<List<CustomerObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from one_contact():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/getonecontactperson")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_onecontact_person(@QueryParam("id") int id)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<ContactPersonObject> personlist = new ArrayList<ContactPersonObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			personlist = dataHandler.one_contactperson(id);
			if (personlist != null && personlist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(personlist,
						new TypeToken<List<ContactPersonObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@POST
	@Path("/contactpersonsave")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String contactpersonsave(@FormParam("person_id") List<String> conatctperson,
			@FormParam("project_id") int project_id,
			@FormParam("contact_id") int customer_id)
	{
	
		String errorMessage = "";
		System.out.println(conatctperson);
		ContactPersonObject contact;
		StatusObject status = new StatusObject();
		DataHandler dataHandler = new DataHandler();
		Iterator<String> itr = conatctperson.iterator();
		JsonObject jsonResult = new JsonObject();
		while (itr.hasNext())
		{
			try
			{
				contact = new ContactPersonObject();
				int id = Integer.parseInt(itr.next());
				contact.setproject_id(project_id);
				contact.setid(id);
				contact.setcustomer_id(customer_id);
				status = dataHandler.updatecontactperson(contact);
				errorMessage = status.getStatusMessage();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", e.getMessage());
			}
		}
		System.out.println(jsonResult.toString());
		return jsonResult.toString();
	}
	
	@POST
	@Path("/contactpersonreupdate")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String contactpersonreupdate(
			@FormParam("person_id") List<String> conatctperson,
			@FormParam("project_id") int project_id,
			@FormParam("contact_id") int customer_id)
	{
	
		String errorMessage = "";
		System.out.println(conatctperson);
		ContactPersonObject contact;
		StatusObject status = new StatusObject();
		DataHandler dataHandler = new DataHandler();
		dataHandler.deleteallcontact(project_id);
		Iterator<String> itr = conatctperson.iterator();
		JsonObject jsonResult = new JsonObject();
		while (itr.hasNext())
		{
			try
			{
				contact = new ContactPersonObject();
				int id = Integer.parseInt(itr.next());
				contact.setproject_id(project_id);
				contact.setid(id);
				contact.setcustomer_id(customer_id);
				status = dataHandler.updatecontactperson(contact);
				errorMessage = status.getStatusMessage();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", e.getMessage());
			}
		}
		System.out.println(jsonResult.toString());
		return jsonResult.toString();
	}
	
	@POST
	@Path("/methodName")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public String methodName(@FormParam("personname") List<String> personname,
			@FormParam("personmail") List<String> personmail,
			@FormParam("personno1") List<Long> personno1,
			@FormParam("personno2") List<Long> personno2,
			@FormParam("customer_id") int customer_id) throws Exception
	{
	
		String errorMessage = "";
		ContactPersonObject contact;
		StatusObject status = new StatusObject();
		DataHandler dataHandler = new DataHandler();
		JsonObject jsonResult = new JsonObject();
		int size = personname.size();
		System.out.println(size);
		for (int i = 0; i < size; i++)
		{
			try
			{
				contact = new ContactPersonObject();
				if (!(personname.get(i) == null))
				{
					contact.setperson_name(personname.get(i));
				}
				else
				{
					contact.setperson_name("");
				}
				if (!(personmail.get(i) == null))
				{
					contact.setmail(personmail.get(i));
				}
				else
				{
					contact.setmail("");
				}
				if (!(personno1.get(i) == null))
				{
					contact.setcontact_no1(personno1.get(i));
				}
				else
				{
					contact.setcontact_no1(0);
				}
				if (!(personno2.get(i) == null))
				{
					contact.setcontact_no2(personno2.get(i));
				}
				else
				{
					contact.setcontact_no2(0);
				}
				contact.setcustomer_id(customer_id);
				status = dataHandler.createconatctperson(contact);
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", e.getMessage());
			}
		}
		System.out.println(jsonResult.toString());
		return jsonResult.toString();
	}
	
	@POST
	@Path("/editcustomerdetails")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public String edit_customer(@FormParam("id") int customer_id,
			@FormParam("clientcode") String customer_code,
			@FormParam("clientname") String company_name,
			@FormParam("contact_person") String contact_person,
			@FormParam("phoneno") long contact_phone1,
			@FormParam("areacode") String area_code,
			@FormParam("contact_phone2") long contact_phone2,
			@FormParam("website") String website_name,
			@FormParam("email") String customer_mail,
			@FormParam("customer_door") String customer_door,
			@FormParam("address1") String customer_street1,
			@FormParam("address2") String customer_street2,
			@FormParam("city") String customer_city,
			@FormParam("state") String customer_state,
			@FormParam("country") String customer_country,
			@FormParam("zipcode") String customer_zipcode)
	{
	
		int status = -1;
		String errorMessage = " ";
		JsonObject jsonResult = new JsonObject();
		CustomerObject customer = new CustomerObject();
		try
		{
			customer.setid(customer_id);
			customer.setcustomer_code(customer_code);
			customer.setcompany_name(company_name);
			customer.setcontact_phone1(contact_phone1);
			customer.setarea_code(area_code);
			customer.setcontact_phone2(contact_phone2);
			customer.setcustomer_mail(customer_mail);
			customer.setwebsite_name(website_name);
			customer.setcustomer_door(customer_door);
			customer.setcustomer_street1(customer_street1);
			customer.setcustomer_street2(customer_street2);
			customer.setcustomer_city(customer_city);
			customer.setcustomer_state(customer_state);
			customer.setcustomer_country(customer_country);
			customer.setcustomer_zipcode(customer_zipcode);
		}
		catch (Exception e)
		{
			System.out.println("Exception while all customer data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", " ");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.editcustomer(customer);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", sObject.getprojectid());
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	@POST
	@Path("/delete_contect_person")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public String delete_contect_person(@QueryParam("id") int row_id)
	{
	
		int status = -1;
		String errorMessage = " ";
		JsonObject jsonResult = new JsonObject();
		CustomerObject customer = new CustomerObject();
		try
		{}
		catch (Exception e)
		{
			System.out.println("Exception while all customer data is set in Object: "
					+ e.getMessage());
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage",
					"User Data not inserted:" + e.getMessage());
			jsonResult.addProperty("object", " ");
			return jsonResult.toString();
		}
		try
		{
			DataHandler datahandler = new DataHandler();
			StatusObject sObject = new StatusObject();
			sObject = datahandler.delete_contect_person(row_id);
			status = sObject.getStatusCode();
			errorMessage = sObject.getStatusMessage();
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.addProperty("id", sObject.getprojectid());
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	@POST
	@Path("/contactpersonedit")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public String contactpersonedit(@FormParam("personname") List<String> personname,
			@FormParam("personmail") List<String> personmail,
			@FormParam("personno1") List<Long> personno1,
			@FormParam("personno2") List<Long> personno2,
			@FormParam("customer_id") int customer_id,
			@FormParam("conatctpersonid") List<Integer> conatctpersonid) throws Exception
	{
	
		// System.out.println(conatctpersonid);
		String errorMessage = "";
		ContactPersonObject contact;
		StatusObject status = new StatusObject();
		DataHandler dataHandler = new DataHandler();
		JsonObject jsonResult = new JsonObject();
		int size = personname.size();
		System.out.println(personname.size() + " " + personmail.size() + " "
				+ conatctpersonid.size() + " " + personno2.size() + " "
				+ conatctpersonid.size());
		for (int i = 0; i < size; i++)
		{
			try
			{
				contact = new ContactPersonObject();
				if (!(personname.get(i) == null))
				{
					contact.setperson_name(personname.get(i));
				}
				else
				{
					contact.setperson_name("");
				}
				if (!(personmail.get(i) == null))
				{
					contact.setmail(personmail.get(i));
				}
				else
				{
					contact.setmail("");
				}
				if (!(personno1.get(i) == null))
				{
					contact.setcontact_no1(personno1.get(i));
				}
				else
				{
					contact.setcontact_no1(0);
				}
				if (!(personno2.get(i) == null))
				{
					contact.setcontact_no2(personno2.get(i));
				}
				else
				{
					contact.setcontact_no2(0);
				}
				if (!(personno2.get(i) == null))
				{
					contact.setid(conatctpersonid.get(i));
				}
				else
				{
					contact.setid(0);
				}
				contact.setcustomer_id(customer_id);
				status = dataHandler.contactpersonedit(contact);
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				jsonResult.addProperty("status", status.getStatusCode());
				jsonResult.addProperty("errorMessagetet", e.getMessage());
			}
		}
		System.out.println(jsonResult.toString());
		return jsonResult.toString();
	}
	
	@POST
	@Path("/timesheet")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String time_sheet(@FormParam("employee_code") String emp_code,
			@FormParam("employee_name") String emp_name,
			@FormParam("project_code") List<String> project_code,
			@FormParam("date") List<String> date,
			@FormParam("starttime") List<String> start_time,
			@FormParam("endttime") List<String> end_time,
			@FormParam("hour") List<String> total_hours,
			@FormParam("acitivity") List<String> acitivity,
			@FormParam("work_remark") String work_remark,
			@FormParam("approved_status") String approved_status,
			@FormParam("approved_by") String approved_by,
			@FormParam("workactivity") List<String> work_description,
			@FormParam("rejected_reason") String rejected_reason)
	{
	
		int size = project_code.size();
		Date date1;
		System.out.println(size);
		// try {
		// date1=Date.valueOf(date.get(1));
		//
		// } catch (Exception e1) {
		//
		// e1.printStackTrace();
		// }
		StatusObject sObject = new StatusObject();
		// System.out.println(project_code+"  "+project_manager+" "+contract_type);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		TimeSheetObject update;
		for (int i = 0; i < size; i++)
		{
			try
			{
				update = new TimeSheetObject();
				if (!(project_code.get(i) == null))
				{
					update.setproject_code(project_code.get(i));
				}
				else
				{
					update.setproject_code("");
				}
				if (!(date.get(i) == null))
				{
					try
					{
						date1 = Date.valueOf(date.get(i));
						update.setdate(date1);
						System.out.println(date1 + " " + date.get(i));
					}
					catch (Exception e1)
					{
						e1.printStackTrace();
					}
				}
				else
				{
					update.setdate(null);
				}
				if (!(start_time.get(i) == null))
				{
					update.setstart_time(start_time.get(i));
				}
				else
				{
					update.setstart_time("");
				}
				if (!(end_time.get(i) == null))
				{
					update.setend_time(end_time.get(i));
				}
				else
				{
					update.setend_time("");
				}
				if (!(acitivity.get(i) == null))
				{
					update.setacitivity(acitivity.get(i));
				}
				else
				{
					update.setacitivity("");
				}
				if (!(total_hours.get(i) == null))
				{
					update.settotal_hours(total_hours.get(i));
				}
				else
				{
					update.settotal_hours("");
				}
				if (!(work_description.get(i) == null))
				{
					update.setwork_description(work_description.get(i));
				}
				else
				{
					update.setwork_description("");
				}
				update.setapproved_status("Pending");
				update.setemp_code(emp_code);
				update.setemp_name(emp_name);
				DataHandler datahandler = new DataHandler();
				sObject = datahandler.inserttimesheet(update);
				jsonResult.addProperty("status", sObject.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
				System.out.println("Result to be returned:" + jsonResult);
			}
			// update.setemp_code(emp_code);
			// update.setemp_name(emp_name);
			// update.setproject_code(project_code);
			// update.setdate(date1);
			// update.setstart_time(start_time);
			// update.setend_time(end_time);
			// update.settotal_hours(total_hours);
			// update.setacitivity(acitivity);
			// update.setwork_remark(work_remark);
			// update.setapproved_status(approved_status);
			// update.setapproved_by(approved_by);
			// update.setrejected_reason(rejected_reason);
			//
			catch (Exception e)
			{
				System.out.println("Exception while User data is set in Object: "
						+ e.getMessage());
				jsonResult.addProperty("status", status);
				jsonResult.addProperty("errorMessage",
						"User Data not inserted:" + e.getMessage());
				jsonResult.addProperty("object", "");
				return jsonResult.toString();
			}
		}
		return jsonResult.toString();
		// return null;
	}
	
	@GET
	@Path("/report")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String report(@QueryParam("emp_code") String emp_code)
	{
	
		System.out.println("hello");
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			array = datahandler.report(emp_code);
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	@GET
	@Path("/report1")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String report1(@QueryParam("project_code") String project_code)
	{
	
		System.out.println("hello1");
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			array = datahandler.reportproject(project_code);
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	@GET
	@Path("/getworkactivity")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_workactivity(@QueryParam("category") String category)
	{
	
		MasterObject master = new MasterObject();
		JsonObject jsonResult = new JsonObject();
		JsonArray allmaster = null;
		int status = 0;
		String errorMessage = "";
		List<MasterObject> masterList = new ArrayList<MasterObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			masterList = dataHandler.get_master_deatils(category);
			if (masterList != null && masterList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(masterList,
						new TypeToken<List<MasterObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allmaster = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "Master details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allmaster);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allmaster);
		}
		// System.out.println("**********************************************************************");
		System.out.println("Result returned from get_masterdetails():" + jsonResult);
		// System.out.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheet_one_emp")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheet_one_emp(@QueryParam("emp_code") String emp_code,
			@QueryParam("start_date") String start_date1)
	{
	
		System.out.println(start_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(start_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<TimeSheetObject> timelist = new ArrayList<TimeSheetObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			timelist = dataHandler.get_timesheet_one_emp(emp_code, start_date);
			if (timelist != null && timelist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(timelist,
						new TypeToken<List<TimeSheetObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "Employee Timesheet Details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheet")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheet(@QueryParam("emp_code") String emp_code,
			@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1)
	{
	
		System.out.println(start_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(start_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<TimeSheetObject> timelist = new ArrayList<TimeSheetObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			timelist = dataHandler.get_timesheet(emp_code, start_date, end_date);
			if (timelist != null && timelist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(timelist,
						new TypeToken<List<TimeSheetObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheetview")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheetview(@QueryParam("emp_code") String emp_code,
			@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1)
	{
	
		System.out.println(start_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(start_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			allperson = dataHandler.get_timesheetview(emp_code, start_date, end_date);
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_timesheetview():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheetviewadmin")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheetviewadmin(@QueryParam("emp_code") String emp_code,
			@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1)
	{
	
		System.out.println(start_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(start_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			allperson = dataHandler
					.get_timesheetviewadmin(emp_code, start_date, end_date);
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_timesheetview():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheetall")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheetall(@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1,
			@QueryParam("project_manager") String project_manager)
	{
	
		System.out.println(start_date1 + " " + end_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(project_manager + " " + start_date + " " + end_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		List<TimeSheetObject> timelist = new ArrayList<TimeSheetObject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			timelist = dataHandler
					.get_timesheetall(start_date, end_date, project_manager);
			if (timelist != null && timelist.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(timelist,
						new TypeToken<List<TimeSheetObject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allperson = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheetallview")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheetallview(@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1,
			@QueryParam("project_manager") String project_manager)
	{
	
		System.out.println(start_date1 + " " + end_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(project_manager + " " + start_date + " " + end_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			allperson = dataHandler.get_timesheetallview(start_date, end_date,
					project_manager);
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/get_timesheetallviewadmin")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_timesheetallviewadmin(@QueryParam("start_date") String start_date1,
			@QueryParam("end_date") String end_date1,
			@QueryParam("project_manager") String project_manager)
	{
	
		System.out.println(start_date1 + " " + end_date1);
		Date start_date = null;
		Date end_date = null;
		try
		{
			start_date = Date.valueOf(start_date1);
			end_date = Date.valueOf(end_date1);
		}
		catch (Exception e1)
		{
			e1.printStackTrace();
		}
		System.out.println(project_manager + " " + start_date + " " + end_date);
		JsonObject jsonResult = new JsonObject();
		JsonArray allperson = null;
		int status = -1;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			allperson = dataHandler.get_timesheetallviewadmin(start_date, end_date,
					project_manager);
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allperson);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allperson);
		}
		System.out.println("Result returned from get_allcontact_person():" + jsonResult);
		return jsonResult.toString();
	}
	
	@POST
	@Path("/timesheetedit")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String time_sheet_edit(@FormParam("rowid") List<Integer> id,
			@FormParam("sequnce_no") List<Integer> sequnce_no,
			@FormParam("employee_code") String emp_code,
			@FormParam("employee_name") String emp_name,
			@FormParam("project_code") List<String> project_code,
			@FormParam("date") String date,
			@FormParam("starttime") List<String> start_time,
			@FormParam("endttime") List<String> end_time,
			@FormParam("hour") List<String> total_hours,
			@FormParam("day_hour") String day_hours,
			@FormParam("acitivity") List<String> acitivity,
			@FormParam("work_remark") String work_remark,
			@FormParam("approved_status") String approved_status,
			@FormParam("workactivity") List<String> work_description)
	{
	
		int size = project_code.size();
		Date date1;
		System.out.println(size);
		// try {
		// date1=Date.valueOf(date.get(1));
		//
		// } catch (Exception e1) {
		//
		// e1.printStackTrace();
		// }
		StatusObject sObject = new StatusObject();
		// System.out.println(project_code+"  "+project_manager+" "+contract_type);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		TimeSheetObject update;
		for (int i = 0; i < size; i++)
		{
			try
			{
				update = new TimeSheetObject();
				if (!(id.get(i) == null))
				{
					update.setid(id.get(i));
					System.out.println(id.get(i));
				}
				else
				{
					update.setid(0);
				}
				if (!(sequnce_no.get(i) == null))
				{
					update.setsequnces_no(sequnce_no.get(i));
					System.out.println(sequnce_no.get(i));
				}
				else
				{
					update.setsequnces_no(0);
				}
				if (!(project_code.get(i) == null))
				{
					update.setproject_code(project_code.get(i));
				}
				else
				{
					update.setproject_code("");
				}
				if (!(start_time.get(i) == null))
				{
					update.setstart_time(start_time.get(i));
				}
				else
				{
					update.setstart_time("");
				}
				if (!(end_time.get(i) == null))
				{
					update.setend_time(end_time.get(i));
				}
				else
				{
					update.setend_time("");
				}
				if (!(acitivity.get(i) == null))
				{
					update.setacitivity(acitivity.get(i));
				}
				else
				{
					update.setacitivity("");
				}
				if (!(total_hours.get(i) == null))
				{
					update.settotal_hours(total_hours.get(i));
				}
				else
				{
					update.settotal_hours("");
				}
				if (!(work_description.get(i) == null))
				{
					update.setwork_description(work_description.get(i));
				}
				else
				{
					update.setwork_description("");
				}
				// update.setapproved_status("pending");
				update.setemp_code(emp_code);
				update.setemp_name(emp_name);
				update.setday_hours(day_hours);
				update.setapproved_status(approved_status);
				try
				{
					date1 = Date.valueOf(date);
					update.setdate(date1);
					System.out.println(date1 + " " + date);
				}
				catch (Exception e1)
				{
					e1.printStackTrace();
				}
				DataHandler datahandler = new DataHandler();
				sObject = datahandler.edittimesheet(update);
				jsonResult.addProperty("status", sObject.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
				System.out.println("Result to be returned:" + jsonResult);
			}
			// update.setemp_code(emp_code);
			// update.setemp_name(emp_name);
			// update.setproject_code(project_code);
			// update.setdate(date1);
			// update.setstart_time(start_time);
			// update.setend_time(end_time);
			// update.settotal_hours(total_hours);
			// update.setacitivity(acitivity);
			// update.setwork_remark(work_remark);
			// update.setapproved_status(approved_status);
			// update.setapproved_by(approved_by);
			// update.setrejected_reason(rejected_reason);
			//
			catch (Exception e)
			{
				System.out.println("Exception while User data is set in Object: "
						+ e.getMessage());
				jsonResult.addProperty("status", status);
				jsonResult.addProperty("errorMessage",
						"User Data not inserted:" + e.getMessage());
				jsonResult.addProperty("object", "");
				return jsonResult.toString();
			}
		}
		return jsonResult.toString();
		// return null;
	}
	
	@GET
	@Path("/deletedtimesheetrow")
	@Produces(MediaType.APPLICATION_JSON)
	public String deletedtimesheetrow(@QueryParam("rowid") int rowid)
	{
	
		System.out.println(rowid);
		StatusObject sObject = new StatusObject();
		JsonObject jsonResult = new JsonObject();
		JsonArray allmaster = null;
		int status = 0;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			sObject = dataHandler.deletedtimesheetrow(rowid);
			jsonResult.addProperty("status", sObject.getStatusCode());
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allmaster);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allmaster);
		}
		// System.out.println("**********************************************************************");
		System.out.println("Result returned from get_masterdetails():" + jsonResult);
		// System.out.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@POST
	@Path("/timesheetapproved")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String timesheetapproved(@FormParam("emp_code") List<String> emp_code,
			@FormParam("approved") List<String> approved_status,
			@FormParam("date") List<String> date,
			@FormParam("approved_by") String approved_by,
			@FormParam("reject") List<String> rejected_reason)
	{
	
		int size = emp_code.size();
		System.out.println(size);
		// try {
		Date date1 = null;
		//
		// } catch (Exception e1) {
		//
		// e1.printStackTrace();
		// }
		StatusObject sObject = new StatusObject();
		// System.out.println(project_code+"  "+project_manager+" "+contract_type);
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		TimeSheetObject update;
		for (int i = 0; i < size; i++)
		{
			try
			{
				update = new TimeSheetObject();
				if (!(emp_code.get(i) == null))
				{
					update.setemp_code(emp_code.get(i));
				}
				else
				{
					update.setemp_code("");
				}
				if (!(date.get(i) == null))
				{
					try
					{
						date1 = Date.valueOf(date.get(i));
						update.setdate(date1);
						System.out.println(date1 + " " + date);
					}
					catch (Exception e1)
					{
						e1.printStackTrace();
					}
				}
				else
				{
					update.setdate(null);
				}
				if (!(approved_status.get(i) == null))
				{
					update.setapproved_status(approved_status.get(i));
				}
				else
				{
					update.setapproved_status("");
				}
				if (!(rejected_reason.get(i) == null))
				{
					update.setrejected_reason(rejected_reason.get(i));
				}
				else
				{
					update.setrejected_reason("");
				}
				// update.setapproved_status("pending");
				update.setapproved_by(approved_by);
				DataHandler datahandler = new DataHandler();
				sObject = datahandler.timesheetapproved(update);
				jsonResult.addProperty("status", sObject.getStatusCode());
				jsonResult.addProperty("errorMessage", errorMessage);
				System.out.println("Result to be returned:" + jsonResult);
				System.out.println("Result to be returned:" + jsonResult);
			}
			catch (Exception e)
			{
				System.out.println("Exception while User data is set in Object: "
						+ e.getMessage());
				jsonResult.addProperty("status", status);
				jsonResult.addProperty("errorMessage",
						"User Data not inserted:" + e.getMessage());
				jsonResult.addProperty("object", "");
				return jsonResult.toString();
			}
		}
		return jsonResult.toString();
		// return null;
	}
	
	@GET
	@Path("/managerdashboard")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_managerdashboard(@QueryParam("project_code") String project_code,
			@QueryParam("project_manager") String project_manager)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allallocation = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> allocationList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			allocationList = dataHandler.manager_dashboard(project_code, project_manager);
			if (allocationList != null && allocationList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(allocationList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allallocation = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "allocation details not avilable";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allallocation);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allallocation);
		}
		System.out.println("Result returned from get_allocation():" + jsonResult);
		return jsonResult.toString();
	}
	
	@GET
	@Path("/managerview")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String managerview(@QueryParam("project_manager") String project_manager)
	{
	
		System.out.println("manager");
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			array = datahandler.managerdashboard1(project_manager);
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	@POST
	@Path("/forgetpassword")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String forgetpassword(@QueryParam("emp_code") String emp_code)
	{
	
		StatusObject status = new StatusObject();
		int statuscode = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			status = datahandler.forgetpassword(emp_code);
			jsonResult.addProperty("status", status.getStatusCode());
			jsonResult.addProperty("errorMessage", status.getStatusMessage());
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", statuscode);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	// *************************************************************************
	@POST
	@Path("/managermail")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String managermail(@QueryParam("branch") String branch,
			@QueryParam("manager_code") String manager_code,
			@QueryParam("emp_code") String emp_code,
			@QueryParam("project_code") String project_code)
	{
	
		StatusObject status = new StatusObject();
		int statuscode = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			status = datahandler.managermailsent(branch, manager_code, emp_code,
					project_code);
			jsonResult.addProperty("status", status.getStatusCode());
			jsonResult.addProperty("errorMessage", status.getStatusMessage());
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", statuscode);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	// ****************************************************************************************
	@POST
	@Path("/passwordchange")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String resetcodecheck(@QueryParam("emp_code") String emp_code,
			@QueryParam("newpassword") String newpassword)
	{
	
		StatusObject status = new StatusObject();
		int statuscode = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			status = datahandler.passwordchange(emp_code, newpassword);
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", statuscode);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
	}
	
	@GET
	@Path("/managerviewemployee")
	@Produces(MediaType.APPLICATION_JSON)
	public String manager_viewemp(@QueryParam("project_manager") String project_manager)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> empList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.managerviewemp(project_manager);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_manager_emp():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// ************************************************************************
	@GET
	@Path("/emptimesheet")
	@Produces(MediaType.APPLICATION_JSON)
	// @Consumes(MediaType.MULTIPART_FORM_DATA)
	// @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String emptimesheet(@QueryParam("project_manager") String project_manager)
	{
	
		System.out.println("hello");
		int status = -1;
		String errorMessage = "";
		JsonObject jsonResult = new JsonObject();
		JsonArray array = new JsonArray();
		try
		{
			DataHandler datahandler = new DataHandler();
			array = datahandler.timesheetapproval(project_manager);
			jsonResult.addProperty("status", 0);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", array);
			System.out.println("Result to be returned:" + jsonResult);
		}
		catch (Exception e)
		{
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.addProperty("object", "");
			System.out.println("Result to be returned:" + jsonResult);
		}
		return jsonResult.toString();
		// return null;
	}
	
	// **************************************************************************************
	@GET
	@Path("/timesheetapproval")
	@Produces(MediaType.APPLICATION_JSON)
	public String timesheetapproval(@QueryParam("project_manager") String project_manager)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> empList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.timesheet_view(project_manager);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_timesheet_all():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// *******************************************************************************************
	@GET
	@Path("/timesheetview")
	@Produces(MediaType.APPLICATION_JSON)
	public String timesheetview(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		try
		{
			DataHandler dataHandler = new DataHandler();
			allemployee = dataHandler.admintimesheetview(emp_code);
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_timesheet_all():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	@GET
	@Path("/designation_get")
	@Produces(MediaType.APPLICATION_JSON)
	public String designation_get(@QueryParam("Emp_code") String empcode)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		JsonArray designation = new JsonArray();
		int status = -1;
		String errorMessage = "";
		List<Allocationobject> empList = new ArrayList<Allocationobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			designation = dataHandler.designation_get(empcode);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Allocationobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_allemployee():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
	
	// **************************************************************************************
	@GET
	@Path("/employeecodekeypress")
	@Produces(MediaType.APPLICATION_JSON)
	public String get_employeecodekeypress(@QueryParam("emp_code") String emp_code)
	{
	
		JsonObject jsonResult = new JsonObject();
		JsonArray allemployee = null;
		int status = -1;
		String errorMessage = "";
		List<Employeobject> empList = new ArrayList<Employeobject>();
		try
		{
			DataHandler dataHandler = new DataHandler();
			empList = dataHandler.getemployeekeypress(emp_code);
			if (empList != null && empList.size() > 0)
			{
				status = 0;
				Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(empList,
						new TypeToken<List<Employeobject>>() {}.getType());
				if (!element.isJsonArray())
				{
					System.out.println("Failed to create JSON");
				}
				allemployee = element.getAsJsonArray();
			}
			else
			{
				status = 1;
				errorMessage = "employee not available";
			}
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", errorMessage);
			jsonResult.add("object", allemployee);
		}
		catch (Exception e)
		{
			status = 1;
			jsonResult.addProperty("status", status);
			jsonResult.addProperty("errorMessage", e.getMessage());
			jsonResult.add("object", allemployee);
		}
		System.out
				.println("**********************************************************************");
		System.out.println("Result returned from get_employee():" + jsonResult);
		System.out
				.println("**********************************************************************");
		return jsonResult.toString();
	}
}
