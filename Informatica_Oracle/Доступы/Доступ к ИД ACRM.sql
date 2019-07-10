

select * from dba_users
where USERNAME = 'ASAFANASYEV';

 
exec DBATOOLS.USAS_DOSTUP.CREATEUSER('ASAFANASYEV', 'U_410GC', 'ROL_ACRMUSER', 'LOW_GROUP', 'PRF_USER', 0, null, 'T7219613', 1, 0);


 -- to_date('31122999','DDMMYYYY')
 
 
 
------------------------------ добавление роли если пользователь уже есть 

 -- проверяем какие роли уже есть у пользователя
    select GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTEE = 'EMARTYNOVA6';  

    exec SYS.USASDBA_ALTERUSER_ADDROLE('EMARTYNOVA6', 'ROL_ACRMUSER', 'T7182057');



------------------------------- восстановление пароля по аналогии с RB -------------------------

ALTER USER AVINOGRADOV2 IDENTIFIED BY AVINOGRADOV24 PASSWORD EXPIRE ACCOUNT UNLOCK;





------------------------ удаление пользователя -------------------------------------
/*
call DBATOOLS.USAS_DOSTUP.DROPUSER(
'YBULEKBAEVA',
'T4810759'
);
*/


-- exec SYS.USASDBA_CREATEUSER('MSHEBALKOV', 'U_M0QB1', 'LOW_GROUP', 'PRF_USER', 0, null, 'T4319706');    архив


    select valid_until from SYS.LOGON_RULE 
    where username = 'AASIRYAN'
    and kill_flag=0;




