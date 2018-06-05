package com.bridgelabz.spring_constructor;

import java.util.*;
public class ShoppingCart 
{
 private List<Product> items=new ArrayList<Product>();
 
 public void addItem(Product item)
 {
  items.add(item);	 
 }
 
 public List<Product> getItems()
 {
  return items;	 
 }
}
