
--------------------------- ����� �������� �� 05.11.14 ------------------------

select * from dba_users
where USERNAME = 'ASHILYAEVA';


            -- �������� ������������ � ����� ���������� ����
call DBATOOLS.USAS_DOSTUP.CREATEUSER(
'DSUKHANOV', 
'U_M0YUX%', 
'ROL_FINDM_TECHNOLOGIST',
'GRP_USER',
'PRF_USER',
0, 
null ,  --  to_date('31072019','ddmmyyyy')
'T7169935',
0,
0
);

 -- ���������� ���� ���� ������������ ��� ����        to_date('30122017','ddmmyyyy')  11.04.2018  
    
    -- ��������� ����� ���� ��� ���� � ������������
    select GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTEE = 'APASHEVICH';  
    
        
    call DBATOOLS.USAS_DOSTUP.ADDROLE(
    'APASHEVICH',
    'ROL_FINDM_TECHNOLOGIST',
     null ,    -- to_date('09022019,'ddmmyyyy')
    'T7207978'
    );
     

         -- �������� ������������ � ���������� ���� - �������������
/*  
call DBATOOLS.USAS_DOSTUP.CREATEUSER(
'ANKRIVOSHEIN', 
'U_M0STR', 
'ROL_SUPPORT',
'GRP_SUPPORT',
'PRF_SUPPORT',
1000, 
NULL, 
'T5120223',
0,
0
);
*/


-- SET ROLE ROL_SUPPORT_DANGER IDENTIFIED BY DO#NOT$USE_THIS_ROLE;

        


    --------- ��� ��������� ������� �������� ���� � ����� �����  07.04.2017
                    call DBATOOLS.USAS_DOSTUP.ADDROLE('NEGUSEVA', 'ROL_FINDM_RESPDEVELOPER',  to_date('03062019','ddmmyyyy'), 'T6778798');
                
     ------- � ��������� � ������� ������������� ��� ���� ����������  ������� VALID_UNTIL_DATE
                    select * from SYS.LOGON_RULE 
                    where username = 'GFGROSU'
                    and kill_flag=0;   


-------------------------------------------------------------------------------------------------------------------------------------

call DBATOOLS.USASDBA_CREATEUSER('SROZANOV', 'U_00A6', 'GRP_USER', 'PRF_USER', 0, NULL, 'T4224220');

call DBATOOLS.USASDBA_ALTERUSER_ADDROLE('SROZANOV', 'ROL_FINDM_TECHNOLOGIST', 'T4224220');



--to_date('20151111','yyyymmdd')      11.11.2015 


--ROL_FINDM_RESPDEVELOPER
--ROL_FINDM_TECHNOLOGIST

