package com.sgcc.action.utilresource;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

public class NumberUtilResource {

	/**
	 * @返回类型: String
	 * @创建目的:格式化小数位数 最后一位四舍五入
	 * @方法名：getNumberString
	 * @创建人：jf
	 * @创建时间：2016-12-26下午3:10:49
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param num
	 *            传过来的数据 ps 21031.12， decimal #.#
	 * @return
	 */
	public static String getStringByNumber(Object num, String decimal) {
		DecimalFormat df = new DecimalFormat(decimal);
		String st = df.format(num);

		return st;
	}

	/**
	 * @返回类型: String
	 * @创建目的:格式化小数位数 ，设置最大的小数位数，是整数，返回整数，小数最后一位四舍五入
	 * @方法名：getStringByNumber
	 * @创建人：jf
	 * @创建时间：2016-12-26下午3:34:41
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param num
	 * @param decimal
	 * @return
	 */
	public static String getStringByNumber(Object num, int decimal) {
		NumberFormat format = NumberFormat.getNumberInstance();
		format.setMaximumFractionDigits(decimal); // decimal为 显示的数字位数
		// format.setMinimumFractionDigits(2);
		return format.format(num);
	}

	/**
	 * @返回类型: Number
	 * @创建目的:将double等类型格式化小数并返回double等格式化前的类型
	 * @方法名：getNumberByObject
	 * @创建人：jf
	 * @创建时间：2016-12-26下午3:27:02
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param num
	 *            2153
	 * @param decimal
	 *            #.##
	 * @return
	 */
	public static Number getNumberByObject(Object num, String decimal) {
		DecimalFormat df = new DecimalFormat(decimal);

		;
		try {
			return df.parse(df.format(num));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @创建目的:将各类型转化为String
	 * @返回类型: String
	 * @方法名：getObjectBy
	 * @创建人：jf
	 * @创建时间：2016-12-26下午3:46:35
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param num
	 * @return
	 */
	public static String getObjectBy(Object num) {
		return String.valueOf(num);
	}

	/**
	 * @创建目的: 将Long 转化为long
	 * @返回类型: long
	 * @方法名：getLong
	 * @创建人：jf
	 * @创建时间：2016-12-26下午4:12:36
	 * @修改人：
	 * @修改内容：
	 * @修改备注：
	 * @param lon
	 * @return
	 */
	public static long getLong(Long lon) {
		if (lon != null) {
			return Long.parseLong(lon.toString());
		} else {
			return 0;
		}
	}

	public static void main(String[] args) {
		// String.format("%.4f",1654.2156456); // String 格式化小数，4f保留四位，2f保留两位小数
		// 注意，后面的数字必须是小数才能格式化
	}
}
