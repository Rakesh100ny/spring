package com.bridgelabz.collection.map;

import java.util.Map;

public class SequenceGenerator 
{
	private String prefix;
	private int initial;
	private int counter;
	private Map<Object, Object> suffixes;
	 
	public SequenceGenerator() {
		System.out.println("Object is created...!");	
    }

	public SequenceGenerator(String prefix, int initial, int counter, Map<Object,Object> suffixes) {
		super();
		this.prefix = prefix;
		this.initial = initial;
		this.counter = counter;
		this.suffixes = suffixes;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
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

	public Map<Object, Object> getSuffixes() {
		return suffixes;
	}

	public void setSuffixes(Map<Object, Object> suffixes) {
		this.suffixes = suffixes;
		}	
		

	public synchronized String getSequence() {
		StringBuffer buffer = new StringBuffer();
		buffer.append(prefix);
		buffer.append(initial + counter++);
		for (Map.Entry entry : suffixes.entrySet()) {
		buffer.append("-");
		buffer.append(entry.getKey());
		buffer.append("@");
		buffer.append(entry.getValue());
		}
		return buffer.toString();
		}
		}