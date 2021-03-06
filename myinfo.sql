/*
Navicat MySQL Data Transfer

Source Server         : dev
Source Server Version : 50640
Source Host           : 47.104.133.105:3306
Source Database       : myinfo

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-11-07 21:45:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, null, '所有', null, null, null, null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '薪资管理', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('6', '/', '/home', 'Home', '系统管理', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('7', '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', null, null, '1', '2', '0');
INSERT INTO `menu` VALUES ('9', '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', null, null, '1', '3', '0');
INSERT INTO `menu` VALUES ('10', '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('11', '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('12', '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('13', '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('14', '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('15', '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('16', '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('17', '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('18', '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('19', '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('20', '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('21', '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('22', '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('23', '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('24', '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('25', '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('26', '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('27', '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('28', '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', null, null, '1', '6', '1');

-- ----------------------------
-- Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`menu_id`),
  KEY `rid` (`role_id`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('161', '7', '3');
INSERT INTO `menu_role` VALUES ('162', '7', '6');
INSERT INTO `menu_role` VALUES ('163', '9', '6');
INSERT INTO `menu_role` VALUES ('164', '10', '6');
INSERT INTO `menu_role` VALUES ('165', '11', '6');
INSERT INTO `menu_role` VALUES ('166', '12', '6');
INSERT INTO `menu_role` VALUES ('167', '13', '6');
INSERT INTO `menu_role` VALUES ('168', '14', '6');
INSERT INTO `menu_role` VALUES ('169', '15', '6');
INSERT INTO `menu_role` VALUES ('170', '16', '6');
INSERT INTO `menu_role` VALUES ('171', '17', '6');
INSERT INTO `menu_role` VALUES ('172', '18', '6');
INSERT INTO `menu_role` VALUES ('173', '19', '6');
INSERT INTO `menu_role` VALUES ('174', '20', '6');
INSERT INTO `menu_role` VALUES ('175', '21', '6');
INSERT INTO `menu_role` VALUES ('176', '22', '6');
INSERT INTO `menu_role` VALUES ('177', '23', '6');
INSERT INTO `menu_role` VALUES ('178', '25', '6');
INSERT INTO `menu_role` VALUES ('179', '26', '6');
INSERT INTO `menu_role` VALUES ('180', '27', '6');
INSERT INTO `menu_role` VALUES ('181', '28', '6');
INSERT INTO `menu_role` VALUES ('182', '24', '6');
INSERT INTO `menu_role` VALUES ('247', '7', '4');
INSERT INTO `menu_role` VALUES ('248', '8', '4');
INSERT INTO `menu_role` VALUES ('249', '11', '4');
INSERT INTO `menu_role` VALUES ('250', '7', '2');
INSERT INTO `menu_role` VALUES ('251', '8', '2');
INSERT INTO `menu_role` VALUES ('252', '9', '2');
INSERT INTO `menu_role` VALUES ('253', '10', '2');
INSERT INTO `menu_role` VALUES ('254', '12', '2');
INSERT INTO `menu_role` VALUES ('255', '13', '2');
INSERT INTO `menu_role` VALUES ('256', '7', '1');
INSERT INTO `menu_role` VALUES ('257', '8', '1');
INSERT INTO `menu_role` VALUES ('258', '9', '1');
INSERT INTO `menu_role` VALUES ('259', '10', '1');
INSERT INTO `menu_role` VALUES ('260', '11', '1');
INSERT INTO `menu_role` VALUES ('261', '12', '1');
INSERT INTO `menu_role` VALUES ('262', '13', '1');
INSERT INTO `menu_role` VALUES ('263', '14', '1');
INSERT INTO `menu_role` VALUES ('264', '15', '1');
INSERT INTO `menu_role` VALUES ('265', '16', '1');
INSERT INTO `menu_role` VALUES ('266', '17', '1');
INSERT INTO `menu_role` VALUES ('267', '18', '1');
INSERT INTO `menu_role` VALUES ('268', '19', '1');
INSERT INTO `menu_role` VALUES ('269', '20', '1');
INSERT INTO `menu_role` VALUES ('270', '21', '1');
INSERT INTO `menu_role` VALUES ('271', '22', '1');
INSERT INTO `menu_role` VALUES ('272', '23', '1');
INSERT INTO `menu_role` VALUES ('273', '24', '1');
INSERT INTO `menu_role` VALUES ('274', '25', '1');
INSERT INTO `menu_role` VALUES ('275', '26', '1');
INSERT INTO `menu_role` VALUES ('276', '27', '1');
INSERT INTO `menu_role` VALUES ('277', '28', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_manager', '部门经理');
INSERT INTO `role` VALUES ('2', 'ROLE_personnel', '人事专员');
INSERT INTO `role` VALUES ('3', 'ROLE_recruiter', '招聘主管');
INSERT INTO `role` VALUES ('4', 'ROLE_train', '培训主管');
INSERT INTO `role` VALUES ('5', 'ROLE_performance', '薪酬绩效主管');
INSERT INTO `role` VALUES ('6', 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES ('13', 'ROLE_test2', '测试角色2');
INSERT INTO `role` VALUES ('14', 'ROLE_test1', '测试角色1');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('3', '系统管理员', '18568887789', '029-82881234', '深圳南山', '1', 'admin', '$2a$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', null);
INSERT INTO `sysuser` VALUES ('5', '李白', '18568123489', '029-82123434', '海口美兰', '1', 'libai', '$2a$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', null);
INSERT INTO `sysuser` VALUES ('10', '韩愈', '18568123666', '029-82111555', '广州番禺', '1', 'hanyu', '$2a$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', null);
INSERT INTO `sysuser` VALUES ('11', '柳宗元', '18568123377', '029-82111333', '广州天河', '1', 'liuzongyuan', '$2a$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', null);
INSERT INTO `sysuser` VALUES ('12', '曾巩', '18568128888', '029-82111222', '广州越秀', '1', 'zenggong', '$2a$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', null);

-- ----------------------------
-- Table structure for `sysuser_role`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser_role`;
CREATE TABLE `sysuser_role` (
  `id` int(11) NOT NULL,
  `sysuser_id` int(11) NOT NULL COMMENT '指向sysuser的id',
  `role_id` int(11) NOT NULL COMMENT '指向role的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser_role
-- ----------------------------
INSERT INTO `sysuser_role` VALUES ('1', '3', '6');
INSERT INTO `sysuser_role` VALUES ('2', '3', '13');
INSERT INTO `sysuser_role` VALUES ('3', '5', '1');
INSERT INTO `sysuser_role` VALUES ('4', '5', '4');
INSERT INTO `sysuser_role` VALUES ('5', '12', '2');
INSERT INTO `sysuser_role` VALUES ('6', '12', '3');
INSERT INTO `sysuser_role` VALUES ('7', '12', '4');
INSERT INTO `sysuser_role` VALUES ('8', '10', '3');
INSERT INTO `sysuser_role` VALUES ('9', '10', '4');
INSERT INTO `sysuser_role` VALUES ('10', '11', '2');
INSERT INTO `sysuser_role` VALUES ('11', '11', '3');
INSERT INTO `sysuser_role` VALUES ('12', '11', '4');
INSERT INTO `sysuser_role` VALUES ('13', '11', '5');


-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int(8) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politicId` int(8) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int(11) DEFAULT NULL COMMENT '职称ID',
  `posId` int(11) DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int(11) DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `jobId` (`jobLevelId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `politicId` (`politicId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1519 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '5', '9', '29', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('2', '陈静', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '8', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('3', '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('4', '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('5', '姚森', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('6', '云星', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('7', '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('8', '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('9', '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('10', '张洁', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('11', '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '91', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('12', '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('13', '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('14', '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('15', '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('16', '云星2', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('17', '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('18', '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('19', '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('20', '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('21', '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('22', '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('24', '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('25', '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('26', '云星3', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('27', '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('28', '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('29', '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('31', '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('32', '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('33', '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('34', '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('35', '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('36', '云星4', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('37', '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('38', '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('39', '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('40', '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('41', '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('42', '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('43', '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('44', '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('45', '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('46', '云星5', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('47', '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('48', '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('49', '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('50', '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('51', '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('52', '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('53', '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('54', '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('55', '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('56', '云星6', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1351', '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1352', '陈静', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1353', '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1354', '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1355', '姚森', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1357', '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1358', '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1359', '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1360', '张洁', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1361', '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1362', '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1363', '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1364', '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1365', '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1366', '云星2', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1367', '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1368', '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1369', '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1370', '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1371', '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1372', '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1373', '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1374', '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1375', '云星3', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1376', '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1377', '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1378', '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1379', '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1380', '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1381', '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1382', '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1383', '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1384', '云星4', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1385', '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1411', '谢工', '女', '1970-01-01', '618177197001011234', '离异', '1', '江苏', '1', '584991843@qq.com', '18558887788', '北京', '91', '12', '29', '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', '5', '2019-01-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `employee` VALUES ('1412', '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', '1', '广东', '13', '584991843@qq.com', '16767776654', '广东深圳', '91', '15', '33', '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', '5', '2018-04-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `employee` VALUES ('1413', '11', '男', '2018-01-01', '610122201801011234', '已婚', '1', '1', '1', '584991843@qq.com', '111', '1', '89', '9', '29', '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', '4', '2018-04-01', null, '2018-01-01', '2022-01-26', null);
INSERT INTO `employee` VALUES ('1414', '1', '男', '2018-01-01', '610188199809091234', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '89', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', '1', '2018-01-31', null, '2018-01-31', '2019-01-31', null);
INSERT INTO `employee` VALUES ('1415', '1', '男', '2018-01-01', '610122199909090000', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '78', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', '1', '2018-01-31', null, '2018-01-31', '2019-01-31', null);
INSERT INTO `employee` VALUES ('1416', '1', '男', '2018-01-01', '610122199909090000', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '81', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', '0', '2018-01-31', null, '2018-01-31', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1417', '1', '男', '2018-01-01', '610122199909099999', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '87', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', '0', '2018-01-01', null, '2018-01-01', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1418', '1', '男', '2018-01-01', '610122199909099999', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '78', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', '0', '2018-01-01', null, '2018-01-01', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1419', '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', '1', '1', '1', '584991843@qq.com', '1', '1', '8', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', '0', '2018-01-31', null, '2018-01-31', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1420', '1', '男', '2018-01-01', '610122199909091234', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '8', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', '0', '2018-01-31', null, '2018-01-31', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1421', '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '5', '9', '29', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', '2', null, null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('1422', '陈静', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '8', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1423', '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1424', '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1425', '姚森', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1426', '云星', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1427', '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1428', '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1429', '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1430', '张洁', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1431', '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '91', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1432', '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1433', '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1434', '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1435', '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1436', '云星2', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1437', '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1438', '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1439', '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1440', '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1441', '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1442', '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1443', '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1444', '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1445', '云星3', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1446', '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1447', '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1448', '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1449', '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1450', '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1451', '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1452', '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1453', '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1454', '云星4', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1455', '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1456', '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1457', '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1458', '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1459', '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1460', '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1461', '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1462', '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1463', '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1464', '云星5', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1465', '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1466', '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1467', '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1468', '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1469', '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1470', '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1471', '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1472', '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1473', '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1474', '云星6', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1475', '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1476', '陈静', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1477', '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1478', '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1479', '姚森', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1480', '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1481', '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1482', '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1483', '张洁', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1484', '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1485', '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1486', '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1487', '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1488', '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1489', '云星2', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1490', '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1491', '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1492', '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1493', '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南', '5', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '92', '16', '34', '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1494', '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1495', '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1496', '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1497', '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1498', '云星3', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1499', '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1500', '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东', '6', 'zhangliming@qq.com', '18979994478', '广东珠海', '91', '15', '33', '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('1501', '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', '1', '陕西西安', '13', 'xuelei@qq.com', '15648887741', '西安市雁塔区', '92', '14', '34', '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1502', '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', '1', '陕西', '13', 'laowang@qq.com', '18565558897', '深圳市南山区', '8', '9', '29', '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('1503', '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '82', '12', '30', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('1504', '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西', '3', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '91', '12', '33', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1505', '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '92', '12', '34', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('1506', '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', '1', '河南', '3', 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', '92', '15', '34', '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('1507', '云星4', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '1', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '92', '16', '34', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1508', '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东广州', '4', 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', '78', '15', '33', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('1509', '谢工', '女', '1970-01-01', '618177197001011234', '离异', '1', '江苏', '1', '584991843@qq.com', '18558887788', '北京', '91', '12', '29', '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', '5', null, null, '2018-01-01', '2023-01-01', null);
INSERT INTO `employee` VALUES ('1510', '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', '1', '广东', '13', '584991843@qq.com', '16767776654', '广东深圳', '91', '15', '33', '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', '5', null, null, '2018-01-01', '2023-01-01', null);
INSERT INTO `employee` VALUES ('1511', '11', '男', '2018-01-01', '610122201801011234', '已婚', '1', '1', '1', '584991843@qq.com', '111', '1', '89', '9', '29', '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', '4', null, null, '2018-01-01', '2022-01-26', null);
INSERT INTO `employee` VALUES ('1512', '1', '男', '2018-01-01', '610188199809091234', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '89', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', '1', null, null, '2018-01-31', '2019-01-31', null);
INSERT INTO `employee` VALUES ('1513', '1', '男', '2018-01-01', '610122199909090000', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '78', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', '1', null, null, '2018-01-31', '2019-01-31', null);
INSERT INTO `employee` VALUES ('1514', '1', '男', '2018-01-01', '610122199909090000', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '81', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', '0', null, null, '2018-01-31', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1515', '1', '男', '2018-01-01', '610122199909099999', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '87', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', '0', null, null, '2018-01-01', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1516', '1', '男', '2018-01-01', '610122199909099999', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '78', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', '0', null, null, '2018-01-01', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1517', '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', '1', '1', '1', '584991843@qq.com', '1', '1', '8', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', '0', null, null, '2018-01-31', '2018-01-31', null);
INSERT INTO `employee` VALUES ('1518', '1', '男', '2018-01-01', '610122199909091234', '已婚', '1', '1', '1', '584991843@qq.com', '1', '1', '8', '9', '29', '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', '0', null, null, '2018-01-31', '2018-01-31', null);

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '蒙古族');
INSERT INTO `nation` VALUES (3, '回族');
INSERT INTO `nation` VALUES (4, '藏族');
INSERT INTO `nation` VALUES (5, '维吾尔族');
INSERT INTO `nation` VALUES (6, '苗族');
INSERT INTO `nation` VALUES (7, '彝族');
INSERT INTO `nation` VALUES (8, '壮族');
INSERT INTO `nation` VALUES (9, '布依族');
INSERT INTO `nation` VALUES (10, '朝鲜族');
INSERT INTO `nation` VALUES (11, '满族');
INSERT INTO `nation` VALUES (12, '侗族');
INSERT INTO `nation` VALUES (13, '瑶族');
INSERT INTO `nation` VALUES (14, '白族');
INSERT INTO `nation` VALUES (15, '土家族');
INSERT INTO `nation` VALUES (16, '哈尼族');
INSERT INTO `nation` VALUES (17, '哈萨克族');
INSERT INTO `nation` VALUES (18, '傣族');
INSERT INTO `nation` VALUES (19, '黎族');
INSERT INTO `nation` VALUES (20, '傈僳族');
INSERT INTO `nation` VALUES (21, '佤族');
INSERT INTO `nation` VALUES (22, '畲族');
INSERT INTO `nation` VALUES (23, '高山族');
INSERT INTO `nation` VALUES (24, '拉祜族');
INSERT INTO `nation` VALUES (25, '水族');
INSERT INTO `nation` VALUES (26, '东乡族');
INSERT INTO `nation` VALUES (27, '纳西族');
INSERT INTO `nation` VALUES (28, '景颇族');
INSERT INTO `nation` VALUES (29, '柯尔克孜族');
INSERT INTO `nation` VALUES (30, '土族');
INSERT INTO `nation` VALUES (31, '达斡尔族');
INSERT INTO `nation` VALUES (32, '仫佬族');
INSERT INTO `nation` VALUES (33, '羌族');
INSERT INTO `nation` VALUES (34, '布朗族');
INSERT INTO `nation` VALUES (35, '撒拉族');
INSERT INTO `nation` VALUES (36, '毛难族');
INSERT INTO `nation` VALUES (37, '仡佬族');
INSERT INTO `nation` VALUES (38, '锡伯族');
INSERT INTO `nation` VALUES (39, '阿昌族');
INSERT INTO `nation` VALUES (40, '普米族');
INSERT INTO `nation` VALUES (41, '塔吉克族');
INSERT INTO `nation` VALUES (42, '怒族');
INSERT INTO `nation` VALUES (43, '乌孜别克族');
INSERT INTO `nation` VALUES (44, '俄罗斯族');
INSERT INTO `nation` VALUES (45, '鄂温克族');
INSERT INTO `nation` VALUES (46, '崩龙族');
INSERT INTO `nation` VALUES (47, '保安族');
INSERT INTO `nation` VALUES (48, '裕固族');
INSERT INTO `nation` VALUES (49, '京族');
INSERT INTO `nation` VALUES (50, '塔塔尔族');
INSERT INTO `nation` VALUES (51, '独龙族');
INSERT INTO `nation` VALUES (52, '鄂伦春族');
INSERT INTO `nation` VALUES (53, '赫哲族');
INSERT INTO `nation` VALUES (54, '门巴族');
INSERT INTO `nation` VALUES (55, '珞巴族');
INSERT INTO `nation` VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位',
  `createDate` timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (29, '技术总监', '2018-01-11 21:13:42', 1);
INSERT INTO `position` VALUES (30, '运营总监', '2018-01-11 21:13:48', 1);
INSERT INTO `position` VALUES (31, '市场总监', '2018-01-11 21:13:56', 1);
INSERT INTO `position` VALUES (32, '总经理', '2018-01-11 21:35:07', 1);
INSERT INTO `position` VALUES (33, '研发工程师', '2018-01-14 16:07:11', 1);
INSERT INTO `position` VALUES (34, '运维工程师', '2018-01-14 16:11:41', 1);