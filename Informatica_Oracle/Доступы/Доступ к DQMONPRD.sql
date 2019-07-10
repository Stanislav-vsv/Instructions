

select * from dba_users
where USERNAME = 'OSTRIGUBOVA';


--Создание пользователей с ролью 'ROL_DQMON' – роль, которую сделал Максим для всех “обычных” пользователей 

exec DBATOOLS.USAS_DOSTUP.CREATEUSER('OSTRIGUBOVA', 'U_M0K45', 'ROL_DQMON', 'ETL_GROUP', 'PRF_USER', 0, NULL, 'T5580250', 1, 0);

