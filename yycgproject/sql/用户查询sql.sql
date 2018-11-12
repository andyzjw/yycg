--使用外链接方法

select *
  from (
        
        select SYSUSER.id,
                SYSUSER.userid,
                SYSUSER.username,
                SYSUSER.groupid,
                SYSUSER.sysid,
                
                nvl(userjd.mc, nvl(useryy.mc, usergys.mc)) sysmc
        
          from SYSUSER
        
          left join userjd
            on SYSUSER.Sysid = userjd.id
          left join useryy
            on SYSUSER.Sysid = useryy.id
          left join usergys
            on SYSUSER.Sysid = usergys.id) sysuser
 where sysuser.sysmc like '%卫生室%'

--子查询方法
 select * from (
  select SYSUSER.id,
         SYSUSER.userid,
         SYSUSER.username,
         SYSUSER.groupid,
         SYSUSER.sysid,
         sysuser.USERSTATE,
         decode(SYSUSER.Groupid,
                '1',
                (select mc from userjd where id = sysuser.sysid),
                '2',
                (select mc from userjd where id = sysuser.sysid),
                '3',
                (select mc from useryy where id = sysuser.sysid),
                '4',
                (select mc from usergys where id = sysuser.sysid)
                ) sysmc
        
          from SYSUSER
          )sysuser 
           where sysuser.sysmc like '%卫生室%' 
          
          
          
