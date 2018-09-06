create   tablespace   pet
datafile   'c:\database\pet.dbf'
size   2m;

alter   database   datafile  'c:\database\pet.dbf'  resize   50m;

---自动增加表空间1m
alter  database   datafile   'c:\database\pet.dbf'  autoextend  on  next   1m;

--回复删除表
select  *  from  recyclebin
--恢复删除表
flashback  table      to  before   drop;

--删除用户
drop   user  pet   cascade

--创建 用户pet 并设置空间  ，付权限   
create   user   pet  identified   by  123
default  tablespace   pet
grant    connect  , resource  to  pet;

alter   user   用户   account  unlock;
--------------------------------------------------
create   table   student
(  stuno   number,
   stuname  varchar(20) not  null,
   stuage   number

)
--设置主键
alter  table student  
add constraints  pk_student_stuno  primary  key(stuno);

--设置约束
alter  table   student  
add constraints   ck_student_stuage      check(stuage >=0 and  stuage<=100);

create   table  scores
(  id  number,
   stuno  number,
   chengji  number(4,1)         
)
--设置外键
alter  table   scores 
add  constraints   fk_scores_student    foreign  key(stuno)
references   student(stuno)

 
--创建自增长
create sequence    seq_studnet
start   with  1
increment   by 1
cache 10


--sql   结构化查询语言
        --DDL 数据定义语言 create   alter   drop   add
        --DCL 数据控制语言  grant 权限 to 用户,    
                    --revoke   权限   from   用户，
        --DML 数据处理语言  （增删改数据）   insert into表名（列名，列名）values（值，值） ,delete from表名 where  条件,  update 表名 set 列=值   select  *  from  表名
              
              --插入
			insert  into   student(stuno,stuname,stuage,stupass) values(seq_student.nextval,?,?,?)
              insert   into 表名(列名，列名) values ('列值'，21)
              
              insert into  student(stuno,stuname,stuage,stuborn)
              values(seq_studnet.nextval,'df',40,to_date('2012-2-2','yyyy-mm-dd')); 
               commit;
               
               insert  into    scores(id,  stuno, chengji,cour_no)
               values(seq_scores.nextval,);
               commit                
                                      
              -- 更新
              update   表名   set 类名=‘列值’，列明=‘类名’  where  条件
              
              update   student   set stuborn=(to_date('2012-2-2','yyyy-mm-dd')) , stuage=10 ,stuname='无名' where   stuno>=3 or  stuno<=5;
              commit;
              
              --删除
              delete  from   表名  where  条件
                      
              delete  from  student   where  stuno=3
        --dql 数据查询语言  
              select   列名   ，列名 as "别名"  from   表名  
              where       非聚合函数的条件
              group  by   非聚合函数
              having      聚合函数作为条件       
              order  by   排序列   排序方式（asc升，desc降）
              
               --条件写法：
                     列明=值（<,>,<=,>=）
                     逻辑  not，or，and（where  列名=值 and  列名=值） 空值 is  null
                     常见的范围条件    （in(7782,2223,3)有限的个数   ，  between  a   and  b  a到b之间大于a小于b ，  like字符串使用，区分大小写）
                     通配符   %(0到n个任意字符)    _(一个字符)
                   
              select   stuno ,stuname as "姓 名",t.*  from  student   t            
              select   * from  emp  where  ename  like '%A%'
              select   * from  emp where empno between   7700 and  7900
              
              --  日期变成字符串
              select  ename,to_char(hiredate,'yyyy')  from  emp 
              --将nul值全部变为 0，只是将结果显示为0 ，数据库不变
              select   ename,nvl(comm,0)  from  emp
              --聚合函数（数据统计）count   sum   avg     max   min
              --分组函数group  by
              select deptno,  count(sal),avg(sal) ,max(sal),min(sal) from   emp
              group  by deptno 
              having  count(sal)>3
              order  by  min(sal) desc;
              --行合并
                  --union（去掉重复值），不去掉重复值 union  all  （并集）
                  --只显示重复的合并 (交集)  intersect
                  --删除重复的 （减集） minus 以第一个为准     只留第一个中不重复的 
              
              --列合并
                  --表关联  
                         select  *  from   course,scores  where scores.cour_no=course.id
                  --表链接 join
                     --内连接 inner  join
                           select  * from  course  inner  join   scores  on  scores.cour_no=course.id   
                     --外连接 outer   join
                          select  *   from  course    left  outer join  scores on  scores.cour_no=course.id    
                           select  *   from  emp   right  outer join  dept on  emp.deptno=dept.deptno  
                            select  *   from  emp   full  outer join  dept on  emp.deptno=dept.deptno  
                    --交叉连接
                            cross  join  
                     --存在   
                            exists
                          
              --增删的权限查询后
              select   t.*,rowid   from   student t;
              --scott/123
                 --解锁用户 account    locked
                 
                 --配 scott的查询权限给 pet，只能在scott自己的用户下付权限
                 grant   select  on   scott.emp   to   pet
                 grant   select  on   scott.dept  to  pet
                 
                 select  from  scott.emp   
                 
              --将scott  中的表复制到   pet中
              create   table  dept  as    select  * from  scott.dept  
-----------------------------

--1查询某个学科的平均分要求，所有考过该学科的
select  avg(chengji) ,name  from   scores inner join  course  on  scores.cour_no=course.id
group  by   name
order  by   avg(chengji)
 
--2 显示学生全部课程的成绩包括没考的
       --显示名字学生，科目，成绩
select  t.name, t.stuname, nvl(chengji,0) from(
select  c.name, s.stuname,stuno,c.id  from  course  c cross join (select * from student  s  where  s.stuname='aa')s
)t
left  join  scores sc  on  sc.stuno=t.stuno  and   sc.cour_no=t.id

--3 显示个年出生的学生的人数
select  count(student.stuno), to_char(stuborn,'yyyy') from   student   
group by  to_char(stuborn,'yyyy')

--4 显示学生姓名为 ab 的数学成绩
select   student.stuname, course.name ,scores.chengji from   scores,student ,course
where  scores.stuno=student.stuno and   scores.cour_no=course.id  and   student.stuname='ab'  and   course.name='数学'

--5 显示a姓学生的最高成绩及学生姓名
select   student.stuname,max(scores.chengji) from   student inner join scores on student.stuno=scores.stuno  inner  join course on    
scores.cour_no=course.id
where   stuname like 'a%'  
group  by    student.stuname

--6显示学科平均分高于80的学科名称
  select course.name  ,avg(chengji)  from  scores  inner join course on   scores.stuno=course.id
  group by   course.name 
  having    avg(chengji)>=40

--7 在一个结果中显示没有参加过英语考试和体育考试的学生人数
select   scores.cour_no , count(scores.id)   from   scores left outer  join   student    on  scores.stuno= student.stuno
where   chengji  is  null
group    by     scores.cour_no
--子查询  
         作为条件
         作为列
         作为表

--查每个人和每个科目的平均分差多少
select  stuname ,course.name ,chengji,avgchengji 平均分  from    student 
inner   join scores  on  student.stuno=scores.stuno 
inner  join  course on  scores.cour_no=course.id
 inner   join  
(
select  avg(chengji) avgchengji,course.name from    scores inner join  course on  scores.cour_no=course.id  
 group  by  course.name
)f   on   f.name= course.name


-------------------------------------
select  stuname,course.name,
(
        case  when  chengji       >30   then '通过' 
        when   chengji  > 20   then  '及格'  
         else  '不通过'  end  
)
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id


-------------排序
create   table  resultcj as
select  stuname,course.name,chengji
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id


select   stuname,
sum(case  when  name='数学'  then  chengji   else   0  end) 数学,
sum(case  when  name='美术'  then  chengji   else   0  end) 美术
from  resultcj  
group  by   stuname

--将上面的合并
select   stuname,
sum(case  when  name='数学'  then  chengji   else   0  end) 数学,
sum(case  when  name='美术'  then  chengji   else   0  end) 美术
from  
(
select  stuname,course.name,chengji
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id
)
group  by   stuname
-------------------------------------------------------------------
1 没参加数学考试的学生
select   stuname  from     student  where   student.stuno in 
 (
  select  scores.stuno   from    scores   right join course   on  scores.cour_no=course.id
  where    scores.chengji is  null  and    course.name='数学'
  )
2 某人没参加的课程名称
select course.name   from   course  inner  join   
(
 select   scores.cour_no from    scores  inner  join  student  on scores.stuno=student.stuno
 where     chengji   is  null and   student.stuname='ab'
 )t   on   t.cour_no=course.id

3 参加数学考试的人数
 select count(*) from   scores where scores.cour_no=
 (
select course.id   from     course      where   course.name='数学'
) and    chengji is not  null

4 在一张表里显示参加各科考试和没参加各科考试的人数和课程名称
  select  t.name,
           count(case   when t.name='英语' and chengji is not null then chengji else 0 end) 参加的
     from
    ( 
    select stuname,course.name,chengji  
    from    student
    left    join   scores  on  student.stuno=scores.stuno 
    inner  join   course   on   scores.cour_no=course.id
    )t
  group   by   t.name



5 显示学生张三参加过的考试的学科的总学时（显示姓名，科目，学时）


--对emp表的增删改查 

insert  into   emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) 
values(seq_emp.nextval,'jing','clerk',1111,to_date('2012-1-1','yyyy-mm-dd'),400,100,20);

update  emp  set   ename='fan',job='clerk',mgr=7900,hiredate=to_date('2012-2-2','yyyy-mm-dd'),sal=400,comm=400,deptno=10
where   empno=12;

delete   from  emp   where   empno=12

select  * from   emp   where   empno=13;






