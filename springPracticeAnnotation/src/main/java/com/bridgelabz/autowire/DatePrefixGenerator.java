package com.bridgelabz.autowire;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DatePrefixGenerator implements PrefixGenerator 
{
 private DateFormat formatter;	

 public void setPattern(String pattern)
 {
  this.formatter=new SimpleDateFormat(pattern);	 
 }
 
	@Override
	public String getPrefix() {
		return this.formatter.format(new Date());
	}

}
