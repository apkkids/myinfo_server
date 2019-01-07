# The server side of myinfo system.

>代码更新中

## 内容提要
1.创建mysql数据库**myinfo**

2.建立系统所需的表格，并导入数据，脚本在myinfo.sql中

3.

##系统设计
1.设计数据库，数据库使用MySql，教程在：
https://www.liaoxuefeng.com/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000

2.数据库设计原则：表分为几类，存储用户数据的数据表、用来进行权限控制的角色表和菜单表、
用来进行系统管理的系统用户表、各类字典表，以及它们之间的关联表。
权限控制：role、menu、menu_role
系统管理：sysuser、sysuser_role
字典表：nation（国家）、position（职位）、joblevel（职级）、pliticstatus（政治身份）
用户数据：





