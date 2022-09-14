# MySQL

```sql
"mysql+mysqldb://用户名:密码@ip地址:端口号/databasename?charset=utf8mb4"
"mysql+mysqldb://huangjian:123456@localhost:3306/databasename?charset=utf8mb4"

mysql -uroot -p -h10.154.0.43 -P3341

mysql -uhuangjian -p
select * from mysql.user;

格式化输出结果
select * from mysql.user\G

select * from table_name;
select count(*) from table_name;

" 把某个数据库的所有权限，授权给某个用户
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'%';
```

