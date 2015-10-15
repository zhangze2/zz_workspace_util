package main.java.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class TimeUtil {
	// 常见错误 
	//java.sql.SQLDataException: ORA-01843: 无效的月份
	public static String now() {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return fm.format(new Date());
	}
	
	public static String getDate() {
		return now().substring(0, 10);
	}
	
	public static String getDate(String fmt) {
		SimpleDateFormat fm = new SimpleDateFormat(fmt);
		return fm.format(new Date());
	}
	
	public static String getTime(Date date) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return fm.format(date);
	}
	
	public static Date toDate(String date) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fm.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	public static Date toTime(String date) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return fm.parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	// 一个月的最后一天
	public static Date getLastDayOfMonth(int year, int month,String formatStyle) throws ParseException { 
		SimpleDateFormat sdf = new SimpleDateFormat(formatStyle);
        Calendar cal = new GregorianCalendar(); 
        cal.set(year,month-1,01);     
        cal.set(Calendar.DAY_OF_MONTH,cal.getActualMaximum(Calendar.DAY_OF_MONTH)); 
        String dateStr = sdf.format(cal.getTime());
       return  sdf.parse(dateStr);
    }   
	
	
}
