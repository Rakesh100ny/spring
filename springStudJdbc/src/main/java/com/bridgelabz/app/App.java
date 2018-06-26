package com.bridgelabz.app;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.bridgelabz.jdbcimplementation.JdbcStudsOperation;
import com.bridgelabz.model.Student;
import com.bridgelabz.utility.Utility;

public class App {

	public static void main(String[] args) {
     ApplicationContext context=new GenericXmlApplicationContext("studs.xml");
     JdbcStudsOperation operation=context.getBean("jdbcOperations", JdbcStudsOperation.class);
     
        boolean flag;
        Student student;
		int choice;
		char input = ' ';
		do {

			System.out.print("\n\t\t\t\t\t Student Management System");
			System.out.print("\n\t\t\t\t\t----------------------------");
			System.out.print("\n\t\t\t\t\t Insert  Student : Enter 1");
			System.out.print("\n\t\t\t\t\t Update  Student : Enter 2");
			System.out.print("\n\t\t\t\t\t Delete  Student : Enter 3");
			System.out.print("\n\t\t\t\t\t Display Student : Enter 4");
			System.out.print("\n\t\t\t\t\t Exit            : Enter 5");
			System.out.print("\n\t\t\t\t\t----------------------------\n");

			System.out.print("\n\t\t\t\tEnter Choice : ");
			choice = Utility.getInstance().inputInteger();

			switch (choice) {
			case 1:
				System.out.println("\t\t\t\t\t       Student-Information");
				System.out.println("\t\t\t\t\t----------------------------------");
				student = new Student();
				student.setStudId(operation.getStudentId());

				System.out.print("\t\t\t\t\tEnter Student First Name : ");
				student.setStudFirstName(Utility.getInstance().inputString());

				System.out.print("\t\t\t\t\tEnter Student Last Name  : ");
				student.setStudLastName(Utility.getInstance().inputString());

				System.out.print("\t\t\t\t\tEnter Student Address    : ");
				student.setStudAddress(Utility.getInstance().inputString());

				System.out.print("\t\t\t\t\tEnter Student Depart     : ");
				student.setStudDepartment(Utility.getInstance().inputString());

				System.out.print("\t\t\t\t\tEnter Student Mobile No  : ");
				student.setStudMobileNo(Utility.getInstance().inputLong());

				flag=operation.insert(student);
				if (flag) {
					System.out.println("\n\t\t\t\tInsert Operation is sucessfully done...!");
				} else {
					System.out.println("\n\t\t\t\tInsert Operation is failed...!");
				}
				break;

			case 2:
				student = new Student();
				System.out.print("\n\t\tEnter the id Which Student You want to Update Information : ");
				student.setStudId(Utility.getInstance().inputInteger());

				System.out.println();
				System.out.print("\t\t\t\t\t     Update Employee");
				System.out.print("\n\t\t\t\t\t-----------------------");
				System.out.print("\n\t\t\t\t\t First  Name : Enter 1");
				System.out.print("\n\t\t\t\t\t Last   Name : Enter 2");
				System.out.print("\n\t\t\t\t\t Address     : Enter 3");
				System.out.print("\n\t\t\t\t\t Depart      : Enter 4");
				System.out.print("\n\t\t\t\t\t Mobile No   : Enter 5");
				System.out.print("\n\t\t\t\t\t-----------------------\n");

				System.out.print("\n\t\t\t\tEnter Choice : ");
				choice = Utility.getInstance().inputInteger();

				switch (choice) {
				case 1:
					System.out.print("\t\t\t\tEnter New First Name : ");
					student.setStudFirstName(Utility.getInstance().inputString());
					flag = operation.update(student,choice);

					if (flag) {
						System.out.println("\n\t\t\t\tFirst Name is sucessfully Updated...!");
					} else {
						System.out.println("\n\t\t\t\tUpdation is failed...Please Check First Name Correctly!");
					}

					break;

				case 2:
					System.out.print("\t\t\t\tEnter New Last Name : ");
					student.setStudLastName(Utility.getInstance().inputString());
					flag = operation.update(student, choice);
					if (flag) {
						System.out.println("\n\t\t\t\tLast Name is sucessfully Updated...!");
					} else {
						System.out.println("\n\t\t\t\tUpdation is failed...Please Check Last Name Correctly!");
					}

					break;

				case 3:
					System.out.println("\n\t\t\t\tEnter New Address   : ");
					student.setStudAddress(Utility.getInstance().inputString());
					flag = operation.update(student, choice);
					if (flag) {
						System.out.print("\t\t\t\tAddress is sucessfully Updated...!");
					} else {
						System.out.print("\t\t\t\tUpdation is failed...Please Check Address Correctly!");
					}
					break;

				case 4:
					System.out.print("\t\t\t\tEnter New Depart    : ");
					student.setStudDepartment(Utility.getInstance().inputString());
					flag = operation.update(student, choice);
					if (flag) {
						System.out.println("\n\t\t\t\tDepartment is sucessfully Updated...!");
					} else {
						System.out.println("\n\t\t\t\tUpdation is failed...Please Check Department Correctly!");
					}

					break;

				case 5:
					System.out.print("\t\t\t\tEnter New Mobile No : ");
					student.setStudMobileNo(Utility.getInstance().inputLong());
					flag = operation.update(student, choice);
					if (flag) {
						System.out.println("\n\t\t\t\tMobile No is sucessfully Updated...!");
					} else {
						System.out.println("\n\t\t\t\tUpdation is failed...Please Check Mobile No Correctly!");
					}

					break;

				default:
					System.out.print("\t\t\t\tInvalid Choice...!");
				}
				System.out.println();

				break;

			case 3:
				
				System.out.print("\n\t\t\tEnter the id Which You want to delete Details : ");
				student = new Student();
				student.setStudId(Utility.getInstance().inputInteger());
				flag = operation.delete(student);
				if (flag) {
					System.out.println("\n\t\t\t\t Student Id " + student.getStudId() + " is sucessfully Deleted...!");
				} else {
					System.out.println("\n\t\t\t\tUpdation is failed...Please Check Student Id Correctly!");
				}

				break;


			case 4:
				
					student=operation.display();
				 	 System.out.println();
			         System.out.println("\t\t\t\tID         : " + student.getStudId());
			         System.out.println("\t\t\t\tFirst Name : " + student.getStudFirstName());
			         System.out.println("\t\t\t\tLast Name  : " + student.getStudLastName());
			         System.out.println("\t\t\t\tAddress    : " + student.getStudAddress());
			         System.out.println("\t\t\t\tDepart     : " + student.getStudDepartment());
			         System.out.println("\t\t\t\tMobile     : " + student.getStudMobileNo());	
				break;

			case 5:
				System.exit(0);
             				
				break;
			default:
				System.out.println("\n\t\t\t\tInvalid Choice...!");
			}
			System.out.println();
			System.out.print("\n\t\t\t\tDo you Want to continue (Y/N) : ");
			input = Utility.getInstance().inputCharacter();
		} while (input == 'Y' || input == 'y');

	}


	}


