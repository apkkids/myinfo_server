# The server side of myinfo system.

>代码更新中

## 内容提要
1.创建mysql数据库**mymis**

2.建立系统所需的表格，并导入数据，脚本在mymis.sql中

3.

## 系统设计规范
参考《阿里巴巴Java开发手册》https://juejin.im/entry/589c173b8d6d81006c7e9f70
【强制】表必备三字段：id, gmt_create, gmt_modified。 说明：其中id必为主键，类型为unsigned bigint、单表时自增、步长为1。gmt_create, gmt_modified的类型均为date_time类型。

## 系统设计
1.设计数据库，数据库使用MySql，教程在：
https://www.liaoxuefeng.com/wiki/001508284671805d39d23243d884b8b99f440bfae87b0f4000

2.数据库设计原则：表分为几类，存储用户数据的数据表、用来进行权限控制的角色表和菜单表、
用来进行系统管理的系统用户表、各类字典表，以及它们之间的关联表。
权限控制：role（角色）、menu(菜单)、menu_role
系统管理：admin（管理员）、admin_role
字典表：nation（国家）、position（职位）、joblevel（职级）、pliticstatus（政治身份）
用户数据：employee（职员）、organization（组织，代表一个公司内部的多层组织架构）







