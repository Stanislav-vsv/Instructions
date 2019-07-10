
-- проверка существования пользователя

    select * from dba_users
    where USERNAME = 'PMALCHIK';

-- проверить срок действия доступа

    select valid_until from SYS.LOGON_RULE 
    where username = 'PMALCHIK'
    and kill_flag=0;


--  восстановление пароля

    alter user PMALCHIK identified by PMALCHIK3 password expire account unlock;
    
    
    
  