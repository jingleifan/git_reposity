package com.sgcc.sgd5000.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.dlptech.swap.constants.ETimeUnit;
import com.dlptech.swap.localization.Localization;

public class DateUtils {
	public static void main(String[] arg) {
		Localization localization = Localization.getInstance();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
Calendar  cal=Calendar.getInstance();
cal.set(2016, 1, 15);
Date date   =cal.getTime();
	System.out.println(sf.format(date));
		System.out.println(sf.format(localization.addDate(cal.getTime(), ETimeUnit.DAY, 1)));
//		System.out.println(sf.format(cal.getTime()));localization.addDate(start, ETimeUnit.MONTH, 1);
	}

	public void getDate() {

//		ETimeUnit.TENDAYS
		
		
		
		Date date1 = Localization.getInstance().truncTime(new Date(),ETimeUnit.DAY);    // 得到当前时间 ps:2016-12-16
		Date date3 = Localization.getInstance().truncTime(new Date(),ETimeUnit.MONTH);  // 得到当前时间的月初 ps:2016-12-01
		Date date2 = Localization.getInstance().truncTime(new Date(),ETimeUnit.YEAR);   // 得到当前时间的年份 ps:2016-01-01
//		Date date4 = Localization.getInstance().truncTime(new Date(),ETimeUnit.SEASON); // 
//		Date date4 = Localization.getInstance().truncTime(new Date(),ETimeUnit.TENDAYS); // 
//		Date date5 = Localization.getInstance().truncTime(new Date(),ETimeUnit.WEEK); // 
		
		
		
		Date date6 =	Localization.getInstance().addDate(new Date(), ETimeUnit.MONTH, 1); //时间往后推迟一个月
		Date date7 =	Localization.getInstance().addDate(new Date(), ETimeUnit.DAY, 1); //时间往后推迟一天
		Date date8 =	Localization.getInstance().addDate(new Date(), ETimeUnit.SEASON, 1); //时间往后推迟4个月
		Date date9 =	Localization.getInstance().addDate(new Date(), ETimeUnit.TENDAYS, 1); //时间往后推迟10天
//		Date date7 =	Localization.getInstance().addDate(new Date(), ETimeUnit.DAY, 1); //时间往后推迟一天
		
		
	}
}
