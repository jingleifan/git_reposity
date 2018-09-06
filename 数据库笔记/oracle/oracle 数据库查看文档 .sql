create   tablespace   pet
datafile   'c:\database\pet.dbf'
size   2m;

alter   database   datafile  'c:\database\pet.dbf'  resize   50m;

---�Զ����ӱ�ռ�1m
alter  database   datafile   'c:\database\pet.dbf'  autoextend  on  next   1m;

--�ظ�ɾ����
select  *  from  recyclebin
--�ָ�ɾ����
flashback  table      to  before   drop;

--ɾ���û�
drop   user  pet   cascade

--���� �û�pet �����ÿռ�  ����Ȩ��   
create   user   pet  identified   by  123
default  tablespace   pet
grant    connect  , resource  to  pet;

alter   user   �û�   account  unlock;
--------------------------------------------------
create   table   student
(  stuno   number,
   stuname  varchar(20) not  null,
   stuage   number

)
--��������
alter  table student  
add constraints  pk_student_stuno  primary  key(stuno);

--����Լ��
alter  table   student  
add constraints   ck_student_stuage      check(stuage >=0 and  stuage<=100);

create   table  scores
(  id  number,
   stuno  number,
   chengji  number(4,1)         
)
--�������
alter  table   scores 
add  constraints   fk_scores_student    foreign  key(stuno)
references   student(stuno)

 
--����������
create sequence    seq_studnet
start   with  1
increment   by 1
cache 10


--sql   �ṹ����ѯ����
        --DDL ���ݶ������� create   alter   drop   add
        --DCL ���ݿ�������  grant Ȩ�� to �û�,    
                    --revoke   Ȩ��   from   �û���
        --DML ���ݴ�������  ����ɾ�����ݣ�   insert into������������������values��ֵ��ֵ�� ,delete from���� where  ����,  update ���� set ��=ֵ   select  *  from  ����
              
              --����
			insert  into   student(stuno,stuname,stuage,stupass) values(seq_student.nextval,?,?,?)
              insert   into ����(����������) values ('��ֵ'��21)
              
              insert into  student(stuno,stuname,stuage,stuborn)
              values(seq_studnet.nextval,'df',40,to_date('2012-2-2','yyyy-mm-dd')); 
               commit;
               
               insert  into    scores(id,  stuno, chengji,cour_no)
               values(seq_scores.nextval,);
               commit                
                                      
              -- ����
              update   ����   set ����=����ֵ��������=��������  where  ����
              
              update   student   set stuborn=(to_date('2012-2-2','yyyy-mm-dd')) , stuage=10 ,stuname='����' where   stuno>=3 or  stuno<=5;
              commit;
              
              --ɾ��
              delete  from   ����  where  ����
                      
              delete  from  student   where  stuno=3
        --dql ���ݲ�ѯ����  
              select   ����   ������ as "����"  from   ����  
              where       �ǾۺϺ���������
              group  by   �ǾۺϺ���
              having      �ۺϺ�����Ϊ����       
              order  by   ������   ����ʽ��asc����desc����
              
               --����д����
                     ����=ֵ��<,>,<=,>=��
                     �߼�  not��or��and��where  ����=ֵ and  ����=ֵ�� ��ֵ is  null
                     �����ķ�Χ����    ��in(7782,2223,3)���޵ĸ���   ��  between  a   and  b  a��b֮�����aС��b ��  like�ַ���ʹ�ã����ִ�Сд��
                     ͨ���   %(0��n�������ַ�)    _(һ���ַ�)
                   
              select   stuno ,stuname as "�� ��",t.*  from  student   t            
              select   * from  emp  where  ename  like '%A%'
              select   * from  emp where empno between   7700 and  7900
              
              --  ���ڱ���ַ���
              select  ename,to_char(hiredate,'yyyy')  from  emp 
              --��nulֵȫ����Ϊ 0��ֻ�ǽ������ʾΪ0 �����ݿⲻ��
              select   ename,nvl(comm,0)  from  emp
              --�ۺϺ���������ͳ�ƣ�count   sum   avg     max   min
              --���麯��group  by
              select deptno,  count(sal),avg(sal) ,max(sal),min(sal) from   emp
              group  by deptno 
              having  count(sal)>3
              order  by  min(sal) desc;
              --�кϲ�
                  --union��ȥ���ظ�ֵ������ȥ���ظ�ֵ union  all  ��������
                  --ֻ��ʾ�ظ��ĺϲ� (����)  intersect
                  --ɾ���ظ��� �������� minus �Ե�һ��Ϊ׼     ֻ����һ���в��ظ��� 
              
              --�кϲ�
                  --�����  
                         select  *  from   course,scores  where scores.cour_no=course.id
                  --������ join
                     --������ inner  join
                           select  * from  course  inner  join   scores  on  scores.cour_no=course.id   
                     --������ outer   join
                          select  *   from  course    left  outer join  scores on  scores.cour_no=course.id    
                           select  *   from  emp   right  outer join  dept on  emp.deptno=dept.deptno  
                            select  *   from  emp   full  outer join  dept on  emp.deptno=dept.deptno  
                    --��������
                            cross  join  
                     --����   
                            exists
                          
              --��ɾ��Ȩ�޲�ѯ��
              select   t.*,rowid   from   student t;
              --scott/123
                 --�����û� account    locked
                 
                 --�� scott�Ĳ�ѯȨ�޸� pet��ֻ����scott�Լ����û��¸�Ȩ��
                 grant   select  on   scott.emp   to   pet
                 grant   select  on   scott.dept  to  pet
                 
                 select  from  scott.emp   
                 
              --��scott  �еı��Ƶ�   pet��
              create   table  dept  as    select  * from  scott.dept  
-----------------------------

--1��ѯĳ��ѧ�Ƶ�ƽ����Ҫ�����п�����ѧ�Ƶ�
select  avg(chengji) ,name  from   scores inner join  course  on  scores.cour_no=course.id
group  by   name
order  by   avg(chengji)
 
--2 ��ʾѧ��ȫ���γ̵ĳɼ�����û����
       --��ʾ����ѧ������Ŀ���ɼ�
select  t.name, t.stuname, nvl(chengji,0) from(
select  c.name, s.stuname,stuno,c.id  from  course  c cross join (select * from student  s  where  s.stuname='aa')s
)t
left  join  scores sc  on  sc.stuno=t.stuno  and   sc.cour_no=t.id

--3 ��ʾ���������ѧ��������
select  count(student.stuno), to_char(stuborn,'yyyy') from   student   
group by  to_char(stuborn,'yyyy')

--4 ��ʾѧ������Ϊ ab ����ѧ�ɼ�
select   student.stuname, course.name ,scores.chengji from   scores,student ,course
where  scores.stuno=student.stuno and   scores.cour_no=course.id  and   student.stuname='ab'  and   course.name='��ѧ'

--5 ��ʾa��ѧ������߳ɼ���ѧ������
select   student.stuname,max(scores.chengji) from   student inner join scores on student.stuno=scores.stuno  inner  join course on    
scores.cour_no=course.id
where   stuname like 'a%'  
group  by    student.stuname

--6��ʾѧ��ƽ���ָ���80��ѧ������
  select course.name  ,avg(chengji)  from  scores  inner join course on   scores.stuno=course.id
  group by   course.name 
  having    avg(chengji)>=40

--7 ��һ���������ʾû�вμӹ�Ӣ�￼�Ժ��������Ե�ѧ������
select   scores.cour_no , count(scores.id)   from   scores left outer  join   student    on  scores.stuno= student.stuno
where   chengji  is  null
group    by     scores.cour_no
--�Ӳ�ѯ  
         ��Ϊ����
         ��Ϊ��
         ��Ϊ��

--��ÿ���˺�ÿ����Ŀ��ƽ���ֲ����
select  stuname ,course.name ,chengji,avgchengji ƽ����  from    student 
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
        case  when  chengji       >30   then 'ͨ��' 
        when   chengji  > 20   then  '����'  
         else  '��ͨ��'  end  
)
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id


-------------����
create   table  resultcj as
select  stuname,course.name,chengji
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id


select   stuname,
sum(case  when  name='��ѧ'  then  chengji   else   0  end) ��ѧ,
sum(case  when  name='����'  then  chengji   else   0  end) ����
from  resultcj  
group  by   stuname

--������ĺϲ�
select   stuname,
sum(case  when  name='��ѧ'  then  chengji   else   0  end) ��ѧ,
sum(case  when  name='����'  then  chengji   else   0  end) ����
from  
(
select  stuname,course.name,chengji
from   student  
left   join   scores  on  student.stuno=scores.stuno
inner join  course on  scores.cour_no=course.id
)
group  by   stuname
-------------------------------------------------------------------
1 û�μ���ѧ���Ե�ѧ��
select   stuname  from     student  where   student.stuno in 
 (
  select  scores.stuno   from    scores   right join course   on  scores.cour_no=course.id
  where    scores.chengji is  null  and    course.name='��ѧ'
  )
2 ĳ��û�μӵĿγ�����
select course.name   from   course  inner  join   
(
 select   scores.cour_no from    scores  inner  join  student  on scores.stuno=student.stuno
 where     chengji   is  null and   student.stuname='ab'
 )t   on   t.cour_no=course.id

3 �μ���ѧ���Ե�����
 select count(*) from   scores where scores.cour_no=
 (
select course.id   from     course      where   course.name='��ѧ'
) and    chengji is not  null

4 ��һ�ű�����ʾ�μӸ��ƿ��Ժ�û�μӸ��ƿ��Ե������Ϳγ�����
  select  t.name,
           count(case   when t.name='Ӣ��' and chengji is not null then chengji else 0 end) �μӵ�
     from
    ( 
    select stuname,course.name,chengji  
    from    student
    left    join   scores  on  student.stuno=scores.stuno 
    inner  join   course   on   scores.cour_no=course.id
    )t
  group   by   t.name



5 ��ʾѧ�������μӹ��Ŀ��Ե�ѧ�Ƶ���ѧʱ����ʾ��������Ŀ��ѧʱ��


--��emp�����ɾ�Ĳ� 

insert  into   emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) 
values(seq_emp.nextval,'jing','clerk',1111,to_date('2012-1-1','yyyy-mm-dd'),400,100,20);

update  emp  set   ename='fan',job='clerk',mgr=7900,hiredate=to_date('2012-2-2','yyyy-mm-dd'),sal=400,comm=400,deptno=10
where   empno=12;

delete   from  emp   where   empno=12

select  * from   emp   where   empno=13;






