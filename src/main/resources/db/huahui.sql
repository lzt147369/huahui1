/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : huahui

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2019-04-15 11:52:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0b49d5eae12e45868ffe2bd300e1deeb', '知识测试', '98222d27fc2e482a9f50212991f2df1c', '2', '98222d27fc2e482a9f50212991f2df1c,0b49d5eae12e45868ffe2bd300e1deeb,', '1', 'zhishi/ceshi', null, null, '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 15:41:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 15:41:46', null, '0');
INSERT INTO `sys_menu` VALUES ('212ae8a31da84ef89aef50337955707b', '回复', 'f46fcfc11ecc42a7ab1b600223244e53', '3', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,212ae8a31da84ef89aef50337955707b,', '4', '', null, null, '', '0', 'sys:article:huifu', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 16:23:12', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 16:23:12', null, '0');
INSERT INTO `sys_menu` VALUES ('394767607b244ba6a0ebd77ed8c0f493', '修改花卉资源信息', 'f46fcfc11ecc42a7ab1b600223244e53', '3', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,394767607b244ba6a0ebd77ed8c0f493,', '2', '', null, null, '', '0', 'sys:article:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:33:58', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:33:58', null, '0');
INSERT INTO `sys_menu` VALUES ('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '用户管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,', '9', '/admin/system/user/list', null, '', '#47e69c', '1', 'sys:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:31:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:59:20', null, '0');
INSERT INTO `sys_menu` VALUES ('3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '角色管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,', '10', '/admin/system/role/list', null, '', '#c23ab9', '1', 'sys:role:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:32:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:58:58', null, '0');
INSERT INTO `sys_menu` VALUES ('3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '权限管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '2', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,', '20', '/admin/system/menu/list', null, '', '#d4573b', '1', 'sys:menu:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:33:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:28', null, '0');
INSERT INTO `sys_menu` VALUES ('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb', '新增用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', null, '0');
INSERT INTO `sys_menu` VALUES ('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb', '编辑用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', null, '0');
INSERT INTO `sys_menu` VALUES ('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb', '删除用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', null, '0');
INSERT INTO `sys_menu` VALUES ('46d9f7c22b8641e59bebb0292121fac9', '删除花卉资源信息', 'f46fcfc11ecc42a7ab1b600223244e53', '3', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,46d9f7c22b8641e59bebb0292121fac9,', '3', '', null, null, '', '0', 'sys:article:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:34:54', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:34:54', null, '0');
INSERT INTO `sys_menu` VALUES ('6380621ac41c481588d44e27d3eda11a', '审核成功', '80e098653c24479782c4597eb8bce2e2', '3', '73746093ab3c4c5b8068c848c4d0f92b,80e098653c24479782c4597eb8bce2e2,6380621ac41c481588d44e27d3eda11a,', '1', '', null, null, '', '0', 'sys:wflowers:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:15:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:15:37', null, '0');
INSERT INTO `sys_menu` VALUES ('73746093ab3c4c5b8068c848c4d0f92b', '花卉管理', null, '1', '73746093ab3c4c5b8068c848c4d0f92b,', '2', '', null, '', '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:22:08', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:22:08', null, '0');
INSERT INTO `sys_menu` VALUES ('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '系统管理', null, '1', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,', '1', '', null, '', null, '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:29:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 03:09:26', null, '0');
INSERT INTO `sys_menu` VALUES ('80e098653c24479782c4597eb8bce2e2', '花卉信息管理', '73746093ab3c4c5b8068c848c4d0f92b', '2', '73746093ab3c4c5b8068c848c4d0f92b,80e098653c24479782c4597eb8bce2e2,', '2', 'admin/system/wflowers/wflowers', null, '', '', '1', 'sys:wflowers:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 13:54:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 13:54:47', null, '0');
INSERT INTO `sys_menu` VALUES ('8bd8ad4c43df4d2b81b13e8c4bb0cbf5', '删除花卉', '80e098653c24479782c4597eb8bce2e2', '3', '73746093ab3c4c5b8068c848c4d0f92b,80e098653c24479782c4597eb8bce2e2,8bd8ad4c43df4d2b81b13e8c4bb0cbf5,', '3', '', null, null, '', '0', 'sys:wflowers:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:31:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:31:49', null, '0');
INSERT INTO `sys_menu` VALUES ('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb', '新增权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:menu:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:38', null, '0');
INSERT INTO `sys_menu` VALUES ('9703ccf2-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:menu:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:25', null, '0');
INSERT INTO `sys_menu` VALUES ('9707cf58-9adb-11e8-aebe-1368d4ec24eb', '删除权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:menu:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:51:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:53:42', null, '0');
INSERT INTO `sys_menu` VALUES ('98222d27fc2e482a9f50212991f2df1c', '知识考试', null, '1', '98222d27fc2e482a9f50212991f2df1c,', '3', '', null, '', '', '1', '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 15:40:30', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 15:40:30', null, '0');
INSERT INTO `sys_menu` VALUES ('9aca7fb8c98d43dd9cbda892a394d21a', '查看回复内容', 'f46fcfc11ecc42a7ab1b600223244e53', '3', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,9aca7fb8c98d43dd9cbda892a394d21a,', '5', '', null, null, '', '0', 'sys:article:chakan', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 09:38:55', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 09:38:55', null, '0');
INSERT INTO `sys_menu` VALUES ('dd22ed2022fe4bfab97b4076988d1c42', '修改花卉', '80e098653c24479782c4597eb8bce2e2', '3', '73746093ab3c4c5b8068c848c4d0f92b,80e098653c24479782c4597eb8bce2e2,dd22ed2022fe4bfab97b4076988d1c42,', '4', '', null, null, '', '0', 'sys:wflowers:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:31:41', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:31:41', null, '0');
INSERT INTO `sys_menu` VALUES ('dde86ff54a834041af783871356d313e', '新增花卉', '80e098653c24479782c4597eb8bce2e2', '3', '73746093ab3c4c5b8068c848c4d0f92b,80e098653c24479782c4597eb8bce2e2,dde86ff54a834041af783871356d313e,', '2', '', null, null, '', '0', 'sys:wflowers:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:30:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 14:30:44', null, '0');
INSERT INTO `sys_menu` VALUES ('de2822ff55b14a7a84238687d6e0e7c1', '新增花卉资源信息', 'f46fcfc11ecc42a7ab1b600223244e53', '3', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,de2822ff55b14a7a84238687d6e0e7c1,', '1', '', null, null, '', '0', 'sys:article:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:33:28', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:33:28', null, '0');
INSERT INTO `sys_menu` VALUES ('ed63866b30cf46bfb6797a1d31ae930c', '锁定用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,', '21', '', null, null, '', '0', 'sys:user:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', null, '0');
INSERT INTO `sys_menu` VALUES ('f46fcfc11ecc42a7ab1b600223244e53', '帖子管理', '73746093ab3c4c5b8068c848c4d0f92b', '2', '73746093ab3c4c5b8068c848c4d0f92b,f46fcfc11ecc42a7ab1b600223244e53,', '1', 'admin/system/article/article', null, '', '', '1', 'sys:article:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 14:32:07', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 17:27:05', null, '0');
INSERT INTO `sys_menu` VALUES ('ff619e04-9adb-11e8-aebe-1368d4ec24eb', '新增角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,', '0', '', null, null, null, '0', 'sys:role:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', null, '0');
INSERT INTO `sys_menu` VALUES ('ff9477c9-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,', '10', '', null, null, null, '0', 'sys:role:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', null, '0');
INSERT INTO `sys_menu` VALUES ('ff9ad846-9adb-11e8-aebe-1368d4ec24eb', '删除角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '3', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,', '20', '', null, null, null, '0', 'sys:role:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', null, '0');

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(36) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('3084795dbf52461597fee23f041c7bc1', '4f294d25-10a4-48e9-95b6-bec30ec47123.jpg', 'local', '/static/upload/4f294d25-10a4-48e9-95b6-bec30ec47123.jpg', 'FueKn-K3YzuVpGFEDjF3AHse1dTO', '57kb', 'image/jpeg', null, '2019-04-15 11:17:12', 'ee58cacf66c947219e66cb413718e44e', '2019-04-15 11:17:12', 'ee58cacf66c947219e66cb413718e44e', null, '0');
INSERT INTO `sys_rescource` VALUES ('357028c3b2b043749176c1f17412ef70', '29b436d0-c71a-4c4f-b5b6-d992b2bebfae.jpg', 'local', '/static/upload/29b436d0-c71a-4c4f-b5b6-d992b2bebfae.jpg', 'FriKf452SV0eG1la-DunSSQLCENF', '37kb', 'image/jpeg', null, '2019-04-15 11:16:37', 'ee58cacf66c947219e66cb413718e44e', '2019-04-15 11:16:37', 'ee58cacf66c947219e66cb413718e44e', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '中级管理员', '2017-11-02 14:19:07', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-15 11:21:17', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '高级管理员', '2017-11-29 19:36:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-15 10:36:40', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');
INSERT INTO `sys_role` VALUES ('8defa19bdf04494896994a842f628f06', '普通用户', '2019-04-12 13:13:09', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-15 11:20:55', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '212ae8a31da84ef89aef50337955707b');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '394767607b244ba6a0ebd77ed8c0f493');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '46d9f7c22b8641e59bebb0292121fac9');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '6380621ac41c481588d44e27d3eda11a');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '73746093ab3c4c5b8068c848c4d0f92b');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '80e098653c24479782c4597eb8bce2e2');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '8bd8ad4c43df4d2b81b13e8c4bb0cbf5');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '96fd6a5a-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '9703ccf2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '9707cf58-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '9aca7fb8c98d43dd9cbda892a394d21a');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'dd22ed2022fe4bfab97b4076988d1c42');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'dde86ff54a834041af783871356d313e');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'de2822ff55b14a7a84238687d6e0e7c1');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'f46fcfc11ecc42a7ab1b600223244e53');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'ff9477c9-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '212ae8a31da84ef89aef50337955707b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '394767607b244ba6a0ebd77ed8c0f493');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '46d9f7c22b8641e59bebb0292121fac9');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '6380621ac41c481588d44e27d3eda11a');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '73746093ab3c4c5b8068c848c4d0f92b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '80e098653c24479782c4597eb8bce2e2');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '8bd8ad4c43df4d2b81b13e8c4bb0cbf5');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '96fd6a5a-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9703ccf2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9707cf58-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9aca7fb8c98d43dd9cbda892a394d21a');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'dd22ed2022fe4bfab97b4076988d1c42');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'dde86ff54a834041af783871356d313e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'de2822ff55b14a7a84238687d6e0e7c1');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'f46fcfc11ecc42a7ab1b600223244e53');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9477c9-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '0b49d5eae12e45868ffe2bd300e1deeb');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '394767607b244ba6a0ebd77ed8c0f493');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '73746093ab3c4c5b8068c848c4d0f92b');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '80e098653c24479782c4597eb8bce2e2');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '8bd8ad4c43df4d2b81b13e8c4bb0cbf5');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '98222d27fc2e482a9f50212991f2df1c');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', '9aca7fb8c98d43dd9cbda892a394d21a');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', 'dd22ed2022fe4bfab97b4076988d1c42');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', 'dde86ff54a834041af783871356d313e');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', 'de2822ff55b14a7a84238687d6e0e7c1');
INSERT INTO `sys_role_menu` VALUES ('8defa19bdf04494896994a842f628f06', 'f46fcfc11ecc42a7ab1b600223244e53');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'admin', '我是管理员', null, '78291952ed637786d6692a5b15bc3cb080e37454', '4f9ae8f3fbde047a', '13776055179', 'b@qq.com', '0', '2017-11-27 22:19:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-11 13:51:42', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1');
INSERT INTO `sys_user` VALUES ('cb77f88d207f4054ab92d629600795c5', 'lisi', '李四', null, '78291952ed637786d6692a5b15bc3cb080e37454', '4f9ae8f3fbde047a', '18191736320', '876053738@qq.com', '0', '2019-04-12 12:32:17', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-12 12:32:17', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', null, '0', '1');
INSERT INTO `sys_user` VALUES ('ee58cacf66c947219e66cb413718e44e', 'zhangsan', '张三', '/static/upload/4f294d25-10a4-48e9-95b6-bec30ec47123.jpg', '78291952ed637786d6692a5b15bc3cb080e37454', '4f9ae8f3fbde047a', '12312312123', 'asd@qq.com', '0', '2019-04-12 13:13:29', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-04-15 11:17:14', 'ee58cacf66c947219e66cb413718e44e', '', '0', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('cb77f88d207f4054ab92d629600795c5', '70689483-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('ee58cacf66c947219e66cb413718e44e', '70689483-9ad7-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for w_article
-- ----------------------------
DROP TABLE IF EXISTS `w_article`;
CREATE TABLE `w_article` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `writer` varchar(255) DEFAULT NULL COMMENT '作者',
  `content` varchar(10000) DEFAULT NULL COMMENT '内容',
  `time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `status` int(11) DEFAULT NULL COMMENT '发布状态:1.发布;2.草稿',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_article
-- ----------------------------
INSERT INTO `w_article` VALUES ('1a2811fb2db94499bbfd38de91323721', '第一个帖子', '花卉资源信息', '<p>第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容第一个帖子的内容</p>', '2019-04-15 10:42:50', '1', 'D:/ibms/tupian/ad81800f-b8a0-4040-a928-c26aa0ce69f2.jpg', 'ad81800f-b8a0-4040-a928-c26aa0ce69f2.jpg');
INSERT INTO `w_article` VALUES ('f8631e055ef6461a92505a9558f27c2b', '2222', '花卉资源信息', '22222222222222222', '2019-04-15 11:24:38', '1', 'D:/ibms/tupian/1b438e8c-5f52-4ce4-a676-d4463710cbb0.jpg', '1b438e8c-5f52-4ce4-a676-d4463710cbb0.jpg');

-- ----------------------------
-- Table structure for w_flowers
-- ----------------------------
DROP TABLE IF EXISTS `w_flowers`;
CREATE TABLE `w_flowers` (
  `id` varchar(255) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '花卉名称',
  `hue` varchar(255) DEFAULT NULL COMMENT '花卉颜色',
  `period` varchar(255) DEFAULT NULL COMMENT '花卉成长周期',
  `water` varchar(255) DEFAULT NULL COMMENT '浇水间隔',
  `sun` varchar(255) DEFAULT NULL COMMENT '阳光辐射',
  `trim` varchar(255) DEFAULT NULL COMMENT '修剪周期',
  `classify` varchar(255) DEFAULT NULL COMMENT '分类',
  `audit` int(11) DEFAULT NULL COMMENT '审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_flowers
-- ----------------------------
INSERT INTO `w_flowers` VALUES ('38474b8795094e7294f8017242f38aa7', '月季', '黄色', '一年', '一年', '中午', '一年', '花', null);
INSERT INTO `w_flowers` VALUES ('51d5a7523e9541c8b4bb895d5c223ae9', '3', '3', '3', '3', '3', '3', '3', null);
INSERT INTO `w_flowers` VALUES ('73f4d3f03262472db5347dffad9700c0', '2', '2', '2', '2', '2', '2', '2', '1');
INSERT INTO `w_flowers` VALUES ('78c22f49a5b04479a94faa63ef3ba7be', '11', '1', '1', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for w_reply
-- ----------------------------
DROP TABLE IF EXISTS `w_reply`;
CREATE TABLE `w_reply` (
  `id` varchar(255) NOT NULL,
  `wenid` varchar(255) DEFAULT NULL COMMENT '文章ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `huifu` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `shijian` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_reply
-- ----------------------------
INSERT INTO `w_reply` VALUES ('2772484e2a2c4527976eb49e8835cecf', '631ae24d93c3477688a7df272b9a7096', 'admin', '弱水三千，你却独爱冥花', '2019-04-12 17:28:16');
INSERT INTO `w_reply` VALUES ('71cfb6f31fcc43b3b4ab2491487ddb35', '736f2265ba76447fb682d4a82755d084', 'admin', 'aaaaa', '2019-04-12 11:36:52');
INSERT INTO `w_reply` VALUES ('92f27bd8845a4b1eb808fd2c96391927', '631ae24d93c3477688a7df272b9a7096', 'admin', '洒洒水所所', '2019-04-12 13:38:59');
INSERT INTO `w_reply` VALUES ('a8f78daaaf8846c185bc6031733b3830', '736f2265ba76447fb682d4a82755d084', 'admin', '玫瑰应该是表达爱意的通用语言。但不同颜色玫瑰的花语也有不同寓意。', '2019-04-12 17:28:29');
INSERT INTO `w_reply` VALUES ('acecbc42b6bb4842b99218ca0409566b', '736f2265ba76447fb682d4a82755d084', 'admin', '艹尼玛的', '2019-04-12 12:12:58');
INSERT INTO `w_reply` VALUES ('ade0703f202d4b25a9d48b796109f664', '631ae24d93c3477688a7df272b9a7096', 'admin', '几卷经书难留 这满院的冥花', '2019-04-12 12:25:08');
INSERT INTO `w_reply` VALUES ('c7275a7f68b94aa0a238b2ba51ebf80d', '736f2265ba76447fb682d4a82755d084', 'admin', 'lllll', '2019-04-12 11:56:41');
INSERT INTO `w_reply` VALUES ('cc935867fd994964b4b252a96ec1296f', '1a2811fb2db94499bbfd38de91323721', 'lisi', '很好 ', '2019-04-15 11:46:05');
INSERT INTO `w_reply` VALUES ('cf8abc0e101d4e8491888e216b0d0e7d', '736f2265ba76447fb682d4a82755d084', 'admin', '你好', '2019-04-12 10:08:47');
INSERT INTO `w_reply` VALUES ('fab3bf1bec5b435e827fab74322222b5', '1a2811fb2db94499bbfd38de91323721', 'admin', '不错的帖子', '2019-04-15 10:43:35');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN  
DECLARE v INTEGER;  
SET v = 0;  
SELECT current_value INTO v FROM sequence WHERE NAME = seq_name;  
RETURN v;  
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN  
UPDATE sequence SET current_value = current_value + increment WHERE NAME = seq_name;  
RETURN currval(seq_name);  
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
