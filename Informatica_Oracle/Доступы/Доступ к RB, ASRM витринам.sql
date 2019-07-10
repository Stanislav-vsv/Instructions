
select u_m07ex.FIND_USER('T7300768') from dual;                                                                                                -- постоянно: to_date('31122999','DDMMYYYY')

select * from dba_users
where USERNAME = 'MYMIKHAYLOV';  -- MYMIKHAYLOV  -- U_M0YR6


exec DBATOOLS.USAS_DOSTUP.CREATEUSER('U_M0YR6', 'U_M0YR6', 'ROL_ACRM_TECHNOLOGIST', 'GRP_USER', 'PRF_USER', 1024, to_date('31122999','DDMMYYYY'), 'T7300768', 1, 1, 'M');

-- старый вариант
 exec DBATOOLS.USAS_DOSTUP.CREATEUSER('MYMIKHAYLOV', 'U_M0YR6', 'ROL_ACRM_TECHNOLOGIST', 'GRP_USER', 'PRF_USER', 1024, null , 'T7300768', 1, 0 );   


-- Роль: Администратор:   
exec DBATOOLS.USAS_DOSTUP.CREATEUSER('U_M0YY4', 'U_M0YY4', 'ROL_SUPPORT', 'GRP_SUPPORT', 'PRF_SUPPORT', 1024, to_date('31122999','DDMMYYYY'), 'T7191317', 1, 1, 'M' );   
 -- to_date('28092018','DDMMYYYY')   


-- добавление роли (обновление срока действия, на поле  account_status не обращать внимание, если не LOCED)    to_date('04092018','DDMMYYYY')  28.12.2017
    
    -- проверяем какие роли уже есть у пользователя
    select GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTEE = 'MYMIKHAYLOV';  
    

    exec DBATOOLS.USAS_DOSTUP.ADDROLE('U_M0TFK', 'ROL_COLL_TECHNOLOGIST', to_date('31122999','DDMMYYYY'), 'T7212739');     --  13.02.2018         to_date('24102017','DDMMYYYY')


------------------ удаление роли у пользователя --------------------------    
   /* call DBATOOLS.USAS_DOSTUP.DROPROLE(
    'U_M0X8H',
    'ROL_ACRM_TECHNOLOGIST',
    'T6817799'
    ); */

-- проверка срока действия - VALID_UNTIL  
    select USERNAME, VALID_UNTIL from SYS.LOGON_RULE 
    where username = 'VKRUPINSKIY'
    and kill_flag=0;
    
    
-- Администратор
    exec DBATOOLS.USAS_DOSTUP.CREATEUSER('NANTONYEVA', 'U_M0U33', 'ROL_SUPPORT', 'GRP_SUPPORT', 'PRF_SUPPORT', 1024, null , 'T6074038', 1, 0 );     

-- роль ROL_SUPPORT_DANGER
    exec DBATOOLS.USAS_DOSTUP.ADDROLE('SKONYUSHENKO', 'ROL_SUPPORT_DANGER', null, 'T6033166');



-- логи сессий пользователя, под какими учетками
select * from SYS.LOGON_LOG
where username in ('NANTONYEVA')
or username like '%U_M0U33%'
order by 1 desc;

select * from SYS.LOGON_RULE
where username in ('NANTONYEVA')
or username like '%U_M0U33%';




     ------------- для продления доступа : --------------------------
     
     -- ( у меня не хватает прав )
    /* update SYS.SESSION_AUDIT_params set valid_until_date='30.04.2016' where usernamex='EKADYROVA';
        commit;

    -- проверить срок действия доступа

        select * from SYS.SESSION_AUDIT 
        where usernamex = 'AGRUDZINSKIY'
        and to_kill=0;
        
        -- можно продлить так (Юля от 05.05.2015):
        
        exec SYS.USAS_DOSTUP.CREATEUSER('EKADYROVA', 'U_M07XE', 'ROL_COLL_ANALYTURR','GRP_USER', 'PRF_USER', 0, to_date('30042016','DDMMYYYY'), 'T4582298',0);*/
        
        


