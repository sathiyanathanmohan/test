package com.ennvee.ProjectManagement.beans;

public class StatusObject {
int projectid;
	private int statusCode = 0 ;

	private String statusMessage = "";

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	
	public int getprojectid() {
		return projectid;
	}

	public void setprojectid(int projectid) {
		this.projectid = projectid;
	}
	
	@Override
	public String toString() {
		return "StatusObject [statusCode=" + statusCode + ", statusMessage="
				+ statusMessage + "]";
	}

}
