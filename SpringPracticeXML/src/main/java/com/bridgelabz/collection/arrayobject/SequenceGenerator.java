package com.bridgelabz.collection.arrayobject;


public class SequenceGenerator {

	private String prefix;
	private int initial;
	private int counter;
	private Object[] suffixes;
	 

	public SequenceGenerator() {
		System.out.println("Object is created...!");	
    }

	public SequenceGenerator(String prefix, int initial, int counter, Object[] suffixes) {
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

	public Object[] getSuffixes() {
		return suffixes;
	}

	public void setSuffixes(Object[] suffixes) {
	this.suffixes = suffixes;
	}	
	public synchronized String getSequence() {
		StringBuffer buffer = new StringBuffer();
		buffer.append(prefix);
		buffer.append(initial + counter++);
		for (Object suffix : suffixes) {
			buffer.append("-");
			buffer.append(suffix);
		}
		return buffer.toString();
	}
}