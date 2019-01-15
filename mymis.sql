/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : 47.104.133.105:3306
 Source Schema         : mymis

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 15/01/2019 10:18:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称,以ROLE_开头',
  `name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色中文名称',
  `gmt_created` datetime(0) NOT NULL COMMENT '角色创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '角色修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表存储了系统中的角色，角色是权限的一种表示方法，它代表了一组系统权限，拥有某个角色的管理员可以访问（获修改）某些资源。\r\n它和菜单表menu、管理员表admin联合起来完成系统的权限控制。' ROW_FORMAT = Compact;

INSERT into role (name,name_ch,gmt_created)  VALUES ('ROLE_admin','系统管理员',now());
INSERT into role (name,name_ch,gmt_created)  VALUES ('ROLE_manager','部门经理',now());
INSERT into role (name,name_ch,gmt_created)  VALUES ('ROLE_personnel','人事专员',now());
INSERT into role (name,name_ch,gmt_created)  VALUES ('ROLE_recruiter','招聘主管',now());
INSERT into role (name,name_ch,gmt_created)  VALUES ('ROLE_performance','薪酬绩效主管',now());


-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登录密码，该密码是加密过的',
  `name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员中文名称',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_enabled` tinyint(1) NOT NULL COMMENT '1表示是，0表示否',
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像，是一个图片的url地址',
  `gmt_created` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表，存储了系统中所有的管理员信息。管理员拥有一个或者多个role表中的角色，可以访问系统中的资源。\r\n这个表与role、menu以及admin_role等表一起构建系统的权限管理功能。' ROW_FORMAT = Compact;

--注意这里的密码是pwd的加密
INSERT INTO admin ( username, password, name_ch, telephone, address, is_enabled, userface, gmt_created ) VALUES	( 'admin', '$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', '系统管理员', '010-1122334','北京', 1, 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', now( ) );
INSERT INTO admin ( username, password, name_ch, telephone, address, is_enabled, userface, gmt_created ) VALUES	( 'test1', '$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', '系统测试员1', '010-1100334','上海', 1, 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', now( ) );
INSERT INTO admin ( username, password, name_ch, telephone, address, is_enabled, userface, gmt_created ) VALUES	( 'test2', '$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', '系统测试员2', '010-1122334','广州', 1, 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', now( ) );
INSERT INTO admin ( username, password, name_ch, telephone, address, is_enabled, userface, gmt_created ) VALUES	( 'developer', '$10$9SIFu8l8asZUKxtwqrJM5ujhWarz/PMnTX44wXNsBHfpJMakWw3M6', '开发主管', '010-3344556','深圳', 1, 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', now( ) );

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称（可以是中文）',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '匹配的url',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的路径',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的前端控件名称，这里指Vue控件',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单，表明自己是子菜单。为null则表明自己没有父亲。',
  `icon_class` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应的图标，使用font-awesome的字符串表示',
  `is_enabled` tinyint(1) UNSIGNED NOT NULL COMMENT '1表示有效，0表示无效',
  `gmt_created` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单实际上控制着系统中的资源访问，一个菜单掌握的资源是指前端页面，这里存储的是前端控件的地址。\r\n一个角色role可以访问多个菜单，一个管理员admin可以拥有多个角色，因此这个管理员就可以通过角色、菜单的关联，来访问对应的页面。他也就拥有了资源的访问权限。\r\n菜单是多级关联的，上级菜单的resource为空，下级菜单则通过parent_id指明自己的父亲。\r\n\r\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '所有', '/', NULL, NULL, NULL, NULL, 1, now( ) , NULL);
INSERT INTO `menu` VALUES (2, '员工资料', '/', '/home', 'Home', 1, 'fa fa-user-circle-o', 1, now( ) , NULL);
INSERT INTO `menu` VALUES (3, '薪资管理', '/', '/home', 'Home', 1, 'fa fa-money', 1, now( ) , NULL);
INSERT INTO `menu` VALUES (4, '基本资料', '/employee/basic/**', '/emp/basic', 'EmpBasic', 2, NULL, 1,now( ) , NULL);
INSERT INTO `menu` VALUES (5, '高级资料', '/employee/advanced/**', '/emp/adv', 'EmpAdv', 2, NULL, 1, now( ) , NULL);
INSERT INTO `menu` VALUES (6, '工资账套管理', '/salary/sob/**', '/sal/sob', 'SalSob', 3, NULL, 1, now( ) , NULL);
INSERT INTO `menu` VALUES (7, '员工账套设置', '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', 3, NULL, 1, now( ) , NULL);


SET FOREIGN_KEY_CHECKS = 1;
