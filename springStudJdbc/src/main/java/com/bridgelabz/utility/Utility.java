package com.bridgelabz.utility;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Utility {
	private Scanner scanner=new Scanner(System.in);

	  private Utility(){}
	 
	  private static class SingletonHelper
	  {
	      private static final Utility UTILITY = new Utility();
	  }
	  
	  public static Utility getInstance(){
	      return SingletonHelper.UTILITY;
	  }

	/**
	 * @return string input given by the user
	 */
	public String inputStringLine() {
		try {
			return scanner.nextLine();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
         e.printStackTrace();
		}
		return "";
	}

	public String inputString() {
		try {
			return scanner.next();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return "";
	}

	/**
	 * @return float input given by the user
	 */
	public float inputFloat() {
		try {
			return scanner.nextFloat();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return 0.0f;
	}

	/**
	 * @return long input given by the user
	 */
	public long inputLong() {
		try {
			return scanner.nextLong();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return 0;
	}

	/**
	 * @return character input given by the user
	 */
	public char inputCharacter() {
		try {
			return scanner.next().charAt(0);
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return ' ';
	}

	/**
	 * @return integer value given by the user
	 */
	public int inputInteger() {
		try {
			return scanner.nextInt();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return 0;
	}

	/**
	 * @return double value given by the user
	 */
	public double inputDouble() {
		try {
			return scanner.nextDouble();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return 0.0;
	}

	/**
	 * @return boolean value given by the user
	 */
	public boolean inputBoolean() {
		try {
			return scanner.nextBoolean();
		} catch (InputMismatchException e) {
			System.err.println("Input Exception[Utility.java] : "+e.getMessage());
		}
		catch (Exception e) {
	         e.printStackTrace();
			}
		return false;
	}

}
