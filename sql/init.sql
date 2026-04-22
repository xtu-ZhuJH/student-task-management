-- MySQL 8.0 学生任务管理系统 初始化脚本
CREATE DATABASE IF NOT EXISTS student_task_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE student_task_db;

-- 用户表
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '登录账号',
    password VARCHAR(100) NOT NULL COMMENT '登录密码',
    role VARCHAR(10) NOT NULL DEFAULT 'student' COMMENT '角色:admin/student',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- 学生表
DROP TABLE IF EXISTS student;
CREATE TABLE student (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '学生ID',
    user_id BIGINT NOT NULL COMMENT '关联用户ID',
    student_no VARCHAR(20) NOT NULL UNIQUE COMMENT '学号',
    name VARCHAR(20) NOT NULL COMMENT '姓名',
    major VARCHAR(50) DEFAULT '' COMMENT '专业',
    phone VARCHAR(11) DEFAULT '' COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生信息表';

-- 任务表
DROP TABLE IF EXISTS task;
CREATE TABLE task (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '任务ID',
    title VARCHAR(100) NOT NULL COMMENT '任务标题',
    content TEXT COMMENT '任务内容',
    publish_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
    end_time DATETIME NULL COMMENT '截止时间',
    status INT DEFAULT 1 COMMENT '状态:1启用 0禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务信息表';

-- 初始化测试数据
INSERT INTO sys_user (username, password, role) VALUES ('admin','123456','admin');
INSERT INTO student (user_id, student_no, name, major) VALUES (1,'2025001','张三','计算机科学');
INSERT INTO task (title, content, end_time) VALUES ('Java作业','完成SpringBoot入门','2025-12-31 23:59:59');

SELECT '数据库初始化完成！' AS result;