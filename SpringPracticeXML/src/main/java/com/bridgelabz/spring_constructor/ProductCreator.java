package com.bridgelabz.spring_constructor;
public class ProductCreator 
{
 public static Product createProduct(String productId)
 {
  Product object=null;	 
  switch (productId) {
case "tv" : object= new Battery("AAA", 2.5,0.2);
	
	break;
case "cdrw" : object =new Disc("CD-RW", 1.5,0.1);
	
	break;
case "dvdrw" : object = new Disc("DVD-RW", 3.0,0.1);
	
	break;
default:  throw new IllegalArgumentException("Unknown product");
	
}
  return  object;
 }
}
