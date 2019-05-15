package cn.edu.nyist.milk.utils;

import java.util.Random;
public class KeyUtil {
	//生成唯一的主键
  public static synchronized String genUniqueKey() {
	  Random random=new Random();
	  Integer number=random.nextInt(900000)+100000;
	  return System.currentTimeMillis()+String.valueOf(number);
  }
  public static synchronized String getVerificationCode() {
	  int nextInt=(int) ((Math.random()*9+1)*100000);
	  return String.valueOf(nextInt);
  }
  public static void main(String[] args) {
 for(int i=0;i<99;i++) {
	 System.out.println(getVerificationCode());
 }
 
}
}
