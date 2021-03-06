-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.18-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 ko_server 的数据库结构
CREATE DATABASE IF NOT EXISTS `ko_server` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ko_server`;

-- 导出  表 ko_server.t_menu 结构
CREATE TABLE IF NOT EXISTS `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键，菜单编号',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) unsigned zerofill NOT NULL COMMENT '父级菜单id',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户id',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表，维度表';

-- 数据导出被取消选择。
-- 导出  表 ko_server.t_role 结构
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键，权限编号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表，维度表';

-- 数据导出被取消选择。
-- 导出  表 ko_server.t_role_menu 结构
CREATE TABLE IF NOT EXISTS `t_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单关系表，事实表';

-- 数据导出被取消选择。
-- 导出  表 ko_server.t_user 结构
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `wechat_id` varchar(200) DEFAULT NULL COMMENT '微信三方登陆id',
  `qq_id` varchar(200) DEFAULT NULL COMMENT 'qq三方登陆id',
  `weibo_id` varchar(200) DEFAULT NULL COMMENT '微博三方登陆id',
  `sina` varchar(200) DEFAULT NULL COMMENT '用户签名',
  `role_id` bigint(20) NOT NULL COMMENT '权限id',
  `money_id` bigint(20) DEFAULT NULL COMMENT '余额id',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新用户',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表，维度表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
