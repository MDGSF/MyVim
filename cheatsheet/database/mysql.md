# MySQL

```sql
# ubuntu 安装 mysql
sudo apt-get install mysql-server
# 第一次登录配置，不用密码，直接回车
sudo mysql -u root -p
# 显示所有的数据库
> show databases;
# 查看 mysql 版本
> select version();
# 修改 root 用户的密码
> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<password>';
> flush privileges;

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

