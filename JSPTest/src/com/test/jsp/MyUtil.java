package com.test.jsp;

import java.util.Random;

public class MyUtil {
	public int getNum() {
		   Random rnd = new Random();
		   int num = rnd.nextInt(100);
		   num *= 2;
		   return num;
		}
}
