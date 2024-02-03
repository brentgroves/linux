# Authentication Issues

## references

<https://stackoverflow.com/questions/75704567/client-does-not-support-authentication-protocol-requested-by-server-error-in-bot>

## VS Code Error: ER_NOT_SUPPORTED_AUTH_MODE

NOTE: to prevent your MySQL80 service from stopping without ability to start again, you should enter your current sql name CREATE USER 'root':

CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';

Source: <https://www.youtube.com/watch?v=b4m-BpJQHGA>

To fix this error go to CMD and enter following command: mysql -u root -p

After you entered, write three commands step by step:

CREATE USER 'sqluser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'dbpass'

where you can write your parameters instead of sqluser and password

After this command executed, write

GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
And finish with

FLUSH PRIVILEGES;
