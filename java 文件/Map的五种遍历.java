package com.sgcc.bean;

import java.util.HashMap;
import java.util.Iterator;




public class Map {
	
	//ConcurrentHashMap   安全的  jdk1.5以上    不用 hashtable
	java.util.Map<String, String>  map=new HashMap<String, String>();
	
	public static void main(String[] args) {

	}

	
	public void putMap() {
		map.put("1","值1");
		map.put("2","值2");
		map.put("3","值3");
		map.put("4","值4");
		map.put("5","值5");

	}
	public void  getMap1(){
		for (String Str :map.keySet()) {
			System.out.println("key="+Str+",值="+map.get(Str));
		}
	}
	public void  getMap2(){
		Iterator<java.util.Map.Entry<String, String>> it=map.entrySet().iterator();
		while (it.hasNext()) {
			java.util.Map.Entry<String, String>  entry=it.next();
			System.out.println("key="+entry.getKey()+",值="+entry.getValue());
		}
	}
	
	
	for (Iterator<Entry<Long, String>> iterator = mReqPacket.entrySet().iterator(); iterator.hasNext();) {  
		Entry<Long, String> entry = iterator.next();  
		long key = entry.getKey();  
		if (key < 10) {  
			iterator.remove();  
		}  
	}  
	
	
	
	public void  getMap3(){
		for (java.util.Map.Entry<String, String>  entry:map.entrySet()) {
			System.out.println("key="+entry.getKey()+",值="+entry.getValue());
		}
	}
	//只能得到value
	public void  getMap4(){
		for (String v:map.values()) {
			System.out.println(",值="+map);
		}
	}
}
