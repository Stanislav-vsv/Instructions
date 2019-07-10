
 ------------------------ новая версия от 05.12.2014 ------------------------  SRozanov

select * from dba_users
where USERNAME = 'MYMIKHAYLOV';  


           -- создание пользователя и сразу добавление роли
call DBATOOLS.USAS_DOSTUP.CREATEUSER (
'ASHILYAEVA',
'U_M0TFK%',
'ROL_CORE_TECHNOLOGIST',
'GRP_USER',
'PRF_USER',
1000,
null  , -- to_date('22032019','ddmmyyyy') 22.03.2019
'T7209259',
0,
0
);

-- добавление роли если пользователь уже есть
            
    -- проверяем какие роли уже есть у пользователя
    select GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTEE = 'MYMIKHAYLOV';  
    
    
    call DBATOOLS.USAS_DOSTUP.ADDROLE(
    'DSUKHANOV',
    'ROL_CORE_TECHNOLOGIST',
    null ,                                       -- to_date('12102018','ddmmyyyy') ,  11.04.2018    
    'T7163124'
    );


       -- Администратор Ядра DWH 

call DBATOOLS.USAS_DOSTUP.CREATEUSER(
'PTORSHIN', 
'U_061KP%', 
'ROL_SUPPORT',
'GRP_SUPPORT',
'PRF_SUPPORT',
1000, 
null,  -- to_date('02022016','ddmmyyyy')  19.02.2016 
'T7197694',
0,
0
);




/*        -- Эксперт производительности
call DBATOOLS.USAS_DOSTUP.CREATEUSER(
'VSTEPANYAN', 
'U_M0SL6', 
'ROL_CORE_PRODUCTIVITY',
'GRP_PERFMANAGER',
'PRF_PERFMANAGER',
1000, 
null, -- to_date('04122016','ddmmyyyy')  04.12.2016 
'T5908009',
0,
0
);
*/


            
 ------------ сброс пароля  --------------

/*ALTER USER ASHABANOV IDENTIFIED BY ASHABANOV2 PASSWORD EXPIRE ACCOUNT UNLOCK;*/



------------------------ удаление пользователя -------------------------------------

/*call DBATOOLS.USAS_DOSTUP.DROPUSER(
'YNOSOV',
'T5848069'
);*/

------------------ удаление роли у пользователя --------------------------    
/*call DBATOOLS.USAS_DOSTUP.DROPROLE(
'VLYANDRES',
'ROL_CORE_RESPDEVELOPER',
'T6364661'
); */


             ------------- создание пользователя  (проверка, создание и добавление роли)----------------

select * from dba_users
where USERNAME = 'ADOLKART';  


call DBATOOLS.USASDBA_CREATEUSER('SSTRELTSOV', 'U_M0N7Y', 'GRP_USER', 'PRF_USER', 0, NULL, 'T4197278');

call DBATOOLS.USASDBA_ALTERUSER_ADDROLE('RAKADYROV', 'ROL_CORE_DEVELOPER', 'T4227324');

--to_date('20161230','yyyymmdd')       09.12.2015 




    ------------- для продления доступа добавлем роль с новой датой     16.01.2018     to_date('24012019','ddmmyyyy')
                    call DBATOOLS.USAS_DOSTUP.ADDROLE('EDUNAEVA', 'ROL_CORE_TECHNOLOGIST', null, 'T7119487');   
                
     ------- и проверяем в таблице пользователей что дата поменялась  столбец VALID_UNTIL_DATE
                    select VALID_UNTIL from SYS.LOGON_RULE 
                    where username = 'EDUNAEVA'
                    and kill_flag=0;
                    
                    select * from dba_users
                    where USERNAME = 'ENLOBANOVA';                                         
                    
                    
       /*           
             select * from SYS.LOGON_RULE 
             where username = 'NSTRUZHKIN'
             and kill_flag=0;
               
             update  SYS.LOGON_RULE
             set OSUSER = 'U_M0U24'
             where username = 'ASHABANOV'
             and kill_flag=0;                     
       */  
         

    ------------- для продления доступа : --------------------------

        /*update DBATOOLS.SESSION_AUDIT_params set valid_until_date=to_date('20160130','yyyymmdd') where usernamex='ADOBROGORSKIY';
        commit; */        

     -- ( для этого надо отдельно зайти OP_USER-ом т.к. у моей учетки нехватает прав на это )

    --update DBATOOLS.SESSION_AUDIT_params set valid_until_date='23.04.2016' where usernamex='EANDREEVA';
    --commit;

 

   --   ОСОБОЕ создание пользователя и сразу добавление роли ( Щербаков А. )
        
        select * from dba_users
        where USERNAME = 'ASHEVCHENKO2';
        
          -- проверяем какие роли уже есть у пользователя
        select GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTEE = 'ASHEVCHENKO2';  
        
        
        call DBATOOLS.USAS_DOSTUP.CREATEUSER(
        'ASHEVCHENKO2',
        'U_M0YNX%',
        'ROL_CORE_RESPDEVELOPER',
        'GRP_USER',
        'PRF_ATC',
        1000, 
        to_date('08022019','ddmmyyyy') ,  -- to_date('24082018','ddmmyyyy') 16.01.2018 
        'T7083371',
        0,
        0
        );
       
        
                  -- добавление роли Ответственный разработчик ФВ
        call DBATOOLS.USAS_DOSTUP.ADDROLE(
        'NPOLUEKTOVA',
        'ROL_CORE_RESPDEVELOPER',
        to_date('18122018','ddmmyyyy'),                                        --to_date('24012019','ddmmyyyy'),  13.10.2017 
        'T6962858'
        );  
        
        
        