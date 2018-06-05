package com.bridgelabz.model;

public class Student
{
 private int studId;	
 private String studFirstName,studLastName,studAddress,studDepartment;
 private long studMobileNo;
/**
 * @return the studId
 */
public int getStudId() {
	return studId;
}
/**
 * @param studId the studId to set
 */
public void setStudId(int studId) {
	this.studId = studId;
}
/**
 * @return the studFirstName
 */
public String getStudFirstName() {
	return studFirstName;
}
/**
 * @param studFirstName the studFirstName to set
 */
public void setStudFirstName(String studFirstName) {
	this.studFirstName = studFirstName;
}
/**
 * @return the studLastName
 */
public String getStudLastName() {
	return studLastName;
}
/**
 * @param studLastName the studLastName to set
 */
public void setStudLastName(String studLastName) {
	this.studLastName = studLastName;
}
/**
 * @return the studAddress
 */
public String getStudAddress() {
	return studAddress;
}
/**
 * @param studAddress the studAddress to set
 */
public void setStudAddress(String studAddress) {
	this.studAddress = studAddress;
}
/**
 * @return the studDepartment
 */
public String getStudDepartment() {
	return studDepartment;
}
/**
 * @param studDepartment the studDepartment to set
 */
public void setStudDepartment(String studDepartment) {
	this.studDepartment = studDepartment;
}
/**
 * @return the studMobileNo
 */
public long getStudMobileNo() {
	return studMobileNo;
}
/**
 * @param studMobileNo the studMobileNo to set
 */
public void setStudMobileNo(long studMobileNo) {
	this.studMobileNo = studMobileNo;
}
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "Student [studId=" + studId + ", studFirstName=" + studFirstName + ", studLastName=" + studLastName
			+ ", studAddress=" + studAddress + ", studDepartment=" + studDepartment + ", studMobileNo=" + studMobileNo
			+ "]";
}
}
