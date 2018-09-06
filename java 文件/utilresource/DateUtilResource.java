package com.sgcc.action.utilresource;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.jfree.data.time.Day;

import com.dlptech.swap.constants.ETimeUnit;
import com.dlptech.swap.localization.Localization;

public class DateUtilResource {
	/**
	 * @方法名：getCanlendar
	 * @返回类型: Date
	 * @创建人：jf
	 * @创建时间：2016-12-26上午9:29:41
	 * @创建目的:将日期转化为日期
	 * @修改人： 修改内容： 修改备注：
	 * @param date
	 *            传过来的日期类型
	 * @param simpleDateformatter
	 *            格式化类型 yyyy-MM-dd
	 * @return
	 */
	public static Date getDateByDate(Date date, String simpleDateFormat) {
		SimpleDateFormat sf = new SimpleDateFormat(simpleDateFormat);
		try {
			return sf.parse(sf.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @方法名：getDatebyString
	 * @返回类型: String
	 * @创建人：jf
	 * @创建时间：2016-12-26上午9:32:30
	 * @创建目的:将date类型转化为String
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 *            日期
	 * @param simpleDateFormat
	 *            格式化标准 yyyy-MM-dd
	 * @return
	 */
	public static String getStringByDate(Date date, String simpleDateFormat) {
		SimpleDateFormat sf = new SimpleDateFormat(simpleDateFormat);
		return sf.format(date);
	}

	/**
	 * @方法名：getStringByString
	 * @返回类型: String
	 * @创建人：jf
	 * @创建时间：2016-12-26上午10:57:47
	 * @创建目的:将stirng日期转化为date
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param simpleDateFormat
	 * @return
	 */
	public static Date getDateByString(String date, String simpleDateFormat) {
		SimpleDateFormat sf = new SimpleDateFormat(simpleDateFormat);
		try {
			return sf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @返回类型: String
	 * @创建目的: 日期String 格式化返回String
	 * @方法名：getStringByString
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:14:33
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param simpleDateFormat
	 * @return
	 */
	public static String getStringByString(String date, String simpleDateFormat) {
		SimpleDateFormat sf = new SimpleDateFormat(simpleDateFormat);
		try {
			return sf.format(sf.parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @返回类型: int
	 * @创建目的:得到两个时间相差的天数，ps：2016-12-26和2016-12-28 相差3天
	 * @方法名：getIntByDate
	 * @创建人：jf
	 * @创建时间：2016-12-26下午12:09:24
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 */
	public static int getIntByDate(Date dateStart, Date dateEnd) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long between_days = -1;
		try {
			Date timeStart = sdf.parse(sdf.format(dateStart));
			// Date timeLast = sdf.parse(sdf.format(dateEnd));
			Calendar cal = Calendar.getInstance();
			cal.setTime(timeStart);
			long time1 = cal.getTimeInMillis();
			timeStart = sdf.parse(sdf.format(dateEnd));
			cal.setTime(timeStart);
			long time2 = cal.getTimeInMillis();
			between_days = (time2 - time1) / (1000 * 3600 * 24) + 1;

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return Integer.parseInt(String.valueOf(between_days));

	}

	/**
	 * @返回类型: long
	 * @创建目的:返回时间的毫秒数
	 * @方法名：getMillis
	 * @创建人：jf
	 * @创建时间：2016-12-26下午12:03:44
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @return
	 */
	public static long getMillis(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}

	/**
	 * @返回类型: Date
	 * @创建目的:得到当前时间 精确到天
	 * @方法名：getNowDate
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:25:09
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @return
	 */
	public static Date getDateDay(Date date) {
		return Localization.getInstance().truncTime(date, ETimeUnit.DAY);
	}

	/**
	 * @返回类型: Date
	 * @创建目的:得到日期类型的月初 如2016-12-01-01
	 * @方法名：getNowMonth
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:27:12
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @return
	 */
	public static Date getDateMonth(Date date) {
		return Localization.getInstance().truncTime(date, ETimeUnit.MONTH);
	}

	/**
	 * @返回类型: Date
	 * @创建目的:得到时间的年初 ps：2016-01-01
	 * @方法名：getDateYear
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:29:08
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @return
	 */
	public static Date getDateYear(Date date) {
		return Localization.getInstance().truncTime(date, ETimeUnit.YEAR);
	}

	/**
	 * @返回类型: Date
	 * @创建目的:时间根据n来获得以前的某天或未来的某天
	 * @方法名：getPutOffByDate
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:34:08
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param n
	 *            -1：date前一天的时间； 1：date明天的时间
	 * @return
	 */
	public static Date getPutOffByDate(Date date, int n) {
		return Localization.getInstance().addDate(date, ETimeUnit.DAY, n);
	}

	/**
	 * @返回类型: Date
	 * @创建目的:时间根据n来获得以前的某天或未来的某天
	 * @方法名：getPutOffByDate2
	 * @创建人：jf
	 * @创建时间：2016-12-26下午2:59:21
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param n
	 * @return
	 */
	public static Date getPutOffByDate2(Date date, int n) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.add(Calendar.DAY_OF_MONTH, n);
		return ca.getTime();
	}

	/**
	 * @返回类型: Date
	 * @创建目的:根据n获得某个月的今天 如date为2016-12-26，n为1 得到2017-01-26。 为-1 得到 2016-11-26
	 * @方法名：getputOffByMonth
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:40:04
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param n
	 *            -1：date月份-1。 1：date月份+1
	 * @return
	 */
	public static Date getputOffByMonth(Date date, int n) {
		return Localization.getInstance().addDate(date, ETimeUnit.MONTH, n);
	}

	/**
	 * @返回类型: Date
	 * @创建目的:时间的年份往前减少n前，或加n年
	 * @方法名：getPutOffByYear
	 * @创建人：jf
	 * @创建时间：2016-12-26上午11:48:01
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param date
	 * @param n
	 *            1：2016-12-26返回2017-12-26. -1：2016-12-26返回2015-12-16
	 * @return
	 */
	public static Date getPutOffByYear(Date date, int n) {
		return Localization.getInstance().addDate(date, ETimeUnit.YEAR, n);
	}

	public static void main(String[] args) {
		Calendar ca = Calendar.getInstance();
		ca.getActualMaximum(Calendar.DATE); // 获得当月最大日期数据
		System.out.println(ca.after(new Date()));
		
		
	}

}
