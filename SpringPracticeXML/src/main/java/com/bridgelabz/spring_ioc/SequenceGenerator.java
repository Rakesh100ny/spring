package com.bridgelabz.spring_ioc;

import java.beans.ConstructorProperties;

import com.bridgelabz.autowire.PrefixGenerator;

public class SequenceGenerator 
{
 private String prefix;
 private String suffix;
 private int initial;
 private int counter;
 private PrefixGenerator prefixGenerator;
 
 public SequenceGenerator() {
 }
 
 public SequenceGenerator(PrefixGenerator prefixGenerator) {
	 this.prefixGenerator = prefixGenerator;
	 }
 
 public void setPrefixGenerator(PrefixGenerator prefixGenerator) {
	 this.prefixGenerator = prefixGenerator;
	 }
 
 @ConstructorProperties({"prefix", "suffix"})
 public SequenceGenerator(String prefix, String suffix) {
	this.prefix = prefix;
	this.suffix = suffix;
}
 @ConstructorProperties({"prefix", "initial"})
 public SequenceGenerator(String prefix, int initial) {
	 this.prefix = prefix;
	 this.initial = initial;
	 }
 @ConstructorProperties({"initial", "suffix"})
 public SequenceGenerator(int initial, String suffix) {
	 this.initial = initial;
	 this.suffix = suffix;
	 }
public SequenceGenerator(String prefix, String suffix, int initial) {
	this.prefix = prefix;
	this.suffix = suffix;
	this.initial = initial;
	
 }

public String getPrefix() {
	return prefix;
}

public void setPrefix(String prefix) {
	this.prefix = prefix;
}

public String getSuffix() {
	return suffix;
}

public void setSuffix(String suffix) {
	this.suffix = suffix;
}

public int getInitial() {
	return initial;
}

public void setInitial(int initial) {
	this.initial = initial;
}

public int getCounter() {
	return counter;
}

public void setCounter(int counter) {
	this.counter = counter;
}
 
 public synchronized String getSequence()
 {
  StringBuffer buffer=new StringBuffer();
	  buffer.append(prefixGenerator.getPrefix());
	  buffer.append(initial+counter++);
  buffer.append(suffix);
  return buffer.toString();
  
 }
 
}
