--1 字符函数
--		upper 转化为大写 ，lower 转化为小写  		
		select upper(region_code) from TMR.ACQUIREDS;
	--  INITCAP 将字符串首字母大写
		select INITCAP(REGION_CODE) from tmr.acquireds;
	--	replace(列|字符串，新字符串)   使用新的字符串替换旧的字符串
		select  REPLACE(region_code,'A','-') from trm.acquireds;
	--	length(字符串)
	 	select  * from tmr.acquireds where length(REGION_CODE)=5;
	--	substr(列|字符串，开始，结束)   截取
		select substr(region_code，0,3)
	--	ascii    返回指定字符对应的十进制
		select ascii(region_code)  from duan
	--	chr   返回整数对应的字符
		select chr（100） from duan
	--  ltrim（） rtrim（） trim（） 去除字符串的左空格，右空格，左右空格
		select  trim(region_code) from tmr.acquireds
	--	rpad()   lpad()  在右，或左天空长度字符串
		select lpad(region_code,10,'*') from tmr.acquireds