/*
Navicat MySQL Data Transfer

Source Server         : haha
Source Server Version : 50612
Source Host           : 127.0.0.1:3306
Source Database       : db_patient

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-06-30 12:03:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_doctor
-- ----------------------------
DROP TABLE IF EXISTS `t_doctor`;
CREATE TABLE `t_doctor` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `byyx` varchar(40) DEFAULT NULL,
  `cynx` int(2) DEFAULT NULL,
  `keshiId` int(11) DEFAULT NULL,
  `zhicheng` varchar(40) DEFAULT NULL,
  `zhuanchang` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`doctorId`),
  KEY `keshi-doctor` (`keshiId`),
  CONSTRAINT `keshi-doctor` FOREIGN KEY (`keshiId`) REFERENCES `t_keshi` (`keshiId`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_doctor
-- ----------------------------
INSERT INTO `t_doctor` VALUES ('1', '丁聪华', '男', '1988-07-01', '皖南医学院', '6', '1', '主治医师', '心血管内科');
INSERT INTO `t_doctor` VALUES ('2', '江浩华', '男', '1988-01-24', '华中科技大学', '6', '1', '住院医师', '呼吸内科');
INSERT INTO `t_doctor` VALUES ('3', '曾帛员', '男', '1960-11-08', '浙江大学', '33', '1', '主任医师', '消化内科');
INSERT INTO `t_doctor` VALUES ('4', '韩　松', '男', '1966-05-02', '西安交通大学', '22', '1', '副主任医师', '神经内科');
INSERT INTO `t_doctor` VALUES ('5', '夏潇琦', '女', '1960-09-21', '华中科技大学', '26', '1', '主任医师', '肾内科');
INSERT INTO `t_doctor` VALUES ('6', '田宇旺', '男', '1966-04-27', '四川大学', '20', '1', '副主任医师', '血液科');
INSERT INTO `t_doctor` VALUES ('7', '孔良超', '男', '1975-04-08', '复旦大学', '11', '1', '副主任医师', '风湿免疫科');
INSERT INTO `t_doctor` VALUES ('8', '孙蝶妃', '女', '1960-05-07', '南京中医药大学', '26', '1', '主任医师', '感染科');
INSERT INTO `t_doctor` VALUES ('9', '冉迪振', '男', '1988-02-25', '上海交通大学', '8', '1', '住院医师', '内分泌科');
INSERT INTO `t_doctor` VALUES ('10', '陈寿渊', '男', '1968-05-16', '天津中医学院', '16', '1', '主任医师', '过敏反应科');
INSERT INTO `t_doctor` VALUES ('11', '徐经岚', '男', '1988-03-29', '东南大学医学院', '7', '1', '主治医师', '普通内科');
INSERT INTO `t_doctor` VALUES ('12', '唐亚升', '男', '1960-11-23', '复旦大学', '28', '2', '主任医师', '神经内科');
INSERT INTO `t_doctor` VALUES ('13', '陈莲眉', '女', '1988-02-29', '东南大学医学院', '5', '2', '住院医师', '肝胆外科');
INSERT INTO `t_doctor` VALUES ('14', '崔子希', '男', '1966-08-17', '南方医科大学', '23', '2', '副主任医师', '肛肠外科');
INSERT INTO `t_doctor` VALUES ('15', '任　希', '男', '1960-08-22', '中南大学', '27', '2', '主任医师', '泌尿外科');
INSERT INTO `t_doctor` VALUES ('16', '姚道益', '男', '1988-05-21', '汕头大学医学院', '5', '2', '主治医师', '血管外科');
INSERT INTO `t_doctor` VALUES ('17', '马桂蓓', '女', '1968-02-06', '南方医科大学', '17', '2', '主任医师', '整形外科');
INSERT INTO `t_doctor` VALUES ('18', '米泽升', '男', '1980-04-28', '广州中医药大学', '11', '2', '副主任医师', '乳腺外');
INSERT INTO `t_doctor` VALUES ('19', '邓材民', '男', '1988-06-15', '复旦大学', '8', '2', '主治医师', '普通外科');
INSERT INTO `t_doctor` VALUES ('20', '赵美珍', '女', '1957-06-30', '中国医科大学', '33', '2', '主任医师', '胸外科');
INSERT INTO `t_doctor` VALUES ('21', '陆银兴', '男', '1988-07-25', '佳木斯大学医学院', '7', '2', '住院医师', '心血管外科');
INSERT INTO `t_doctor` VALUES ('22', '康天鹏', '男', '1979-04-20', '郑州大学医学院', '10', '2', '主治医师', '烧伤科');
INSERT INTO `t_doctor` VALUES ('23', '宋牡馨', '女', '1950-06-29', '复旦大学', '35', '2', '主任医师', '器官移植科');
INSERT INTO `t_doctor` VALUES ('24', '田婕灵', '女', '1988-09-19', '华中科技大学', '8', '3', '住院医师', '脊柱外科');
INSERT INTO `t_doctor` VALUES ('25', '范　坤', '男', '1968-10-31', '天津中医学院', '18', '3', '主任医师', '关节外科');
INSERT INTO `t_doctor` VALUES ('26', '阮　龙', '男', '1950-11-29', '复旦大学', '43', '3', '主任医师', '手外科');
INSERT INTO `t_doctor` VALUES ('27', '戴　敏', '男', '1966-09-16', '北京大学', '21', '3', '副主任医师', '创伤骨科');
INSERT INTO `t_doctor` VALUES ('28', '孔　苇', '女', '1950-03-02', '中国协和医科大学', '39', '3', '主任医师', '矫形骨科');
INSERT INTO `t_doctor` VALUES ('29', '顾良龙', '男', '1988-11-01', '潍坊医学院', '5', '3', '主治医师', '骨质疏松科');
INSERT INTO `t_doctor` VALUES ('30', '康　晓', '女', '1956-08-25', '中国协和医科大学', '30', '4', '主任医师', '妇科');
INSERT INTO `t_doctor` VALUES ('31', '许永岚', '男', '1979-09-20', '中山大学', '8', '4', '主治医师', '产科');
INSERT INTO `t_doctor` VALUES ('32', '程双民', '男', '1956-12-08', '南京中医药大学', '28', '4', '主任医师', '妇女保健科');
INSERT INTO `t_doctor` VALUES ('33', '陆道根', '男', '1956-07-01', '中国医科大学', '31', '4', '主任医师', '生殖遗传科');
INSERT INTO `t_doctor` VALUES ('34', '寇瑞生', '男', '1975-09-26', '郑州大学医学院', '10', '5', '住院医师', '小儿心血管内科');
INSERT INTO `t_doctor` VALUES ('35', '吴潇凤', '女', '1979-07-27', '河北医科大学', '8', '5', '主治医师', '小儿呼吸内科');
INSERT INTO `t_doctor` VALUES ('36', '毛倚娴', '女', '1966-07-20', '中南大学', '19', '5', '副主任医师', '小儿消化科');
INSERT INTO `t_doctor` VALUES ('37', '黄敬甫', '男', '1979-08-30', '复旦大学', '7', '5', '主治医师', '小儿肾内科');
INSERT INTO `t_doctor` VALUES ('38', '韩　娅', '女', '1980-05-06', '沈阳药科大学', '12', '5', '副主任医师', '小儿免疫科');
INSERT INTO `t_doctor` VALUES ('39', '龚元才', '男', '1975-05-14', '中山大学', '10', '5', '住院医师', '小儿神经内科');
INSERT INTO `t_doctor` VALUES ('40', '邓飘雨', '女', '1979-10-15', '新疆医科大学', '9', '5', '主治医师', '小儿内分泌科');
INSERT INTO `t_doctor` VALUES ('41', '马庆炳', '男', '1980-03-17', '华中科技大学', '11', '5', '副主任医师', '小儿感染科');
INSERT INTO `t_doctor` VALUES ('42', '吕彦花', '女', '1957-10-10', '浙江大学', '32', '5', '主任医师', '小儿普外科');
INSERT INTO `t_doctor` VALUES ('43', '江　斌', '男', '1988-11-10', '新乡医学院', '4', '5', '主治医师', '小儿胸外科');
INSERT INTO `t_doctor` VALUES ('44', '曾　勇', '男', '1980-06-19', '华中科技大学', '13', '5', '副主任医师', '小儿心血管外科');
INSERT INTO `t_doctor` VALUES ('45', '伍兆斌', '男', '1957-10-20', '上海中医药大学', '28', '5', '主任医师', '小儿泌尿科');
INSERT INTO `t_doctor` VALUES ('46', '汪牡蝶', '女', '1988-04-16', '贵阳医学院', '6', '5', '主治医师', '小儿神经内科');
INSERT INTO `t_doctor` VALUES ('47', '方艾健', '男', '1975-12-25', '北京大学', '13', '5', '住院医师', '小儿急诊科');
INSERT INTO `t_doctor` VALUES ('48', '余卓超', '男', '1950-01-09', '北京大学', '40', '5', '主任医师', '小儿保健科');
INSERT INTO `t_doctor` VALUES ('49', '孔娅萱', '女', '1979-06-11', '新疆医科大学', '10', '5', '主治医师', '新生儿科');
INSERT INTO `t_doctor` VALUES ('50', '严登武', '男', '1956-08-12', '北京大学', '25', '6', '主任医师', '青光眼科');
INSERT INTO `t_doctor` VALUES ('51', '宋安璨', '男', '1966-05-17', '四川大学', '21', '7', '副主任医师', '白内障科');
INSERT INTO `t_doctor` VALUES ('52', '樊革民', '男', '1975-11-18', '安徽医科大学', '11', '7', '住院医师', '角膜病科');
INSERT INTO `t_doctor` VALUES ('53', '沈天根', '男', '1957-12-05', '郑州大学医学院', '30', '7', '主任医师', '眼底病科');
INSERT INTO `t_doctor` VALUES ('54', '孙　晶', '女', '1972-06-04', '西安交通大学', '16', '7', '主治医师', '眼外伤科');
INSERT INTO `t_doctor` VALUES ('55', '黄杏玉', '女', '1975-07-19', '中国协和医科大学', '13', '7', '副主任医师', '激光科');
INSERT INTO `t_doctor` VALUES ('56', '孟家鹏', '男', '1968-03-05', '上海交通大学', '16', '8', '主治医师', '口腔病理科');
INSERT INTO `t_doctor` VALUES ('57', '吴均武', '男', '1950-06-10', '北京大学', '44', '8', '主任医师', '口腔整形科');
INSERT INTO `t_doctor` VALUES ('58', '孙冰韵', '女', '1975-08-20', '郑州大学医学院', '13', '9', '住院医师', '皮肤科');
INSERT INTO `t_doctor` VALUES ('59', '钱富武', '男', '1980-12-25', '复旦大学', '12', '14', '副主任医师', '性病科');
INSERT INTO `t_doctor` VALUES ('60', '唐远先', '男', '1957-08-09', '复旦大学', '34', '10', '主任医师', '肿瘤内科');
INSERT INTO `t_doctor` VALUES ('61', '赵　竣', '男', '1972-07-20', '扬州大学医学院', '15', '10', '主治医师', '肿瘤外科');
INSERT INTO `t_doctor` VALUES ('62', '井　剑', '男', '1957-11-15', '北京大学', '27', '10', '主任医师', '脑部肿瘤科');
INSERT INTO `t_doctor` VALUES ('63', '何星振', '男', '1980-10-23', '同济大学医学院', '10', '10', '副主任医师', '头颈肿瘤科');
INSERT INTO `t_doctor` VALUES ('64', '李蝶红', '女', '1957-01-22', '中国医科大学', '30', '10', '主任医师', '胸部肿瘤科');
INSERT INTO `t_doctor` VALUES ('65', '蒋天振', '男', '1979-03-26', '上海交通大学', '11', '10', '主治医师', '腹部肿瘤科');
INSERT INTO `t_doctor` VALUES ('66', '张小瑜', '女', '1975-01-13', '西安交通大学', '12', '10', '住院医师', '泌尿肿瘤科');
INSERT INTO `t_doctor` VALUES ('67', '韩则龙', '男', '1956-05-14', '复旦大学', '29', '10', '主任医师', '妇科肿瘤科');
INSERT INTO `t_doctor` VALUES ('68', '余少庆', '男', '1972-09-15', '首都医科大学', '14', '10', '主治医师', '软组织科');
INSERT INTO `t_doctor` VALUES ('69', '鲁艾弈', '男', '1956-03-22', '中山大学', '30', '10', '主任医师', '放射治疗科');
INSERT INTO `t_doctor` VALUES ('70', '成　彤', '男', '1972-05-22', '南方医科大学', '11', '11', '主治医师', '麻醉科');
INSERT INTO `t_doctor` VALUES ('71', '蒋言柔', '女', '1966-10-21', '四川大学', '20', '12', '副主任医师', '放射科');
INSERT INTO `t_doctor` VALUES ('72', '陈　刚', '男', '1979-02-14', '安徽医科大学', '12', '12', '主治医师', '超声科');
INSERT INTO `t_doctor` VALUES ('73', '毛安聚', '男', '1950-09-15', '北京大学', '41', '12', '主任医师', '核医学科');
INSERT INTO `t_doctor` VALUES ('74', '龚景萧', '女', '1968-03-21', '山东大学医学院', '14', '12', '主治医师', '心电图科');
INSERT INTO `t_doctor` VALUES ('75', '方富玄', '男', '1979-01-16', '中山大学', '11', '13', '主治医师', '中医内科');
INSERT INTO `t_doctor` VALUES ('76', '朱　千', '男', '1957-03-12', '暨南大学医学院', '24', '13', '主任医师', '中医心内科');
INSERT INTO `t_doctor` VALUES ('77', '赵　翠', '女', '1980-02-27', '中山大学', '10', '13', '副主任医师', '中医呼吸科');
INSERT INTO `t_doctor` VALUES ('78', '井焱丹', '男', '1988-08-26', '中国协和医科大学', '7', '13', '住院医师', '中医神经内科');
INSERT INTO `t_doctor` VALUES ('79', '邹　爽', '男', '1972-08-24', '中山大学', '14', '13', '主治医师', '中医消化科');
INSERT INTO `t_doctor` VALUES ('80', '姚静薇', '女', '1975-03-26', '首都医科大学', '12', '13', '住院医师', '中医肝病科');
INSERT INTO `t_doctor` VALUES ('81', '刘　志', '男', '1968-02-14', '中国协和医科大学', '15', '13', '主任医师', '中医内分泌');
INSERT INTO `t_doctor` VALUES ('82', '刘荣时', '男', '1979-07-03', '中山大学', '10', '13', '主治医师', '中医肾病内科');
INSERT INTO `t_doctor` VALUES ('83', '韩惠宜', '女', '1980-09-24', '广州中医药大学', '11', '13', '副主任医师', '中医免疫内科');
INSERT INTO `t_doctor` VALUES ('84', '林进棉', '男', '1960-02-20', '复旦大学', '31', '13', '主任医师', '中医血液科');
INSERT INTO `t_doctor` VALUES ('85', '张滕龙', '男', '1979-05-26', '沈阳药科大学', '9', '13', '主治医师', '中医感染内科');
INSERT INTO `t_doctor` VALUES ('86', '贾　蓉', '女', '1960-06-15', '中山大学', '25', '13', '主任医师', '中医外科');
INSERT INTO `t_doctor` VALUES ('87', '封　勇', '男', '1972-03-13', '河北医科大学', '13', '13', '主治医师', '中医骨科');
INSERT INTO `t_doctor` VALUES ('88', '罗建卿', '男', '1975-08-22', '河北医科大学', '12', '13', '副主任医师', '中医乳腺外科');
INSERT INTO `t_doctor` VALUES ('89', '范继聚', '男', '1975-06-25', '山东大学医学院', '10', '13', '住院医师', '中医肛肠科');
INSERT INTO `t_doctor` VALUES ('90', '吴久坤', '男', '1960-09-07', '浙江大学', '27', '13', '主任医师', '中医妇产科');
INSERT INTO `t_doctor` VALUES ('91', '叶致玉', '女', '1972-03-29', '复旦大学', '12', '13', '主治医师', '中医儿科');
INSERT INTO `t_doctor` VALUES ('92', '万平洪', '男', '1966-05-23', '中国协和医科大学', '21', '13', '副主任医师', '中医皮肤科');
INSERT INTO `t_doctor` VALUES ('93', '毛安聚', '男', '1960-10-31', '中南大学', '29', '13', '主任医师', '中医五官科');
INSERT INTO `t_doctor` VALUES ('94', '朱方民', '男', '1968-05-24', '山东大学医学院', '19', '13', '主治医师', '中医肿瘤科');
INSERT INTO `t_doctor` VALUES ('95', '万有全', '男', '1968-08-24', '北京大学', '18', '13', '主任医师', '中医针灸科');
INSERT INTO `t_doctor` VALUES ('96', '寇　荔', '女', '1988-10-11', '延边大学医学院', '6', '13', '住院医师', '中医推拿科');
INSERT INTO `t_doctor` VALUES ('97', '刘敬献', '男', '1983-01-05', '同济大学医学院', '11', '13', '副主任医师', '中医男科');

-- ----------------------------
-- Table structure for t_doctorwork
-- ----------------------------
DROP TABLE IF EXISTS `t_doctorwork`;
CREATE TABLE `t_doctorwork` (
  `workid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `maxnum` int(11) DEFAULT '20',
  PRIMARY KEY (`workid`),
  KEY `doctor-work` (`did`),
  KEY `time` (`time`),
  CONSTRAINT `doctor-work` FOREIGN KEY (`did`) REFERENCES `t_doctor` (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_doctorwork
-- ----------------------------
INSERT INTO `t_doctorwork` VALUES ('1', '1', '2014-04-07', '20', '20');
INSERT INTO `t_doctorwork` VALUES ('2', '1', '2014-04-09', '4', '20');
INSERT INTO `t_doctorwork` VALUES ('3', '1', '2014-04-11', '1', '20');
INSERT INTO `t_doctorwork` VALUES ('4', '20', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('5', '20', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('6', '6', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('7', '6', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('8', '31', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('9', '31', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('10', '31', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('11', '40', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('12', '40', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('13', '40', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('14', '40', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('15', '15', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('16', '15', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('17', '15', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('18', '22', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('19', '22', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('20', '22', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('21', '60', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('22', '60', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('23', '60', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('24', '47', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('25', '47', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('26', '47', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('27', '47', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('28', '88', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('29', '88', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('30', '53', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('31', '53', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('32', '53', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('33', '41', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('34', '41', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('35', '2', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('36', '2', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('37', '3', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('38', '3', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('39', '13', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('40', '13', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('41', '70', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('42', '70', '2014-04-09', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('43', '70', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('44', '70', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('45', '96', '2014-04-07', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('46', '96', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('47', '96', '2014-04-11', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('48', '77', '2014-04-08', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('49', '77', '2014-04-10', '0', '20');
INSERT INTO `t_doctorwork` VALUES ('50', '77', '2014-04-11', '0', '20');

-- ----------------------------
-- Table structure for t_keshi
-- ----------------------------
DROP TABLE IF EXISTS `t_keshi`;
CREATE TABLE `t_keshi` (
  `keshiId` int(11) NOT NULL AUTO_INCREMENT,
  `keshiName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`keshiId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_keshi
-- ----------------------------
INSERT INTO `t_keshi` VALUES ('1', '内科');
INSERT INTO `t_keshi` VALUES ('2', '外科');
INSERT INTO `t_keshi` VALUES ('3', '骨科');
INSERT INTO `t_keshi` VALUES ('4', '妇产科');
INSERT INTO `t_keshi` VALUES ('5', '儿科');
INSERT INTO `t_keshi` VALUES ('6', '眼科');
INSERT INTO `t_keshi` VALUES ('7', '耳鼻喉科');
INSERT INTO `t_keshi` VALUES ('8', '口腔科');
INSERT INTO `t_keshi` VALUES ('9', '皮肤科');
INSERT INTO `t_keshi` VALUES ('10', '肿瘤科');
INSERT INTO `t_keshi` VALUES ('11', '麻醉科');
INSERT INTO `t_keshi` VALUES ('12', '医学影像科');
INSERT INTO `t_keshi` VALUES ('13', '中医科');
INSERT INTO `t_keshi` VALUES ('14', '性病科');

-- ----------------------------
-- Table structure for t_sick
-- ----------------------------
DROP TABLE IF EXISTS `t_sick`;
CREATE TABLE `t_sick` (
  `sickId` int(10) NOT NULL AUTO_INCREMENT,
  `sickName` varchar(20) DEFAULT '',
  `sickPwd` varchar(20) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `sid` varchar(20) DEFAULT NULL,
  `sickDesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sickId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_sick
-- ----------------------------
INSERT INTO `t_sick` VALUES ('1', 'zhaopeng', '123', '赵鹏', '男', '18', '410115199609080222', '胃病');
INSERT INTO `t_sick` VALUES ('2', 'liu9999', '123', '刘炳坤', '男', '23', '410795199111306549', '骨折');
INSERT INTO `t_sick` VALUES ('3', 'zhangxiaohong', '123', '张小红', '女', '21', '410565199308246498', '感冒');
INSERT INTO `t_sick` VALUES ('4', '7758521', '123', '王三红', '男', '23', '410325199106102658', '肚疼');
INSERT INTO `t_sick` VALUES ('5', '小张', '111', '张启风', '男', '33', '410332198112503325', '头晕 ');
INSERT INTO `t_sick` VALUES ('6', 'zhuzhuxy', '123', '朱新雨', '女', '12', '410985200607235982', '发烧');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '111', '0');
INSERT INTO `t_user` VALUES ('3', 'guan', '111', '1');

-- ----------------------------
-- Table structure for t_yuyue
-- ----------------------------
DROP TABLE IF EXISTS `t_yuyue`;
CREATE TABLE `t_yuyue` (
  `yuyueid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `yuyuetime` date DEFAULT NULL,
  `turnnum` int(11) DEFAULT NULL,
  `info` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`yuyueid`),
  KEY `doctor-yuyue` (`did`),
  KEY `sick-yuyue` (`sid`),
  KEY `work-yuyue` (`yuyuetime`),
  CONSTRAINT `doctor-yuyue` FOREIGN KEY (`did`) REFERENCES `t_doctor` (`doctorId`),
  CONSTRAINT `sick-yuyue` FOREIGN KEY (`sid`) REFERENCES `t_sick` (`sickId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_yuyue
-- ----------------------------
INSERT INTO `t_yuyue` VALUES ('38', '5', '1', '2014-04-09', '1', '丁聪华');
INSERT INTO `t_yuyue` VALUES ('39', '5', '1', '2014-04-09', '2', '丁聪华');
INSERT INTO `t_yuyue` VALUES ('40', '5', '1', '2014-04-09', '3', '丁聪华');
INSERT INTO `t_yuyue` VALUES ('41', '5', '1', '2014-04-11', '1', '丁聪华');
INSERT INTO `t_yuyue` VALUES ('42', '1', '1', '2014-04-09', '4', '丁聪华');
