/*
Привет.
    Заходишь под op_user/op25user (я тебе ничего не давал :) )
    Выполняешь ALTER USER USER_NAME IDENTIFIED BY NEW_PASSWORD
    После этого:
    ALTER USER USER_NAME PASSWORD EXPIRE
*/


--Работает вот это:    

     ALTER USER EESMETANINA IDENTIFIED BY EESMETANINA1 PASSWORD EXPIRE ACCOUNT UNLOCK;