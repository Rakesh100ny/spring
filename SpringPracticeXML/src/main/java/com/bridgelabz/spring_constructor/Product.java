package com.bridgelabz.spring_constructor;

public abstract class Product
{
 private String name;
 private double price;
 private double discount;
 public Product() {}

 public static final Product TV = new Battery("AAA", 2.5,0.1);
 public static final Product CDRW = new Disc("CD-RW", 1.5,0.2);
 public static final Product DVDRW = new Disc("DVD-RW", 1.5,0.2);
 
 public Product(String name, double price,double discount) {
	this.name = name;
	this.price = price;
	this.discount=discount;
 }

public Double getDiscount() {
	return discount;
}

public void setDiscount(Double discount) {
	this.discount = discount;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}

@Override
public String toString() {
	return "Product [name=" + name + ", price=" + price + ", discount=" + discount + "]";
}


 
 
 
 
}
