-- MySQL dump 10.13  Distrib 5.6.47, for Linux (x86_64)
--
-- Host: localhost    Database: 2020
-- ------------------------------------------------------
-- Server version	5.6.47-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dd_addres`
--

DROP TABLE IF EXISTS `dd_addres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_addres` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `addres` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `uid` int(32) NOT NULL,
  `isDefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_addres`
--

LOCK TABLES `dd_addres` WRITE;
/*!40000 ALTER TABLE `dd_addres` DISABLE KEYS */;
INSERT INTO `dd_addres` VALUES (1,'广东','东莞市','南城区','胜和豪岗新村2号楼B座702','朱益龙','13620002358',1579421424,1579421424,127,1),(2,'辽宁','锦州市','北宁市','你好像淘气的','李飞恒','13828855724',1582578462,1582578462,72,1),(4,'江苏','连云港市','灌南县','嗯ヽ(○^㉨^)ﾉ♪','除了三害','16828855724',1582578970,1582578970,76,0),(5,'北京市','北京市','东城区','三环内线','孔侑','13800138000',1588879607,1588967091,73,0),(6,'北京市','北京市','东城区','121151515','天三环','13800138000',1588879723,1588967091,73,1),(8,'北京市','北京市','东城区','53538','朩三哥','13800138000',1589057401,1589057401,210,1);
/*!40000 ALTER TABLE `dd_addres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_ads`
--

DROP TABLE IF EXISTS `dd_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '0:启动广告\n1:banner广告\n2:职位广告',
  `title` varchar(45) NOT NULL,
  `subtitle` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `image` varchar(1024) NOT NULL,
  `url` varchar(45) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_ads`
--

LOCK TABLES `dd_ads` WRITE;
/*!40000 ALTER TABLE `dd_ads` DISABLE KEYS */;
INSERT INTO `dd_ads` VALUES (10,0,'光圈','光圈',10,'/uploads/images/e3/7876646083f6312e92c31b1a69c419.png','http://www.baidu.com',1587980459),(12,1,'数码狂欢季','',0,'/uploads/images/7d/ca3e0591c27dbd6e13188e7949b118.jpeg','https://www.taobao.com',1587982310),(13,1,'天然考姆','',0,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg','https://www.jd.com',1587982448),(14,1,'奢夏','',0,'/uploads/images/b4/afca0bb070c4e4c960c95b2b72ddc1.jpg','https://www.tmall.com',1587982525),(16,2,'聚名品','',0,'/uploads/images/c0/a9c79e4d9a405a1fbcec35144933de.jpg','https://ju.taobao.com/',1587982686),(17,2,'天猫51狂欢节','',0,'/uploads/images/25/2d26c27de0eaf1199f6dca3cda7aa7.gif','https://detail.tmall.hk/hk/item.htm?tbpm=1&id',1587982726),(18,2,'黑豆馏油软膏正品溜油银屑癬阴囊外阴肛门皮肤瘙痒外用抑菌止痒癣 ','',0,'/uploads/images/1b/4203fb051bc6d5195ca3631ea3d4fd.jpg','https://detail.tmall.com/item.htm?id=57364016',1587982778),(19,2,'盖饭','',0,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg','https://waimai.meituan.com/mobile/download/de',1587982882),(20,0,'青年企业家','青年企业家',10,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg','https://www.baidu.com',1587983001),(21,2,'职来职往','',0,'/uploads/images/21/98931d753de1519775318b95b4a931.png','http://www.chuangyidg.com/',1588351933),(22,0,'聚划算-51狂欢节','聚划算-51狂欢节',15,'/uploads/images/2c/3b58a5a4de2df11a958ac4f3c7d284.png','https://ju.taobao.com/',1588418189),(23,0,'片子裤','片子裤',15,'/uploads/images/e7/2da1f979830ced64bc2bcd7fd9100e.jpg','https://content.tmall.com/wow/pegasus/subject',1588418350),(24,2,'片仔癀','',0,'/uploads/images/88/acfa4582b60f5721aa68147eeab9a6.jpg','https://pianzaihuang.tmall.com/shop/view_shop',1588418723),(25,1,'片仔癀官方旗舰店','',0,'/uploads/images/88/acfa4582b60f5721aa68147eeab9a6.jpg','https://pianzaihuang.tmall.com/shop/view_shop',1588418864),(26,1,'百度科技','',0,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg','http://www.baidu.com',1588418988);
/*!40000 ALTER TABLE `dd_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_articles`
--

DROP TABLE IF EXISTS `dd_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_articles` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` int(32) NOT NULL COMMENT '1: 涨知识\n2:公告',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `desn` varchar(128) NOT NULL COMMENT '描述',
  `dandan_cost` varchar(45) NOT NULL COMMENT '蛋币',
  `much_money` varchar(45) NOT NULL COMMENT '多少钱',
  `image` varchar(255) NOT NULL COMMENT '缩略图',
  `body` varchar(1024) NOT NULL COMMENT '主体内容',
  `visible` varchar(255) NOT NULL COMMENT '谁可见',
  `pay_count` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_articles`
--

LOCK TABLES `dd_articles` WRITE;
/*!40000 ALTER TABLE `dd_articles` DISABLE KEYS */;
INSERT INTO `dd_articles` VALUES (9,2,'合伙人需知','合伙人需知描述','','','/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg','合伙人需知内容','[\"1\",\"4\",\"5\",\"6\"]',0,1587980296),(10,1,'员工学习资料描述2','员工学习资料描述2','5','0.5','/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg','员工学习资料内容','',0,1587980296),(12,2,'初级合伙人需知','初级合伙人需知描述','','','/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg','初级合伙人需知内容','[\"4\"]',0,1587980296);
/*!40000 ALTER TABLE `dd_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_bank_list`
--

DROP TABLE IF EXISTS `dd_bank_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_bank_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `bank_code` varchar(10) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='银行列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_bank_list`
--

LOCK TABLES `dd_bank_list` WRITE;
/*!40000 ALTER TABLE `dd_bank_list` DISABLE KEYS */;
INSERT INTO `dd_bank_list` VALUES (1,'中国工商银行','0102','ICBC','0.00'),(2,'中国农业银行','0103','ABC','0.00'),(3,'中国银行','0104','BOC','0.00'),(4,'中国建设银行','0105','CCB','0.00'),(5,'国家开发银行','0201','CDB','0.00'),(6,'中国农业发展银行','0203','ADBC','0.00'),(7,'交通银行','0301','BANKCOMM','0.00'),(8,'中信银行','0302','CITICBANK','0.00'),(9,'中国光大银行','0303','CEBBANK','0.00'),(10,'华夏银行','0304','HXBANK','0.00'),(11,'中国民生银行','0305','CMBC','0.00'),(12,'广东发展银行','0306','CGB','0.00'),(13,'平安银行','0307','PINGAN','0.00'),(14,'招商银行','0308','CMB','0.00'),(15,'兴业银行','0309','CIB','0.00'),(16,'上海浦东发展银行','0310','SPDB','0.00'),(17,'中国邮政储蓄银行','0403','PSBC','0.00'),(18,'北京银行','04031000','BJBANK','0.00'),(19,'中国邮政储蓄','0403','PSBC','0.00'),(20,'东莞农商银行','14156020','DRCBANK','0.00'),(21,'农村合作银行','0317','SDNXS','0.00'),(22,'东莞银行','04256020','GONGGUANBANK','0.00');
/*!40000 ALTER TABLE `dd_bank_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_dividend`
--

DROP TABLE IF EXISTS `dd_dividend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_dividend` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL DEFAULT '0' COMMENT '得到分红的用户',
  `amount` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '分红金额',
  `fid` int(32) NOT NULL DEFAULT '0',
  `jid` int(32) NOT NULL DEFAULT '0',
  `isWithdraw` int(11) NOT NULL DEFAULT '0',
  `proportion` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '分红比例',
  `wages` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '工价',
  `create_time` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `rid` int(32) DEFAULT NULL COMMENT '佣金的角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_dividend`
--

LOCK TABLES `dd_dividend` WRITE;
/*!40000 ALTER TABLE `dd_dividend` DISABLE KEYS */;
INSERT INTO `dd_dividend` VALUES (15,73,'0.3',11,3,1,'0.3','14.0',1589452386,'小时工',8),(16,73,'0.3',11,3,0,'0.3','14.0',1589452386,'小时工',11),(17,0,'13.46',11,3,0,'11.0','14.0',1589452386,'小时工',15),(18,73,'33.66',11,3,1,'27.5','14.0',1589452386,'小时工',7),(19,73,'20.20',11,3,0,'16.5','14.0',1589452386,'小时工',5),(20,76,'55.08',11,3,0,'45.0','14.0',1589452386,'小时工',4),(21,73,'10.0',20,7,1,'10.0','0.0',1589452394,'代理招聘',8),(22,73,'10.0',20,7,0,'10.0','0.0',1589452394,'代理招聘',11),(23,0,'140.25',20,7,0,'11.0','0.0',1589452394,'代理招聘',15),(24,73,'350.63',20,7,1,'27.5','0.0',1589452394,'代理招聘',7),(25,73,'210.38',20,7,0,'16.5','0.0',1589452395,'代理招聘',5),(26,73,'573.75',20,7,1,'45.0','0.0',1589452395,'代理招聘',4),(33,73,'0.3',19,6,0,'0.3','2500.0',1589509091,'同工同酬',8),(34,73,'0.3',19,6,0,'0.3','2500.0',1589509091,'同工同酬',11),(35,0,'303.95',19,6,0,'11.0','2500.0',1589509091,'同工同酬',15),(36,73,'759.88',19,6,0,'27.5','2500.0',1589509091,'同工同酬',7),(37,73,'455.93',19,6,0,'16.5','2500.0',1589509092,'同工同酬',5),(38,76,'1243.44',19,6,0,'45.0','2500.0',1589509092,'同工同酬',4);
/*!40000 ALTER TABLE `dd_dividend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_event_payslip`
--

DROP TABLE IF EXISTS `dd_event_payslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_event_payslip` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '工资条',
  `uid` int(32) NOT NULL COMMENT '接收工资条的用户',
  `pid` int(32) NOT NULL COMMENT '工人的上级,当工人点击确认工资时更新',
  `fid` int(32) NOT NULL COMMENT '工厂ID',
  `jid` int(32) NOT NULL COMMENT '职位ID',
  `sid` int(32) NOT NULL COMMENT '员工所属于的战略联盟ID',
  `type` int(10) NOT NULL COMMENT '工资条类型	1:小时工 2:同工同薪酬 3:代理招聘',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `t_basic_wages` varchar(45) NOT NULL COMMENT '同工同薪酬-基本薪资',
  `t_day` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-当月标准天数',
  `t_actual_day` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-实际出勤天数',
  `t_base_wages` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-底薪工资',
  `t_p_overtime` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-平时加班工时',
  `t_p_overtime_wages` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-平时加班工资',
  `t_p_weekend_overtime` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-周六.周日加班工时',
  `t_p_weekend_overtime_wages` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-周六.周日加班工资',
  `t_p_holiday_overtime` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-法定假日加班工时',
  `t_p_holiday_overtime_wages` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-法定假日加班工时工资',
  `t_p_other` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-其他',
  `t_d_food_expenses` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-伙食费',
  `t_d_taxes` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-税金',
  `t_d_social_securly` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-社保费',
  `t_d_accumulation_fund` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-公积金',
  `t_d_other` varchar(45) DEFAULT NULL COMMENT '同工同薪酬-其他扣款',
  `x_working_hours` varchar(45) DEFAULT NULL COMMENT '小时工-总工时',
  `x_price` varchar(45) DEFAULT NULL COMMENT '小时工-工价',
  `x_d_other` varchar(45) DEFAULT NULL COMMENT '小时工-其他扣款',
  `p_d_loan` varchar(45) DEFAULT NULL COMMENT '员工-预支费用',
  `x_subsidy` varchar(45) DEFAULT NULL COMMENT '小时工-补助',
  `x_d_insurance` varchar(45) DEFAULT NULL COMMENT '小时工-保险',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_event_payslip`
--

LOCK TABLES `dd_event_payslip` WRITE;
/*!40000 ALTER TABLE `dd_event_payslip` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_event_payslip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events`
--

DROP TABLE IF EXISTS `dd_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL COMMENT '申请人',
  `pid` int(32) NOT NULL COMMENT '上级ID',
  `etid` int(32) NOT NULL COMMENT '事件类型ID',
  `fid` int(32) NOT NULL,
  `jid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events`
--

LOCK TABLES `dd_events` WRITE;
/*!40000 ALTER TABLE `dd_events` DISABLE KEYS */;
INSERT INTO `dd_events` VALUES (4,72,0,2,0,0,1588294238,1588294238),(5,72,73,3,0,0,1588295390,1588295390),(6,73,73,4,0,0,1588296390,1588296390),(7,74,74,4,0,0,1588296390,1588296390),(14,72,73,4,0,0,1588307417,1588307417),(15,72,73,5,0,0,1588312891,1588312891),(25,73,73,6,12,4,1588484533,1588484533),(26,73,73,6,14,5,1588484537,1588484537),(27,73,0,1,16,0,1588502730,1588502730),(29,73,0,1,18,0,1588503725,1588503725),(32,73,73,5,0,0,1588612354,1588612354),(33,73,0,1,11,0,1588502730,1588502730),(34,73,0,1,12,0,1588503725,1588503725),(35,73,0,1,14,0,1588503725,1588503725),(39,73,0,1,19,0,1588831875,1588831875),(40,73,0,1,20,0,1588832550,1588832550),(41,210,76,6,11,3,1589054132,1589054132),(42,189,73,6,20,7,1589432212,1589432212),(43,203,76,6,19,6,1589440993,1589440993);
/*!40000 ALTER TABLE `dd_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_logs`
--

DROP TABLE IF EXISTS `dd_events_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_logs` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '审核角色',
  `eid` int(32) NOT NULL,
  `rid` int(32) NOT NULL DEFAULT '0' COMMENT '审核者的角色类型ID',
  `uid` int(32) NOT NULL DEFAULT '0' COMMENT '审核员ID',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remark` varchar(128) NOT NULL DEFAULT '暂无',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_logs`
--

LOCK TABLES `dd_events_logs` WRITE;
/*!40000 ALTER TABLE `dd_events_logs` DISABLE KEYS */;
INSERT INTO `dd_events_logs` VALUES (11,4,7,73,1,'同意通过',1588303183,1588303183),(15,5,7,73,1,'同意',1588304225,1588304225),(22,15,7,73,1,'同意',1588312923,1588312923),(24,17,15,73,1,'13',1588409366,1588409366),(25,18,15,73,1,'123',1588413369,1588413369),(29,19,12,73,1,'同意',1588429553,1588429553),(30,19,12,73,2,'123123',1588429732,1588429732),(39,26,4,73,1,'同意',1588490001,1588490001),(40,26,12,73,1,'同意',1588490097,1588490097),(44,26,8,73,1,'已到场',1588494823,1588494823),(45,29,8,73,1,'可以通过',1588523395,1588523395),(46,29,8,73,2,'修改一下',1588523630,1588523630),(47,29,8,73,2,'No',1588523718,1588523718),(48,29,8,73,1,'通过',1588523752,1588523752),(49,32,11,72,1,'同意',1588612864,1588612864),(50,27,8,72,1,'可以',1588614149,1588614149),(51,33,8,72,1,'通过',1588614308,1588614308),(52,34,8,72,1,'通过',1588614315,1588614315),(53,35,8,72,1,'通过',1588614323,1588614323),(69,6,15,73,1,'同意',1588692638,1588692638),(70,7,15,73,1,'同意',1588692725,1588692725),(72,14,15,73,1,'OK',1588694284,1588694284),(73,36,15,73,1,'123',1588757648,1588757648),(74,37,15,73,1,'123',1588757819,1588757819),(75,41,4,76,1,'同意',1589055250,1589055250),(76,41,12,73,1,'同意',1589056003,1589056003),(77,41,12,73,1,'同意',1589056084,1589056084),(78,41,12,73,1,'OK',1589056096,1589056096),(79,41,8,76,1,'同意',1589056189,1589056189),(80,29,8,76,1,'同意',1589097910,1589097910),(81,29,8,76,1,'同意',1589097957,1589097957),(82,33,12,73,1,'人事通过',1589098821,1589098821),(83,29,8,76,1,'已确认',1589100925,1589100925),(84,25,12,73,1,'同意',1589106751,1589106751),(85,25,12,73,2,'驳回',1589106764,1589106764),(86,39,8,73,1,'同意',1589121410,1589121410),(87,40,8,73,1,'同意',1589121421,1589121421),(88,42,4,73,1,'蚤休',1589432554,1589432554),(89,42,12,73,1,'通过',1589432596,1589432596),(90,42,8,73,1,'你好',1589432632,1589432632),(91,43,4,76,1,'通过',1589441045,1589441045),(92,43,8,76,1,'通过',1589441077,1589441077);
/*!40000 ALTER TABLE `dd_events_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_pay_slip`
--

DROP TABLE IF EXISTS `dd_events_pay_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_pay_slip` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `pwdid` varchar(45) NOT NULL DEFAULT '0' COMMENT '工资条详情ID',
  `type` varchar(45) NOT NULL DEFAULT '0' COMMENT '小时工\n同工同酬\n代理招聘',
  `tuid` varchar(45) NOT NULL DEFAULT '0' COMMENT '驻场老师id',
  `uid` varchar(45) NOT NULL DEFAULT '0' COMMENT '员工id',
  `pid` varchar(45) NOT NULL DEFAULT '0' COMMENT '员工的上级id',
  `sid` varchar(45) NOT NULL DEFAULT '0' COMMENT '员工上级的战略公司ID',
  `fid` varchar(45) NOT NULL DEFAULT '0' COMMENT '工厂ID',
  `jid` varchar(45) NOT NULL DEFAULT '0' COMMENT '职位ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '员工是否确认',
  `create_time` int(11) NOT NULL,
  `isWithdraw` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_pay_slip`
--

LOCK TABLES `dd_events_pay_slip` WRITE;
/*!40000 ALTER TABLE `dd_events_pay_slip` DISABLE KEYS */;
INSERT INTO `dd_events_pay_slip` VALUES (116,'12','小时工工资条','73','210','76','73','11','3',1,1589431513,0),(118,'3','代理招聘工资条','73','189','73','73','20','7',0,1589436954,0),(126,'10','同工同酬工资条','73','203','76','73','19','6',1,1589509045,1);
/*!40000 ALTER TABLE `dd_events_pay_slip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_pay_slip_agent`
--

DROP TABLE IF EXISTS `dd_events_pay_slip_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_pay_slip_agent` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sign_unit_price` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '签单价',
  `taxes` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '税费',
  `salesperson_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '业务员提成',
  `resident_teacher_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '驻场老师提成',
  `management_fee` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '管理费',
  `primary_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '初级分红',
  `advanced_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '高级分红',
  `strategic_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '战略分红',
  `dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '蛋蛋分红',
  `uid` int(32) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '财务是否审核',
  `settlement_method` varchar(45) NOT NULL COMMENT '结算方式',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_pay_slip_agent`
--

LOCK TABLES `dd_events_pay_slip_agent` WRITE;
/*!40000 ALTER TABLE `dd_events_pay_slip_agent` DISABLE KEYS */;
INSERT INTO `dd_events_pay_slip_agent` VALUES (3,'2300.0','15.0','10.0','10.0','500.0','573.75','210.38','350.63','140.25',189,1,'',0);
/*!40000 ALTER TABLE `dd_events_pay_slip_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_pay_slip_epfew`
--

DROP TABLE IF EXISTS `dd_events_pay_slip_epfew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_pay_slip_epfew` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '同工同酬ID',
  `sign_unit_price` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '签单价',
  `loan` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '借款',
  `other_additions` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '其他加项',
  `other_additions_remarks` varchar(45) NOT NULL DEFAULT '' COMMENT '其他加项（备注）',
  `other_deductions` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '其他扣款',
  `other_deductions_remarks` varchar(45) NOT NULL DEFAULT '' COMMENT '其他扣款（备注）',
  `employee_unit_price` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '员工单价',
  `salesperson_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '业务员提成',
  `resident_teacher_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '驻场老师提成',
  `overtime_work` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '平时加班工时',
  `overtime_pay` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '平时加班工资',
  `overtime_work_on_weekends` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '周末加班工时',
  `eeekend_overtime_pay` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '周末加班工资',
  `working_overtime_on_holidays` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '法定节假日加班工时',
  `overtime_pay_on_holidays` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '法定节假日加班工资',
  `food_expenses` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '伙食费',
  `taxes` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '税费',
  `social_security_charges` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '社保费',
  `provident_fund` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '公积金',
  `standard_days_of_the_month` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '当月标准天数',
  `actual_attendance_days` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '实际出勤天数',
  `withholding_payments` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '代扣代缴款项',
  `primary_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '初级分红',
  `advanced_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '高级分红',
  `strategic_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '战略分红',
  `dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '蛋蛋分红',
  `uid` int(32) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '财务是否审核',
  `settlement_method` varchar(45) NOT NULL DEFAULT '' COMMENT '结算方式',
  `management_fee` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '管理费',
  `actual_salary` varchar(45) NOT NULL DEFAULT '0.0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_pay_slip_epfew`
--

LOCK TABLES `dd_events_pay_slip_epfew` WRITE;
/*!40000 ALTER TABLE `dd_events_pay_slip_epfew` DISABLE KEYS */;
INSERT INTO `dd_events_pay_slip_epfew` VALUES (10,'2800.0','0.0','0.0','暂无','0.0','暂无','2500.0','0.3','0.3','0.0','0.0','0.0','0.0','0.0','0.0','0.0','20.0','0.0','0.0','20.83','20.83','0.0','1243.44','455.93','759.88','303.95',203,1,'','0.0','2480.00',0,1589509091);
/*!40000 ALTER TABLE `dd_events_pay_slip_epfew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_pay_slip_hourly_worker`
--

DROP TABLE IF EXISTS `dd_events_pay_slip_hourly_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_pay_slip_hourly_worker` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sign_unit_price` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '签单价',
  `insurance` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '保险费',
  `taxes` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '税费',
  `loan` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '借款',
  `other_deductions` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '其他扣款',
  `other_deductions_remarks` varchar(45) NOT NULL COMMENT '其他减项备注',
  `other_additions` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '其他加项',
  `other_additions_remarks` varchar(45) NOT NULL COMMENT '其他加项备注',
  `employee_unit_price` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '员工单价',
  `total_working_hours` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '总工时',
  `salesperson_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '业务员提成',
  `resident_teacher_commission` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '驻场老师提成',
  `primary_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '初级分红',
  `advanced_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '高级分红',
  `strategic_dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '战略分红',
  `dividend` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '蛋蛋分红',
  `settlement_method` varchar(45) NOT NULL COMMENT '结算方式',
  `management_fee` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '管理费',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '财务是否审核',
  `uid` int(32) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `create_time` int(11) NOT NULL,
  `actual_salary` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '实发工资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_pay_slip_hourly_worker`
--

LOCK TABLES `dd_events_pay_slip_hourly_worker` WRITE;
/*!40000 ALTER TABLE `dd_events_pay_slip_hourly_worker` DISABLE KEYS */;
INSERT INTO `dd_events_pay_slip_hourly_worker` VALUES (12,'15.0','4.0','5.0','112','3.0','公共设施损坏','12.0','餐补','14.0','16.0','0.3','0.3','55.08','20.20','33.66','13.46','','0.0',1,210,1589431513,'112.0');
/*!40000 ALTER TABLE `dd_events_pay_slip_hourly_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_staff`
--

DROP TABLE IF EXISTS `dd_events_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_staff` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '员工事件(工作流)\n请假\n报销\n离职\n打卡',
  `uid` int(32) NOT NULL,
  `fid` int(32) NOT NULL,
  `jid` int(32) NOT NULL,
  `pid` int(32) NOT NULL,
  `etid` int(32) NOT NULL,
  `start_time` varchar(32) NOT NULL,
  `end_time` varchar(32) NOT NULL,
  `remark` varchar(128) NOT NULL,
  `cost` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '报销、预支金额',
  `images` varchar(1024) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `hour` varchar(10) NOT NULL DEFAULT '0.0' COMMENT '打卡小时数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有效果',
  `total` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '预支时的总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_staff`
--

LOCK TABLES `dd_events_staff` WRITE;
/*!40000 ALTER TABLE `dd_events_staff` DISABLE KEYS */;
INSERT INTO `dd_events_staff` VALUES (9,73,14,5,73,8,'','','你的眼睛大','2222','[\"\\/uploads\\/images\\/0c\\/0fa7830e9d87de657bcaed6ee2204a.jpg\",\"\\/uploads\\/images\\/ff\\/6e5133f7877f2b9c405f6b0298bab5.jpg\",\"\\/uploads\\/images\\/1b\\/b44b1887ef76d1335167409790d625.jpg\"]',1588595721,1589243422,'',2,''),(23,73,14,5,73,8,'','','报销','500','[\"\\/uploads\\/images\\/e7\\/4a9dc9e338648359e6a8c77d5e6903.jpg\",\"\\/uploads\\/images\\/23\\/6c215376ac8d1628a5fe268633209d.jpg\",\"\\/uploads\\/images\\/de\\/00dc3ea4ded9d93573939b454d476f.jpg\",\"\\/uploads\\/images\\/1b\\/b44b1887ef76d1335167409790d625.jpg\"]',1588630659,1589124996,'',2,''),(24,73,14,5,73,10,'','2020/05/05','离职','','',1588630852,1588630852,'',0,''),(25,73,14,5,73,11,'','','','','',1588721698,1589235684,'8',1,''),(27,210,11,3,76,11,'','','','','',1589056788,1589235648,'8',1,''),(28,210,11,3,76,7,'2020/05/10 08:30','2020/05/10 12:00','例假','','',1589058544,1589058544,'3.5',0,''),(29,210,11,3,76,8,'','','报销阳光','125','[\"\\/uploads\\/images\\/de\\/00dc3ea4ded9d93573939b454d476f.jpg\"]',1589089542,1589104219,'',1,''),(33,210,11,3,76,7,'2020/05/10 16:30','2020/05/11 08:30','事假','','',1589093209,1589093209,'1.5',0,''),(35,210,11,3,76,11,'','','','','',1589188470,1589235626,'8',1,''),(41,210,11,3,76,12,'','','','112','',1589241639,1589243460,'0.0',1,'0.0'),(42,189,20,7,73,7,'2020/05/14 15:00','2020/05/14 16:30','事假','0.0','',1589432817,1589432817,'1.5',0,'0.0'),(43,189,20,7,73,11,'','','','0.0','',1589432910,1589432910,'10',0,'0.0'),(44,189,20,7,73,11,'','','','0.0','',1589432936,1589432936,'10',0,'0.0'),(45,189,20,7,73,11,'','','','0.0','',1589432943,1589432943,'8',0,'0.0'),(46,189,20,7,73,11,'','','','0.0','',1589432951,1589432951,'12',0,'0.0'),(47,203,19,6,76,11,'','','','0.0','',1589441232,1589441232,'10',0,'0.0'),(48,210,11,3,76,11,'','','','0.0','',1589498717,1589498717,'10',0,'0.0'),(49,203,19,6,76,12,'','','','0','',1589511576,1589511576,'0.0',0,'0.0'),(50,203,19,6,76,12,'','','','0','',1589511642,1589511642,'0.0',0,'0.0');
/*!40000 ALTER TABLE `dd_events_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_staff_logs`
--

DROP TABLE IF EXISTS `dd_events_staff_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_staff_logs` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `eid` int(32) NOT NULL COMMENT '对应dd_events_staff事件ID',
  `uid` varchar(45) NOT NULL COMMENT '审核用户ID',
  `status` tinyint(4) NOT NULL,
  `remark` varchar(45) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `rid` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_staff_logs`
--

LOCK TABLES `dd_events_staff_logs` WRITE;
/*!40000 ALTER TABLE `dd_events_staff_logs` DISABLE KEYS */;
INSERT INTO `dd_events_staff_logs` VALUES (1,22,'73',1,'通过',1588629007,1588629007,8),(2,23,'73',2,'金额不对',1588629007,1588629007,8),(3,22,'73',2,'驳回',1588658242,1588658242,8),(4,28,'76',2,'驳回',1589098674,1589098674,8),(5,33,'76',1,'同意',1589098778,1589098778,8),(6,33,'73',1,'人事同意',1589099065,1589099065,12),(7,29,'76',1,'已确认',1589101007,1589101007,8),(8,29,'73',1,'确认',1589101027,1589101027,12),(9,29,'73',1,'已确认',1589101425,1589101425,12),(10,29,'73',1,'同意',1589101483,1589101483,12),(11,29,'73',2,'驳回',1589101502,1589101502,12),(12,29,'73',1,'通过',1589101521,1589101521,12),(13,29,'73',2,'驳回',1589103659,1589103659,12),(14,29,'73',2,'123123',1589104206,1589104206,13),(15,29,'73',1,'同意',1589104219,1589104219,13),(16,24,'73',1,'提交到人事部审核',1589109189,1589109189,8),(17,23,'73',2,'这是一个测试',1589124996,1589124996,13),(18,37,'73',2,'测试',1589211752,1589211752,13),(19,35,'76',1,'确认',1589235626,1589235626,8),(21,27,'76',1,'确认',1589235648,1589235648,8),(22,25,'76',1,'确认',1589235684,1589235684,8),(23,9,'73',2,'不通过',1589243422,1589243422,13),(24,41,'73',1,'测试---同意',1589243460,1589243460,13);
/*!40000 ALTER TABLE `dd_events_staff_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_events_type`
--

DROP TABLE IF EXISTS `dd_events_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_events_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL COMMENT '事件名称',
  `name` varchar(45) NOT NULL COMMENT '事件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_events_type`
--

LOCK TABLES `dd_events_type` WRITE;
/*!40000 ALTER TABLE `dd_events_type` DISABLE KEYS */;
INSERT INTO `dd_events_type` VALUES (1,'工厂录入','factory_entry'),(2,'初级合伙人申请','junior_partner_application'),(3,'高级合伙人申请','senior_partner_application'),(4,'战略联盟申请','strategic_alliance_application'),(5,'业务员申请','salesman_application'),(6,'职位报名申请','position_application'),(7,'请假申请','leave_application'),(8,'报销申请','claim_for_reimbursement'),(9,'工资条确认申请','payslip_confirmation_application'),(10,'离职申请','quit_application'),(11,'打卡','punch_the_clock'),(12,'预支申请','advance_payments');
/*!40000 ALTER TABLE `dd_events_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_basic_information`
--

DROP TABLE IF EXISTS `dd_factory_basic_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_basic_information` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `factory_name` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(45) NOT NULL,
  `addres` varchar(45) NOT NULL,
  `location` varchar(128) NOT NULL,
  `longitude` varchar(45) NOT NULL COMMENT '经度',
  `latitude` varchar(45) NOT NULL COMMENT '纬度',
  `logo` varchar(128) NOT NULL DEFAULT '/resources/avatar.png',
  `uid` int(32) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(45) NOT NULL DEFAULT '暂无',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_basic_information`
--

LOCK TABLES `dd_factory_basic_information` WRITE;
/*!40000 ALTER TABLE `dd_factory_basic_information` DISABLE KEYS */;
INSERT INTO `dd_factory_basic_information` VALUES (11,'广东祥新光电科技有限公司','广东省','佛山市','高明区','升平街与肖陵大道交叉口东北150米','112.809865,22.933733','112.809865','22.933733','/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',73,1,'备注备注备注备注',1588193089,1588363589),(12,'德曼木业有限公司','广东省','东莞市','东莞市','桥头镇大洲村第一工业区东新路32号','114.053624,23.022759','114.053624','23.022759','/uploads/images/7d/8e2f67ee61334d302594d87428a7e8.jpg',73,1,'',1588353785,1588354764),(14,'东莞晋杨电子有限公司','广东省','东莞市','东莞市','常平镇岗梓加油站对面','113.967027,22.983452','113.967027','22.983452','/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',73,1,'123123',1588355558,1588495920),(16,'东莞艾华电子有限公司','广东省','东莞市','东莞市','石排镇福地市场福隆第一工业区','113.960887,23.08193','113.960887','23.08193','/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',73,1,'东莞艾华电子有限公司',1588502730,1588614149),(18,'东莞市金鸿盛电器有限公司','广东省','东莞市','东莞市','东平大道18号','114.037376,23.018149','114.037376','23.018149','/uploads/images/f3/211736660d784a76dba0288ae62c3b.jpg',73,1,'合同已过期',1588503725,1588523752),(19,'TUV SOD测试中心','广东省','深圳市','南山区','关口二路智恒产业园6栋3楼','113.90831,22.550245','113.90831','22.550245','/uploads/images/eb/bd44c3d061881538ea5dadd4ef67bf.jpg',73,1,'',1588831875,1589121410),(20,'华都鞋业','广东省','深圳市','光明区','玉泉东路21号','113.90443,22.715592','113.90443','22.715592','/uploads/images/ff/c21af64854030359d0efd5ad0ffa73.jpg',73,1,'',1588832550,1589121421);
/*!40000 ALTER TABLE `dd_factory_basic_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_employed_users`
--

DROP TABLE IF EXISTS `dd_factory_employed_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_employed_users` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `fid` int(32) NOT NULL,
  `jid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '入职时间',
  `update_time` int(11) NOT NULL COMMENT '有可能是离职时间,但不一定',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否离职',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_employed_users`
--

LOCK TABLES `dd_factory_employed_users` WRITE;
/*!40000 ALTER TABLE `dd_factory_employed_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_factory_employed_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_environment_and_treatment`
--

DROP TABLE IF EXISTS `dd_factory_environment_and_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_environment_and_treatment` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `age_requirements` varchar(45) NOT NULL COMMENT '年龄要求',
  `working_hours` varchar(45) NOT NULL COMMENT '工作时长',
  `rest_day_count` int(10) NOT NULL COMMENT '每月休息多少天',
  `way_to_work` varchar(45) NOT NULL COMMENT '上班方式',
  `is_insurance` varchar(45) NOT NULL COMMENT '是否有保险',
  `is_experience` varchar(45) NOT NULL COMMENT '是否体验',
  `dormitory_location` varchar(45) NOT NULL COMMENT '宿舍位置',
  `people_of_dormitory` varchar(45) NOT NULL COMMENT '宿舍住多少人',
  `is_toilet` varchar(45) NOT NULL COMMENT '是否有厕所',
  `dietary_standard` varchar(45) NOT NULL COMMENT '膳食标准',
  `night_shift_allowance` varchar(45) NOT NULL COMMENT '夜班补贴',
  `ethnic_restrictions` varchar(45) NOT NULL COMMENT '民族限制',
  `required_certificates` varchar(45) NOT NULL COMMENT '所需证件',
  `training_time` varchar(45) NOT NULL COMMENT '培训时间',
  `training_content` varchar(128) NOT NULL COMMENT '培训内容',
  `fid` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_environment_and_treatment`
--

LOCK TABLES `dd_factory_environment_and_treatment` WRITE;
/*!40000 ALTER TABLE `dd_factory_environment_and_treatment` DISABLE KEYS */;
INSERT INTO `dd_factory_environment_and_treatment` VALUES (3,'年龄要求','10',4,'上班方式','是否有保险','是否体验','宿舍位置','宿舍住多少人','是否有厕所','膳食标准','夜班补贴','民族限制','所需证件','培训时间','培训内容',11),(4,'18-50','11',2,'走动式站班','有','否','厂里宿舍','8人','是','工作餐','满夜班满8小时补助1小时','四大民族已满','身份证','入职第一天','岗位培训',12),(5,'18-45','11小时',4,'白班坐班，少部分夜班','是','否','厂内住宿','8人','是','工作餐','5元/晚','四大民族已满','身份证','入职第一天','岗位培训',13),(6,'18-45','11小时',4,'白班坐班，少部分夜班','是','否','厂内住宿','8人','是','工作餐','5元/晚','四大民族已满','身份证','入职第一天','岗位培训',14),(8,'18-45岁','11-12小时',4,'白班坐班','是','否','厂内宿舍','8人','有','工作餐','无','四大民族已满','身份证','入职第一天','岗位培训',16),(9,'18-50','10-12',2,'长白班坐班/站班','是','否','厂区内','6-8','是','工作餐','否','四大民族','身份证原件，身份证复印件2张，彩色一寸照片2张','入职当天','岗前培训',18),(10,'18-45岁','11-12小时',4,'白班坐班','是','否','厂内宿舍','8人','有','工作餐','无','四大民族已满','身份证','入职第一天','岗位培训',16),(11,'20-38','8',8,'长白班','有','无','无','无','无','无','12元/小时','四大民族','身份证证、毕业明证明','入职当天','岗前培训',19),(12,'18-48','8',8,'长白班','无','无','无','无','无','无','无','不限','身份证','入职当天','岗前培训',20);
/*!40000 ALTER TABLE `dd_factory_environment_and_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_hr`
--

DROP TABLE IF EXISTS `dd_factory_hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_hr` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `fid` int(32) NOT NULL,
  `score` int(10) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_hr`
--

LOCK TABLES `dd_factory_hr` WRITE;
/*!40000 ALTER TABLE `dd_factory_hr` DISABLE KEYS */;
INSERT INTO `dd_factory_hr` VALUES (9,72,14,0,1588447400,1588447400),(10,72,12,0,1588447405,1588447405),(11,72,11,0,1588447410,1588447410),(12,73,16,0,1588614399,1588614399),(13,73,18,0,1588614405,1588614405),(14,73,11,0,1588614412,1588614412),(15,74,11,0,1588614414,1588614414),(16,76,11,0,1588614416,1588614416),(17,73,12,0,1588614426,1588614426),(18,74,12,0,1588614428,1588614428),(19,76,12,0,1588614430,1588614430),(20,73,14,0,1588614437,1588614437),(21,74,14,0,1588614439,1588614439),(22,76,14,0,1588614441,1588614441),(23,72,18,0,1589036147,1589036147),(24,76,20,0,1589135372,1589135372),(25,76,19,0,1589135386,1589135386);
/*!40000 ALTER TABLE `dd_factory_hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_images`
--

DROP TABLE IF EXISTS `dd_factory_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_images` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `fid` int(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_images`
--

LOCK TABLES `dd_factory_images` WRITE;
/*!40000 ALTER TABLE `dd_factory_images` DISABLE KEYS */;
INSERT INTO `dd_factory_images` VALUES (22,11,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg'),(23,11,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg'),(24,11,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg'),(25,12,'/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg'),(26,12,'/uploads/images/dd/eece01e48b5d1244299b197fb97b84.jpg'),(27,12,'/uploads/images/f8/0301c2c0a8849a3142d703bf7554da.jpg'),(28,13,'/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg'),(29,13,'/uploads/images/dd/eece01e48b5d1244299b197fb97b84.jpg'),(30,13,'/uploads/images/f8/0301c2c0a8849a3142d703bf7554da.jpg'),(31,14,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg'),(32,14,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg'),(39,18,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg'),(40,18,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg'),(41,18,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg'),(42,18,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg'),(43,16,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg'),(44,16,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg'),(45,16,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg'),(46,16,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg'),(47,19,'/uploads/images/09/5fba79eeb21291265189a4d7029795.jpg'),(48,19,'/uploads/images/03/cc0681b9f6d6da74a048a16f5dfcda.jpg'),(49,20,'/uploads/images/4f/cb9df816d7caf98226bbe8a86c050d.jpg'),(50,20,'/uploads/images/44/7c3aecaa093a8c487cc10a2c766106.jpg'),(51,20,'/uploads/images/6f/d99fb0412f2bc5c5c5e95b5d318298.jpg');
/*!40000 ALTER TABLE `dd_factory_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_information`
--

DROP TABLE IF EXISTS `dd_factory_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_information` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `nature_of_plant` varchar(45) NOT NULL COMMENT '厂房性质',
  `nature_of_enterprise` varchar(45) NOT NULL COMMENT '企业性质',
  `fixed_assets` varchar(45) NOT NULL COMMENT '固定资产',
  `registered_capital` varchar(45) NOT NULL COMMENT '注册资金',
  `plant_area` varchar(45) NOT NULL COMMENT '工厂面积',
  `ratio_of_men_to_women` varchar(45) NOT NULL COMMENT '男女比例',
  `existing_employees` varchar(45) NOT NULL COMMENT '现有员工',
  `average_age` varchar(45) NOT NULL COMMENT '平均年龄',
  `existing_recruitment_channels` varchar(45) NOT NULL COMMENT '现有招聘途径',
  `stable_age` varchar(45) NOT NULL COMMENT '稳定年龄段',
  `expected_demand` int(10) NOT NULL DEFAULT '0' COMMENT '预计需求量',
  `used_jobs` varchar(128) NOT NULL DEFAULT '[]' COMMENT '用过的工种',
  `bad_jobs` varchar(128) NOT NULL DEFAULT '[]' COMMENT '不好招的工种',
  `labor_shortage_month` varchar(128) NOT NULL DEFAULT '[]' COMMENT '用工紧张月',
  `fid` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_information`
--

LOCK TABLES `dd_factory_information` WRITE;
/*!40000 ALTER TABLE `dd_factory_information` DISABLE KEYS */;
INSERT INTO `dd_factory_information` VALUES (3,'租赁','国营企业','固定资产','注册资金','工厂面积','男女比例','现有员工','平均年龄','现有招聘途径','稳定年龄段',100,'[\"小时工\",\"社会工\"]','[\"学生工\",\"同工同酬\"]','[\"1\",\"2\",\"3\",\"12\"]',11),(4,'租赁','国营企业','35000000','50000000','60000','无','2000','30-50','自招','30-50',50,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"2\",\"3\"]',12),(5,'租赁','国营企业','20000000','30000000','10000','无','800','18-45','自招','18-45',200,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"2\",\"3\"]',13),(6,'租赁','国营企业','20000000','30000000','10000','无','800','18-45','自招','18-45',200,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"3\",\"4\"]',14),(8,'租赁','私营企业','15000000','25000000','10000','全女','1200','18-45岁','自招','18-45岁',50,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"2\",\"3\",\"4\"]',16),(9,'自建','私营企业','未知','500万','500人','男女比例3:1','500人','18-45','自招','18-45',100,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"2\",\"3\"]',18),(10,'自建','私营企业','15000000','25000000','10000','全女','1200','18-45岁','自招','18-45岁',50,'[\"小时工\"]','[\"小时工\"]','[\"1\",\"2\",\"3\",\"4\"]',16),(11,'租赁','私营企业','固定资产','注册资金','5000','男女比例','600','平均年龄','自招','稳定年龄段',20,'[\"同工同酬\"]','[\"同工同酬\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]',19),(12,'借用','私营企业','1000','1000万','1000','全男','5000','18-48岁','网招','18-48',100,'[\"代理招聘\"]','[\"代理招聘\"]','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]',20);
/*!40000 ALTER TABLE `dd_factory_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_job_type`
--

DROP TABLE IF EXISTS `dd_factory_job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_job_type`
--

LOCK TABLES `dd_factory_job_type` WRITE;
/*!40000 ALTER TABLE `dd_factory_job_type` DISABLE KEYS */;
INSERT INTO `dd_factory_job_type` VALUES (1,'全部'),(2,'普通职位'),(3,'技工职位'),(4,'小时工'),(5,'学生工'),(6,'社会工'),(7,'热招中');
/*!40000 ALTER TABLE `dd_factory_job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_jobs`
--

DROP TABLE IF EXISTS `dd_factory_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_jobs` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `fid` int(32) NOT NULL COMMENT '工厂ID',
  `job_name` varchar(45) NOT NULL COMMENT '职位名称',
  `job_type` varchar(45) NOT NULL COMMENT '职位类型',
  `isHot` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否热招',
  `minimum_search_range` int(10) NOT NULL COMMENT '最小薪资范围',
  `maximum_salary_range` int(10) NOT NULL COMMENT '最大薪资范围',
  `base_salary` varchar(10) NOT NULL COMMENT '底薪-基本工资(¥/小时)',
  `number_of_recruiters` int(10) NOT NULL COMMENT '招聘人数',
  `number_of_people_recruited` int(10) NOT NULL COMMENT '已招人数',
  `job_payroll_time` varchar(45) NOT NULL COMMENT '发薪日期',
  `certificates` varchar(45) NOT NULL COMMENT '身份证',
  `phto` varchar(45) NOT NULL COMMENT '照片',
  `diploma` varchar(45) NOT NULL COMMENT '毕业证',
  `diploma_copy` varchar(45) NOT NULL COMMENT '毕业证明复印件',
  `dust_free_clothes` varchar(45) NOT NULL COMMENT '无尘服',
  `face_recognition` varchar(45) NOT NULL COMMENT '人脸识别',
  `tattoo` varchar(45) NOT NULL COMMENT '纹身',
  `smoke_scars` varchar(45) NOT NULL COMMENT '烟疤',
  `english_requirements` varchar(45) NOT NULL COMMENT '英文要求',
  `arithmetic_requirements` varchar(45) NOT NULL COMMENT '算术要求',
  `in_vivo_examination` varchar(45) NOT NULL COMMENT '体内检查',
  `job_environment` varchar(45) NOT NULL COMMENT '工作环境',
  `traffic` varchar(45) NOT NULL COMMENT '交通',
  `teturn_to_factory_rules` varchar(45) NOT NULL COMMENT '返厂规定',
  `job_description` varchar(45) NOT NULL COMMENT '工作描述',
  `contract_note` varchar(45) NOT NULL COMMENT '合同说明',
  `salary_structure` varchar(45) NOT NULL COMMENT '薪资结构',
  `reminder` varchar(45) NOT NULL COMMENT '温馨提示',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未发布 1已发布',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_jobs`
--

LOCK TABLES `dd_factory_jobs` WRITE;
/*!40000 ALTER TABLE `dd_factory_jobs` DISABLE KEYS */;
INSERT INTO `dd_factory_jobs` VALUES (3,11,'这是一个职位名称','2',1,4000,6000,'15',100,1,'发薪日期','身份证信息','照片','毕业证','毕业证明复印件','无尘服','人脸识别','纹身','烟疤','英文要求','算术要求','体内检查','工作环境','交通','返厂规定','            职位说明          ','            合同说明          ','            薪资结构          ','            温馨提示          ',1,1588245225,1589056189),(4,12,'普工','4',1,5000,7000,'18',48,0,'次月25号发上月工资','带磁身份证','2张','不要','本人身份证原件','无','无','无','无','无要求','无要求','查','没有空调，有风扇，走动站班','厂里住宿','无','  打磨，木工，抬门','  与企业指定人力资源公司签订','  工作满一个月18元，有全勤奖，岗位津贴，奖金','  ',1,1588355043,1588355063),(5,14,'普工','4',1,3600,4500,'14',199,183,'月底发上月工资','本人证件原件','2张','不用','不用','无','无','无','无','无','无','查','白班坐班','','','  装配，品检','  与企业指定人力资源公司签订','  工作满一个月14元/小时','  ',1,1588355839,1588494823),(6,19,'机床师傅','3',1,2300,6000,'21',50,1,'次月25号发上月工资','身份证','照片','毕业证','本人身份证原件','无尘服','人脸识别','纹身','烟疤','无','算术要求','体内检查','没有空调，有风扇，走动站班','交通','返厂规定',' 职位说明 ',' 合同说明 ',' 薪资结构 ',' 温馨提示温馨提示温馨提示温馨提示 ',1,1589432026,1589441077),(7,20,'质检师','1',0,2600,6800,'20',50,1,'次月25号发上月工资','身份证信息','照片','毕业证','毕业证明复印件','无尘服','人脸识别','纹身','烟疤','英文要求','算术要求','体内检查','工作环境','交通','返厂规定',' 职位说明 ',' 合同说明 ',' 薪资结构 ',' 温馨提示 ',1,1589432133,1589433198);
/*!40000 ALTER TABLE `dd_factory_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_plant_related_personnel`
--

DROP TABLE IF EXISTS `dd_factory_plant_related_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_plant_related_personnel` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `receptionist` varchar(45) NOT NULL COMMENT '接待人',
  `receptionist_phone` varchar(45) NOT NULL COMMENT '接待人联系电话',
  `houseparent` varchar(45) NOT NULL COMMENT '宿舍管理员',
  `houseparent_phone` varchar(45) NOT NULL COMMENT '宿舍管理员联系电话',
  `follow_up_person` varchar(45) NOT NULL COMMENT '跟进人',
  `follow_up_person_phone` varchar(45) NOT NULL COMMENT '跟进人联系电话',
  `fid` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_plant_related_personnel`
--

LOCK TABLES `dd_factory_plant_related_personnel` WRITE;
/*!40000 ALTER TABLE `dd_factory_plant_related_personnel` DISABLE KEYS */;
INSERT INTO `dd_factory_plant_related_personnel` VALUES (3,'接待人','接待人联系电话','宿舍管理员','宿舍管理员联系电话','跟进人','跟进人联系电话',11),(4,'田喆','13790514310','','','刘朋','13412924555',12),(5,'张国东','13790648369','李小姐','','刘朋','13412924555',13),(6,'张国东','13790648369','李小姐','','刘朋','13412924555',14),(8,'张先生','13790648369','杜小姐','','于宏','13428425554',16),(9,'冷金龙','13928175792','','','刘朋','13412924555',18),(10,'张先生','13790648369','杜小姐','','于宏','13428425554',16),(11,'承先生','13800138000','','','张国东','',19),(12,'梅小姐','','','','张国东','',20);
/*!40000 ALTER TABLE `dd_factory_plant_related_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_signing_information`
--

DROP TABLE IF EXISTS `dd_factory_signing_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_signing_information` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cooperation_mode` varchar(45) NOT NULL COMMENT '合作方式',
  `salary_payment_method` varchar(45) NOT NULL COMMENT '工资发放方式',
  `signed_unit_price` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '签单价格',
  `employee_unit_price` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '员工单价',
  `commission_for_teacher` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '老师提成',
  `commission_for_salesman` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '业务员提成',
  `settlement_date` varchar(45) NOT NULL COMMENT '合同届满薪资结算日期',
  `startTime` varchar(45) NOT NULL COMMENT '合同有效期-起始日期',
  `endTime` varchar(45) NOT NULL COMMENT '合同有效期-结束日期',
  `fid` int(32) NOT NULL COMMENT '工厂ID',
  `income_tax` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '税金\n',
  `insurance_premium` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '保险费',
  `management_expense` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '管理费',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `overtime_pay` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '平时加班工资',
  `weekend_overtime_pay` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '周末加班工资',
  `overtim_pay_on_holidays` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '法定节假日加班工资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_signing_information`
--

LOCK TABLES `dd_factory_signing_information` WRITE;
/*!40000 ALTER TABLE `dd_factory_signing_information` DISABLE KEYS */;
INSERT INTO `dd_factory_signing_information` VALUES (10,'小时工','蛋蛋发放','15.0','14.0','0.3','0.3','2020-04-30','2020-04-30','2021-04-30',11,'5.0','4.0','0.00',0,0,'0.0','0.0','0.0'),(11,'小时工','蛋蛋发放','20.0','20.0','0.3','0.6','2019-12-17','2019-08-01','2020-08-31',12,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(12,'小时工','蛋蛋发放','14.0','14.0','0.6','0.6','2018-12-17','2019-08-01','2020-12-31',13,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(13,'小时工','蛋蛋发放','14.0','14.0','0.6','0.6','2019-12-17','2019-08-01','2020-12-31',14,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(14,'小时工','蛋蛋发放','13.0','13.0','0.6','0.3','2023-10-01','2019-10-01','2022-02-28',15,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(15,'小时工','蛋蛋发放','13.0','13.0','0.3','0.6','2023-10-01','2019-10-01','2023-10-01',16,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(16,'小时工','蛋蛋发放','13.0','13.0','0.6','0.6','2020-01-31','2019-10-01','2020-01-01',18,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(17,'小时工','蛋蛋发放','13','13','0.3','0.6','2023-10-01','2019-10-01','2023-10-01',16,'0.0','0.0','0.00',0,0,'0.0','0.0','0.0'),(18,'同工同酬','蛋蛋发放','2800.0','2500.0','0.3','0.3','2020-05-07','2020-05-07','2021-05-07',19,'20.0','0.0','0.00',0,1589135265,'0.0','0.0','0.0'),(19,'代理招聘','其他','2300.0','0.0','10.0','10.0','2020-05-07','2020-05-07','2021-05-07',20,'15','0.0','2300',0,1589436029,'0.0','0.0','0.0');
/*!40000 ALTER TABLE `dd_factory_signing_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_staff`
--

DROP TABLE IF EXISTS `dd_factory_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_staff` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL COMMENT '员工ID',
  `fid` int(32) NOT NULL COMMENT '工厂ID',
  `jid` int(32) NOT NULL COMMENT '职位ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '默认1:在职 0离职',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_staff`
--

LOCK TABLES `dd_factory_staff` WRITE;
/*!40000 ALTER TABLE `dd_factory_staff` DISABLE KEYS */;
INSERT INTO `dd_factory_staff` VALUES (2,73,14,5,1,1588490816,1588490816,73),(3,210,11,3,1,1589056189,1589056189,76),(5,189,20,7,1,1589432632,1589432632,73),(6,203,19,6,1,1589441077,1589441077,76);
/*!40000 ALTER TABLE `dd_factory_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_factory_teacher`
--

DROP TABLE IF EXISTS `dd_factory_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_factory_teacher` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `fid` int(32) NOT NULL,
  `score` varchar(10) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_factory_teacher`
--

LOCK TABLES `dd_factory_teacher` WRITE;
/*!40000 ALTER TABLE `dd_factory_teacher` DISABLE KEYS */;
INSERT INTO `dd_factory_teacher` VALUES (16,72,14,'19.5',1588447204,1588630852),(17,72,12,'0',1588447268,1588447268),(18,72,11,'0',1588447292,1588447292),(19,73,14,'19.5',1588484974,1588630852),(20,73,12,'0',1588484980,1588484980),(21,73,11,'0',1588484986,1588484986),(22,72,16,'0',1588521368,1588521368),(23,74,14,'4.5',1588614453,1588630852),(24,76,14,'4.5',1588614456,1588630852),(25,74,12,'',1588614483,1588614483),(26,76,12,'',1588614486,1588614486),(27,74,11,'',1588614494,1588614494),(28,76,11,'',1588614495,1588614495),(29,72,18,'',1588614502,1588614502),(30,73,18,'',1588614503,1588614503),(31,74,18,'',1588614505,1588614505),(32,76,18,'',1588614508,1588614508),(33,73,16,'',1588614514,1588614514),(34,74,16,'',1588614516,1588614516),(39,76,20,'',1589135365,1589135365),(40,76,19,'',1589135380,1589135380),(41,73,20,'',1589187628,1589187628),(43,73,19,'',1589187817,1589187817);
/*!40000 ALTER TABLE `dd_factory_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_favorites`
--

DROP TABLE IF EXISTS `dd_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_favorites` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '1:文章 2:职位',
  `uid` int(32) NOT NULL COMMENT '用户',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `subtitle` varchar(64) NOT NULL COMMENT '子标题',
  `cid` int(32) NOT NULL COMMENT '内容id',
  `image` varchar(128) NOT NULL COMMENT '缩略图',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_favorites`
--

LOCK TABLES `dd_favorites` WRITE;
/*!40000 ALTER TABLE `dd_favorites` DISABLE KEYS */;
INSERT INTO `dd_favorites` VALUES (5,2,72,'这是一个职位名称','广东祥新光电科技有限公司',3,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588444065),(6,2,72,'普工','德曼木业有限公司',4,'/uploads/images/7d/8e2f67ee61334d302594d87428a7e8.jpg',1588444072),(7,2,202,'这是一个职位名称','广东祥新光电科技有限公司',3,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588780236),(9,2,210,'这是一个职位名称','广东祥新光电科技有限公司',3,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1589054125),(10,2,76,'这是一个职位名称','广东祥新光电科技有限公司',3,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1589331887);
/*!40000 ALTER TABLE `dd_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_feedbackes`
--

DROP TABLE IF EXISTS `dd_feedbackes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_feedbackes` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_feedbackes`
--

LOCK TABLES `dd_feedbackes` WRITE;
/*!40000 ALTER TABLE `dd_feedbackes` DISABLE KEYS */;
INSERT INTO `dd_feedbackes` VALUES (1,72,'标题','内容',NULL);
/*!40000 ALTER TABLE `dd_feedbackes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_images`
--

DROP TABLE IF EXISTS `dd_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_images`
--

LOCK TABLES `dd_images` WRITE;
/*!40000 ALTER TABLE `dd_images` DISABLE KEYS */;
INSERT INTO `dd_images` VALUES (4,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',0),(5,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587976946),(6,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587977070),(7,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587977393),(8,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587978406),(9,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587978493),(10,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587978563),(11,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587978674),(12,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979420),(13,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979554),(14,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979615),(15,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979725),(16,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979890),(17,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979964),(18,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587979987),(19,'/uploads/images/12/eb0ae1ed79c0bc6f7f36d672c346a8.jpg',1587980036),(20,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1587980175),(21,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1587980218),(22,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1587980286),(23,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1587980452),(24,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1587980586),(25,'/uploads/images/7d/ca3e0591c27dbd6e13188e7949b118.jpeg',1587982244),(26,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1587982438),(27,'/uploads/images/b4/afca0bb070c4e4c960c95b2b72ddc1.jpg',1587982496),(28,'/uploads/images/54/e6aba3402bcab814f250d39f1b345f.jpg',1587982558),(29,'/uploads/images/c0/a9c79e4d9a405a1fbcec35144933de.jpg',1587982677),(30,'/uploads/images/c9/6148683363024b7e40e37540303200.jpg',1587982721),(31,'/uploads/images/1b/4203fb051bc6d5195ca3631ea3d4fd.jpg',1587982772),(32,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1587982832),(33,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg',1587982984),(34,'/uploads/images/e3/7876646083f6312e92c31b1a69c419.png',1587983106),(35,'/uploads/images/98/e0510f3b4ec81fb98e025002bd7910.jpg',1587983202),(36,'/uploads/images/89/d51bfdcfb19730dacdcb6c9863757a.jpg',1588095525),(37,'/uploads/images/9b/75cf778dfaa45b66edb2a4f37d0017.jpg',1588095559),(38,'/uploads/images/4b/c3393c37bd60fdb0439637a89e5ad7.jpg',1588095914),(39,'/uploads/images/89/d51bfdcfb19730dacdcb6c9863757a.jpg',1588095986),(40,'/uploads/images/01/8b9b3bb9a96990d762dfc3db88c0a8.jpg',1588097020),(41,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588151999),(42,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588152012),(43,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588152012),(44,'/uploads/images/e3/7876646083f6312e92c31b1a69c419.png',1588152012),(45,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg',1588152012),(46,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588152012),(47,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588152596),(48,'/uploads/images/e3/7876646083f6312e92c31b1a69c419.png',1588152620),(49,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1588152620),(50,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588152620),(51,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg',1588152620),(52,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588152620),(53,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588152620),(54,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588153886),(55,'/uploads/images/81/af239d871f264724f8014efbe2d36e.jpeg',1588153918),(56,'/uploads/images/ea/c0bd6e23e55105cd4233fa16405c68.jpg',1588153918),(57,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588153918),(58,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588153918),(59,'/uploads/images/c9/6148683363024b7e40e37540303200.jpg',1588154245),(60,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg',1588186524),(61,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588186524),(62,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588186524),(63,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588186524),(64,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588187254),(65,'/uploads/images/de/9581d0c1b61fe878831740953a70a6.jpg',1588187262),(66,'/uploads/images/78/60cdefd57f17c28a8f7b42e1520df1.jpg',1588187262),(67,'/uploads/images/f1/65f4c28092344ba4f248982cb8d73c.jpg',1588187262),(68,'/uploads/images/2c/fc36c3c8925f5cd1c3d819011d41f4.png',1588187719),(69,'/uploads/images/ee/d080325457781c6a9dfa46b2fc4126.jpg',1588188051),(70,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588188051),(71,'/uploads/images/4f/5c0c64fc59d9cdaeb2b05e80d3114b.jpg',1588188051),(72,'/uploads/images/b3/9fa89fe52c0b557334c56f3ec5a8f7.png',1588188051),(73,'/uploads/images/87/a24c01df13a93810e0fd4bff94f965.png',1588188051),(74,'/uploads/images/37/bcaa3937f74f084912d1dd6ab76736.jpg',1588190096),(75,'/uploads/images/e7/67438242de4034a584591b7e1745a2.jpg',1588190204),(76,'/uploads/images/6f/5813b3c7bd76a93e68508814c9fb00.jpg',1588190204),(77,'/uploads/images/4a/f492c111921bfc02cf962a68c8e092.jpg',1588190204),(78,'/uploads/images/f2/c8ff3d8cc7ef78d325e4b6ae5ec2c0.jpg',1588190204),(79,'/uploads/images/b6/3a6b6cc5b4f9dcbcf4a49418368353.jpg',1588191308),(80,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg',1588191338),(81,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588191338),(82,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588191338),(83,'/uploads/images/fc/5b5da41e05c4212be17ebcc26b3ae8.png',1588326229),(84,'/uploads/images/21/98931d753de1519775318b95b4a931.png',1588351897),(85,'/uploads/images/7d/8e2f67ee61334d302594d87428a7e8.jpg',1588353588),(86,'/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg',1588353768),(87,'/uploads/images/dd/eece01e48b5d1244299b197fb97b84.jpg',1588353768),(88,'/uploads/images/f8/0301c2c0a8849a3142d703bf7554da.jpg',1588353768),(89,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588355108),(90,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg',1588355548),(91,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588355548),(92,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588361323),(93,'/uploads/images/7d/8e2f67ee61334d302594d87428a7e8.jpg',1588361893),(94,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588361938),(95,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588361958),(96,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588362154),(97,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588362306),(98,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588362668),(99,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588363134),(100,'/uploads/images/1d/15e1ed0420c5668707110455f507f6.jpg',1588363560),(101,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588365061),(102,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588367937),(103,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588368033),(104,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588368087),(105,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588368129),(106,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg',1588368473),(107,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg',1588368545),(108,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg',1588368956),(109,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg',1588369450),(110,'/uploads/images/dd/eece01e48b5d1244299b197fb97b84.jpg',1588369511),(111,'/uploads/images/7d/8e2f67ee61334d302594d87428a7e8.jpg',1588369639),(112,'/uploads/images/68/1b2597c012b0de53fd0e981f6b0503.jpg',1588369780),(113,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588369839),(114,'/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg',1588369963),(115,'/uploads/images/f8/0301c2c0a8849a3142d703bf7554da.jpg',1588370189),(116,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg',1588370204),(117,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg',1588371660),(118,'/uploads/images/b9/0d231048c320b98f0b7361451195bb.jpg',1588371706),(119,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588371715),(120,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588371878),(121,'/uploads/images/49/0c5d871487bf6928c0126279ba6ca3.jpg',1588393652),(122,'/uploads/images/40/6b20e3778c9d072c430bf11b5e88c1.jpg',1588403472),(123,'/uploads/images/40/6b20e3778c9d072c430bf11b5e88c1.jpg',1588404738),(124,'/uploads/images/40/6b20e3778c9d072c430bf11b5e88c1.jpg',1588411781),(125,'/uploads/images/2b/b922a0048ef54978e3e5a41a00f232.jpg',1588411797),(126,'/uploads/images/25/2d26c27de0eaf1199f6dca3cda7aa7.gif',1588418013),(127,'/uploads/images/2c/3b58a5a4de2df11a958ac4f3c7d284.png',1588418148),(128,'/uploads/images/e7/2da1f979830ced64bc2bcd7fd9100e.jpg',1588418327),(129,'/uploads/images/88/acfa4582b60f5721aa68147eeab9a6.jpg',1588418699),(130,'/uploads/images/88/acfa4582b60f5721aa68147eeab9a6.jpg',1588418851),(131,'/uploads/images/88/acfa4582b60f5721aa68147eeab9a6.jpg',1588418954),(132,'/uploads/images/ab/68c22d281004dd51e74199d43f7969.jpg',1588418970),(133,'/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',1588498527),(134,'/uploads/images/bb/e2c1bba4f72a7a4fb5d80c297f73a2.jpg',1588498667),(135,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588498667),(136,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588498667),(137,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588498667),(138,'/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',1588499511),(139,'/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',1588499877),(140,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588499893),(141,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588499893),(142,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588499893),(143,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588499893),(144,'/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',1588500063),(145,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588500070),(146,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588500070),(147,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588500070),(148,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588500070),(149,'/uploads/images/a8/4de9045e740b4a4be4ad46ddc374c1.jpg',1588502586),(150,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588502594),(151,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588502594),(152,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588502594),(153,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588502594),(154,'/uploads/images/f3/211736660d784a76dba0288ae62c3b.jpg',1588503705),(155,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588503723),(156,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588503723),(157,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588503723),(158,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588503723),(159,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588525332),(160,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588525332),(161,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588525332),(162,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588525332),(163,'/uploads/images/f3/007f83b4e414b9743617266ec38416.jpg',1588525376),(164,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588525376),(165,'/uploads/images/3f/caa6ea5976725ff5908d17578fde99.jpg',1588525376),(166,'/uploads/images/2d/61e397c919986151d7bc33580671dd.jpg',1588525376),(167,'/uploads/images/0c/0fa7830e9d87de657bcaed6ee2204a.jpg',1588595023),(168,'/uploads/images/0c/0fa7830e9d87de657bcaed6ee2204a.jpg',1588595083),(169,'/uploads/images/ff/6e5133f7877f2b9c405f6b0298bab5.jpg',1588595225),(170,'/uploads/images/cf/b24afdd826dfd1575088b68c0603a6.jpg',1588595242),(171,'/uploads/images/1b/b44b1887ef76d1335167409790d625.jpg',1588595256),(172,'/uploads/images/e7/4a9dc9e338648359e6a8c77d5e6903.jpg',1588630593),(173,'/uploads/images/23/6c215376ac8d1628a5fe268633209d.jpg',1588630616),(174,'/uploads/images/de/00dc3ea4ded9d93573939b454d476f.jpg',1588630635),(175,'/uploads/images/1b/b44b1887ef76d1335167409790d625.jpg',1588630649),(176,'/uploads/images/5e/50c7b943a7096182b0f01954d932d5.jpg',1588787612),(177,'/uploads/images/eb/bd44c3d061881538ea5dadd4ef67bf.jpg',1588831853),(178,'/uploads/images/09/5fba79eeb21291265189a4d7029795.jpg',1588831859),(179,'/uploads/images/03/cc0681b9f6d6da74a048a16f5dfcda.jpg',1588831869),(180,'/uploads/images/ff/c21af64854030359d0efd5ad0ffa73.jpg',1588832301),(181,'/uploads/images/4f/cb9df816d7caf98226bbe8a86c050d.jpg',1588832328),(182,'/uploads/images/44/7c3aecaa093a8c487cc10a2c766106.jpg',1588832328),(183,'/uploads/images/6f/d99fb0412f2bc5c5c5e95b5d318298.jpg',1588832328),(184,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834137),(185,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834152),(186,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834408),(187,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834616),(188,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834844),(189,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588834947),(190,'/uploads/images/3a/4005ef7526b335b40a355dd48254b4.jpg',1588835370),(191,'/uploads/images/e5/4ad6b9cb0430a2cd7a4045924fa3e9.jpg',1588836093),(192,'/uploads/images/81/114bd33fdb9dd4bca155d1da952c60.jpg',1588836243),(193,'/uploads/images/d7/9c7a1b8dcaa33b67ba7bb4f994f117.jpg',1588836268),(194,'/uploads/images/0b/348bbc86d2dac5aeef5654f73286c8.jpg',1588836311),(195,'/uploads/images/02/a0abd65f5b235a0c1c45df3e45bf4a.jpg',1588836322),(196,'/uploads/images/22/6408cb7112400b8735161f165d8324.jpg',1588836358),(197,'/uploads/images/4f/41d28cc2e63f23b60bd8eed6e433f1.jpg',1588836388),(198,'/uploads/images/87/a2178f9a186fb6a954d0c4edf41750.jpg',1588836405),(199,'/uploads/images/06/02395a521214a059f44a41e620a105.png',1588836438),(200,'/uploads/images/db/5288a3136d6d4b5e752c1ffa0a3f67.jpg',1588882332),(201,'/uploads/images/17/37c2e1a1e2ff77415a764b8e39a92a.jpg',1588882372),(202,'/uploads/images/50/be8ace8ef81313fb6a53e3b69b61d4.jpg',1588883795),(203,'/uploads/images/f0/5d5b96394a49594bcf331b2bc3425d.jpg',1589051752),(204,'/uploads/images/f0/5d5b96394a49594bcf331b2bc3425d.jpg',1589052301),(205,'/uploads/images/f0/5d5b96394a49594bcf331b2bc3425d.jpg',1589052923),(206,'/uploads/images/de/00dc3ea4ded9d93573939b454d476f.jpg',1589089525),(207,'/uploads/images/f0/2c537d4739538d52375f76de07e318.jpg',1589440661);
/*!40000 ALTER TABLE `dd_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_my_bank`
--

DROP TABLE IF EXISTS `dd_my_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_my_bank` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `number` varchar(32) NOT NULL,
  `name` varchar(45) NOT NULL,
  `bid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_my_bank`
--

LOCK TABLES `dd_my_bank` WRITE;
/*!40000 ALTER TABLE `dd_my_bank` DISABLE KEYS */;
INSERT INTO `dd_my_bank` VALUES (2,210,'6214857807098621','李飞恒',14,1589259547,1589259547),(3,76,'6214857807098621','李飞恒',14,1589371917,1589371917),(4,203,'6214857807098621','李飞恒',14,1589511790,1589511790);
/*!40000 ALTER TABLE `dd_my_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_partner_pivot`
--

DROP TABLE IF EXISTS `dd_partner_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_partner_pivot` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(32) unsigned NOT NULL,
  `pid` int(32) unsigned NOT NULL COMMENT '上级ID',
  `sid` int(32) NOT NULL COMMENT '战略联盟ID',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_partner_pivot`
--

LOCK TABLES `dd_partner_pivot` WRITE;
/*!40000 ALTER TABLE `dd_partner_pivot` DISABLE KEYS */;
INSERT INTO `dd_partner_pivot` VALUES (12,72,73,73,1588032600,1588032600),(13,73,73,73,1588032600,1588032600),(14,74,74,74,1588032600,1588032600),(15,76,73,73,1588032601,1588032601),(16,80,73,73,1588032602,1588032602),(17,81,80,73,1588032602,1588032602),(18,83,73,73,1588032602,1588032602),(19,84,74,74,1588032603,1588032603),(20,85,80,73,1588032603,1588032603),(21,86,73,73,1588032603,1588032603),(22,87,73,73,1588032604,1588032604),(23,89,74,74,1588032604,1588032604),(24,90,73,73,1588032604,1588032604),(25,94,73,73,1588032605,1588032605),(26,96,73,73,1588032605,1588032605),(27,98,87,73,1588032606,1588032606),(28,99,87,73,1588032606,1588032606),(29,100,87,73,1588032606,1588032606),(30,101,87,73,1588032606,1588032606),(31,102,73,73,1588032607,1588032607),(32,104,80,73,1588032607,1588032607),(33,105,80,73,1588032607,1588032607),(34,106,73,73,1588032607,1588032607),(35,107,73,73,1588032608,1588032608),(36,108,74,74,1588032608,1588032608),(37,109,74,74,1588032608,1588032608),(38,111,74,74,1588032608,1588032608),(39,113,73,73,1588032609,1588032609),(40,115,74,74,1588032609,1588032609),(41,117,73,73,1588032609,1588032609),(42,119,80,73,1588032610,1588032610),(43,120,74,74,1588032610,1588032610),(44,121,94,73,1588032610,1588032610),(45,122,73,73,1588032610,1588032610),(46,123,80,73,1588032610,1588032610),(47,124,73,73,1588032611,1588032611),(48,126,73,73,1588032611,1588032611),(49,128,87,73,1588032611,1588032611),(50,129,73,73,1588032612,1588032612),(51,130,73,73,1588032612,1588032612),(52,132,80,73,1588032612,1588032612),(53,133,80,73,1588032612,1588032612),(54,134,108,74,1588032613,1588032613),(55,136,80,73,1588032613,1588032613),(56,138,80,73,1588032613,1588032613),(57,139,80,73,1588032613,1588032613),(58,140,87,73,1588032614,1588032614),(59,141,122,73,1588032614,1588032614),(60,142,122,73,1588032614,1588032614),(61,143,141,73,1588032614,1588032614),(62,144,80,73,1588032615,1588032615),(63,145,80,73,1588032615,1588032615),(64,146,108,74,1588032615,1588032615),(65,147,100,73,1588032615,1588032615),(66,150,100,73,1588032616,1588032616),(67,151,153,73,1588032616,1588032616),(68,152,117,73,1588032616,1588032616),(69,153,73,73,1588032616,1588032616),(70,154,100,73,1588032617,1588032617),(71,155,100,73,1588032617,1588032617),(72,156,100,73,1588032617,1588032617),(73,157,80,73,1588032617,1588032617),(74,158,80,73,1588032617,1588032617),(75,160,120,74,1588032618,1588032618),(76,161,73,73,1588032618,1588032618),(77,162,73,73,1588032618,1588032618),(78,163,117,73,1588032618,1588032618),(79,164,117,73,1588032619,1588032619),(80,165,132,73,1588032619,1588032619),(81,167,94,73,1588032619,1588032619),(82,168,117,73,1588032619,1588032619),(83,169,95,73,1588032620,1588032620),(84,170,117,73,1588032620,1588032620),(85,172,95,73,1588032620,1588032620),(86,175,122,73,1588032620,1588032620),(87,178,122,73,1588032621,1588032621),(88,182,80,73,1588032621,1588032621),(89,189,73,73,1588032622,1588032622),(90,192,76,73,1588032622,1588032622),(91,194,76,73,1588032623,1588032623),(92,195,76,73,1588032623,1588032623),(93,196,76,73,1588032623,1588032623),(94,198,76,73,1588032623,1588032623),(95,199,198,73,1588032624,1588032624),(96,200,198,73,1588032624,1588032624),(97,95,73,73,1588032624,1588032624),(98,202,76,73,1588106092,1588106092),(100,205,72,73,1588407875,1588407875),(102,206,76,73,1588742602,1588742602),(103,207,73,73,1588761517,1588761517),(107,210,76,73,1589053751,1589053751),(108,203,76,73,1589440552,1589440552);
/*!40000 ALTER TABLE `dd_partner_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_resume_basic_information`
--

DROP TABLE IF EXISTS `dd_resume_basic_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_resume_basic_information` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `origin` varchar(45) NOT NULL,
  `marriage` int(11) NOT NULL,
  `nation` varchar(45) NOT NULL,
  `education` varchar(45) NOT NULL,
  `speciality` varchar(45) NOT NULL,
  `sos_name` varchar(45) NOT NULL,
  `sos_phone` varchar(45) NOT NULL,
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_resume_basic_information`
--

LOCK TABLES `dd_resume_basic_information` WRITE;
/*!40000 ALTER TABLE `dd_resume_basic_information` DISABLE KEYS */;
INSERT INTO `dd_resume_basic_information` VALUES (1,72,'广东 深圳市 南山区',1,'汉族','博士','特长很多','李敏镐','13800138000',1588090163,1588090163),(2,73,'黑龙江 哈尔滨市 道里区',1,'汉族','小学学历','什么也不会，只会做老板','张国栋','13800138000',1588280666,1588280666);
/*!40000 ALTER TABLE `dd_resume_basic_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_resume_educational_experience`
--

DROP TABLE IF EXISTS `dd_resume_educational_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_resume_educational_experience` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `education` varchar(45) NOT NULL,
  `school` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `graduation_time` varchar(45) NOT NULL,
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_resume_educational_experience`
--

LOCK TABLES `dd_resume_educational_experience` WRITE;
/*!40000 ALTER TABLE `dd_resume_educational_experience` DISABLE KEYS */;
INSERT INTO `dd_resume_educational_experience` VALUES (2,72,'小学学历','usuus','jsush','2020-4-29',1588093292,1588093292),(3,72,'高中学历','shhhs','ususjs','',1588093300,1588093300);
/*!40000 ALTER TABLE `dd_resume_educational_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_resume_work_experience`
--

DROP TABLE IF EXISTS `dd_resume_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_resume_work_experience` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `company_address` varchar(45) NOT NULL,
  `company_phone` varchar(45) NOT NULL,
  `company_job` varchar(45) NOT NULL,
  `work_time` varchar(45) NOT NULL,
  `dimission_time` varchar(45) NOT NULL,
  `work_content` varchar(45) NOT NULL,
  `uid` int(32) NOT NULL,
  `update_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_resume_work_experience`
--

LOCK TABLES `dd_resume_work_experience` WRITE;
/*!40000 ALTER TABLE `dd_resume_work_experience` DISABLE KEYS */;
INSERT INTO `dd_resume_work_experience` VALUES (2,'shhd','usus','hsuhshs','hsuhsus','uhhusshsh','2020-4-29','shshshysh behavior has ',72,1588092811,1588092789),(3,'hyhe','hshhs','hshhs','hshhshss','jsuhs','2020-4-29','hshhs hshhs is a good morning to the boys who',72,1588093002,1588093002);
/*!40000 ALTER TABLE `dd_resume_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_roles_pivot`
--

DROP TABLE IF EXISTS `dd_roles_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_roles_pivot` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(32) unsigned NOT NULL DEFAULT '0',
  `rid` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_roles_pivot`
--

LOCK TABLES `dd_roles_pivot` WRITE;
/*!40000 ALTER TABLE `dd_roles_pivot` DISABLE KEYS */;
INSERT INTO `dd_roles_pivot` VALUES (26,72,1,1588032599,1588032599),(27,72,2,1588032599,1588032599),(30,73,1,1588032600,1588032600),(31,73,2,1588032600,1588032600),(33,73,4,1588032600,1588032600),(34,73,5,1588032600,1588032600),(35,73,7,1588032600,1588032600),(37,74,1,1588032600,1588032600),(38,74,2,1588032600,1588032600),(39,74,4,1588032600,1588032600),(40,74,5,1588032600,1588032600),(41,74,7,1588032601,1588032601),(42,76,1,1588032601,1588032601),(43,76,2,1588032601,1588032601),(45,76,4,1588032601,1588032601),(46,76,5,1588032601,1588032601),(49,77,1,1588032601,1588032601),(52,79,1,1588032601,1588032601),(53,80,1,1588032601,1588032601),(54,80,2,1588032602,1588032602),(55,80,4,1588032602,1588032602),(56,80,5,1588032602,1588032602),(57,81,1,1588032602,1588032602),(59,82,1,1588032602,1588032602),(60,83,1,1588032602,1588032602),(61,83,2,1588032602,1588032602),(62,83,4,1588032602,1588032602),(63,83,5,1588032602,1588032602),(64,84,1,1588032602,1588032602),(65,84,2,1588032603,1588032603),(66,84,4,1588032603,1588032603),(67,84,5,1588032603,1588032603),(68,85,1,1588032603,1588032603),(69,85,2,1588032603,1588032603),(70,85,4,1588032603,1588032603),(71,85,5,1588032603,1588032603),(72,86,1,1588032603,1588032603),(73,86,2,1588032603,1588032603),(74,86,4,1588032603,1588032603),(75,86,5,1588032603,1588032603),(76,87,1,1588032603,1588032603),(77,87,2,1588032604,1588032604),(78,87,4,1588032604,1588032604),(79,87,5,1588032604,1588032604),(80,88,1,1588032604,1588032604),(81,89,1,1588032604,1588032604),(82,89,2,1588032604,1588032604),(83,89,4,1588032604,1588032604),(84,89,5,1588032604,1588032604),(85,90,1,1588032604,1588032604),(86,90,2,1588032604,1588032604),(87,90,4,1588032604,1588032604),(88,90,5,1588032604,1588032604),(89,91,1,1588032605,1588032605),(90,92,1,1588032605,1588032605),(91,93,1,1588032605,1588032605),(92,94,1,1588032605,1588032605),(93,94,2,1588032605,1588032605),(94,94,4,1588032605,1588032605),(95,94,5,1588032605,1588032605),(96,96,1,1588032605,1588032605),(97,96,2,1588032605,1588032605),(98,96,4,1588032605,1588032605),(99,97,1,1588032605,1588032605),(100,98,1,1588032606,1588032606),(101,98,2,1588032606,1588032606),(102,99,1,1588032606,1588032606),(103,99,2,1588032606,1588032606),(104,99,4,1588032606,1588032606),(105,100,1,1588032606,1588032606),(106,100,2,1588032606,1588032606),(107,100,4,1588032606,1588032606),(108,101,1,1588032606,1588032606),(109,101,2,1588032606,1588032606),(110,101,4,1588032606,1588032606),(111,102,1,1588032607,1588032607),(112,102,2,1588032607,1588032607),(113,102,4,1588032607,1588032607),(114,103,1,1588032607,1588032607),(115,104,1,1588032607,1588032607),(116,104,2,1588032607,1588032607),(117,104,4,1588032607,1588032607),(118,105,1,1588032607,1588032607),(119,105,2,1588032607,1588032607),(120,105,4,1588032607,1588032607),(121,106,1,1588032607,1588032607),(122,106,2,1588032607,1588032607),(123,106,4,1588032608,1588032608),(124,107,1,1588032608,1588032608),(125,107,2,1588032608,1588032608),(126,107,4,1588032608,1588032608),(127,108,1,1588032608,1588032608),(128,108,2,1588032608,1588032608),(129,109,1,1588032608,1588032608),(130,109,2,1588032608,1588032608),(131,110,1,1588032608,1588032608),(132,111,1,1588032608,1588032608),(133,111,2,1588032608,1588032608),(134,112,1,1588032609,1588032609),(135,113,1,1588032609,1588032609),(136,113,2,1588032609,1588032609),(137,114,1,1588032609,1588032609),(138,115,1,1588032609,1588032609),(139,115,2,1588032609,1588032609),(140,116,1,1588032609,1588032609),(141,117,1,1588032609,1588032609),(142,117,2,1588032609,1588032609),(143,118,1,1588032609,1588032609),(144,119,1,1588032610,1588032610),(145,119,2,1588032610,1588032610),(146,120,1,1588032610,1588032610),(147,120,2,1588032610,1588032610),(148,121,1,1588032610,1588032610),(149,121,2,1588032610,1588032610),(150,122,1,1588032610,1588032610),(151,122,2,1588032610,1588032610),(152,123,1,1588032610,1588032610),(153,123,2,1588032610,1588032610),(154,124,1,1588032611,1588032611),(155,124,2,1588032611,1588032611),(156,125,1,1588032611,1588032611),(157,126,1,1588032611,1588032611),(158,126,2,1588032611,1588032611),(159,127,1,1588032611,1588032611),(160,128,1,1588032611,1588032611),(161,128,2,1588032611,1588032611),(162,129,1,1588032611,1588032611),(163,129,2,1588032611,1588032611),(164,130,1,1588032612,1588032612),(165,130,2,1588032612,1588032612),(166,131,1,1588032612,1588032612),(167,132,1,1588032612,1588032612),(168,132,2,1588032612,1588032612),(169,132,4,1588032612,1588032612),(170,132,5,1588032612,1588032612),(171,133,1,1588032612,1588032612),(172,133,2,1588032612,1588032612),(173,134,1,1588032612,1588032612),(174,134,2,1588032612,1588032612),(175,134,4,1588032613,1588032613),(176,135,1,1588032613,1588032613),(177,136,1,1588032613,1588032613),(178,136,2,1588032613,1588032613),(179,137,1,1588032613,1588032613),(180,138,1,1588032613,1588032613),(181,138,2,1588032613,1588032613),(182,139,1,1588032613,1588032613),(183,139,2,1588032613,1588032613),(184,140,1,1588032613,1588032613),(185,140,2,1588032613,1588032613),(186,140,4,1588032614,1588032614),(187,141,1,1588032614,1588032614),(188,141,2,1588032614,1588032614),(189,141,4,1588032614,1588032614),(190,142,1,1588032614,1588032614),(191,142,2,1588032614,1588032614),(192,142,4,1588032614,1588032614),(193,143,1,1588032614,1588032614),(194,143,2,1588032614,1588032614),(195,143,4,1588032614,1588032614),(196,144,1,1588032614,1588032614),(197,144,2,1588032614,1588032614),(198,145,1,1588032615,1588032615),(199,145,2,1588032615,1588032615),(200,146,1,1588032615,1588032615),(201,146,2,1588032615,1588032615),(202,146,4,1588032615,1588032615),(203,147,1,1588032615,1588032615),(204,147,2,1588032615,1588032615),(205,148,1,1588032615,1588032615),(206,149,1,1588032615,1588032615),(207,150,1,1588032615,1588032615),(208,150,2,1588032616,1588032616),(209,151,1,1588032616,1588032616),(210,151,2,1588032616,1588032616),(211,151,4,1588032616,1588032616),(212,152,1,1588032616,1588032616),(213,152,2,1588032616,1588032616),(214,152,4,1588032616,1588032616),(215,153,1,1588032616,1588032616),(216,153,2,1588032616,1588032616),(217,153,4,1588032616,1588032616),(218,154,1,1588032616,1588032616),(219,154,2,1588032616,1588032616),(220,155,1,1588032617,1588032617),(221,155,2,1588032617,1588032617),(222,156,1,1588032617,1588032617),(223,156,2,1588032617,1588032617),(224,157,1,1588032617,1588032617),(225,157,2,1588032617,1588032617),(226,158,1,1588032617,1588032617),(227,158,2,1588032617,1588032617),(228,159,1,1588032617,1588032617),(229,160,1,1588032618,1588032618),(230,160,2,1588032618,1588032618),(231,161,1,1588032618,1588032618),(232,161,2,1588032618,1588032618),(233,162,1,1588032618,1588032618),(234,162,2,1588032618,1588032618),(235,162,4,1588032618,1588032618),(236,163,1,1588032618,1588032618),(237,163,2,1588032618,1588032618),(238,164,1,1588032618,1588032618),(239,164,2,1588032618,1588032618),(240,165,1,1588032619,1588032619),(241,165,2,1588032619,1588032619),(242,166,1,1588032619,1588032619),(243,167,1,1588032619,1588032619),(244,167,2,1588032619,1588032619),(245,167,4,1588032619,1588032619),(246,168,1,1588032619,1588032619),(247,168,2,1588032619,1588032619),(248,168,4,1588032619,1588032619),(249,169,1,1588032619,1588032619),(250,169,2,1588032619,1588032619),(251,170,1,1588032620,1588032620),(252,170,2,1588032620,1588032620),(253,170,4,1588032620,1588032620),(254,171,1,1588032620,1588032620),(255,172,1,1588032620,1588032620),(256,172,2,1588032620,1588032620),(257,172,4,1588032620,1588032620),(258,173,1,1588032620,1588032620),(259,174,1,1588032620,1588032620),(260,175,1,1588032620,1588032620),(261,175,2,1588032620,1588032620),(262,175,4,1588032621,1588032621),(263,176,1,1588032621,1588032621),(264,177,1,1588032621,1588032621),(265,178,1,1588032621,1588032621),(266,178,2,1588032621,1588032621),(267,178,4,1588032621,1588032621),(268,179,1,1588032621,1588032621),(269,180,1,1588032621,1588032621),(270,181,1,1588032621,1588032621),(271,182,1,1588032621,1588032621),(272,182,2,1588032621,1588032621),(273,183,1,1588032622,1588032622),(274,184,1,1588032622,1588032622),(275,185,1,1588032622,1588032622),(276,189,1,1588032622,1588032622),(277,189,2,1588032622,1588032622),(278,192,1,1588032622,1588032622),(279,192,2,1588032622,1588032622),(281,192,4,1588032622,1588032622),(282,192,5,1588032622,1588032622),(285,194,1,1588032622,1588032622),(286,194,2,1588032622,1588032622),(288,195,1,1588032623,1588032623),(289,195,2,1588032623,1588032623),(291,196,1,1588032623,1588032623),(292,196,2,1588032623,1588032623),(294,197,1,1588032623,1588032623),(295,198,1,1588032623,1588032623),(296,198,2,1588032623,1588032623),(297,198,4,1588032623,1588032623),(298,198,5,1588032624,1588032624),(299,199,1,1588032624,1588032624),(300,199,2,1588032624,1588032624),(301,199,4,1588032624,1588032624),(302,200,1,1588032624,1588032624),(303,200,2,1588032624,1588032624),(304,201,1,1588032624,1588032624),(305,202,1,1588093441,1588093441),(306,202,2,1588106092,1588106092),(307,203,1,1588106491,1588106491),(323,73,14,1588204895,1588204895),(324,73,15,1588204895,1588204895),(325,72,4,1588303183,1588303183),(326,72,5,1588304225,1588304225),(328,204,4,1588403090,1588403090),(329,205,1,1588406617,1588406617),(330,205,2,1588407875,1588407875),(332,204,11,1588409366,1588409366),(334,72,8,1588447204,1588447204),(336,72,10,1588447400,1588447400),(337,73,8,1588484974,1588484974),(338,73,3,1588490816,1588490816),(339,73,11,1588612864,1588612864),(340,73,10,1588614399,1588614399),(341,74,10,1588614414,1588614414),(342,76,10,1588614416,1588614416),(343,74,8,1588614453,1588614453),(344,76,8,1588614456,1588614456),(345,72,7,1588694284,1588694284),(346,206,1,1588742265,1588742265),(347,206,2,1588742602,1588742602),(351,207,1,1588761490,1588761490),(352,207,2,1588761517,1588761517),(355,73,9,1589020880,1589020880),(360,210,1,1589052730,1589052730),(362,210,2,1589053751,1589053751),(363,210,3,1589056189,1589056189),(365,76,11,1589146192,1589146192),(366,76,12,1589146217,1589146217),(367,76,13,1589146241,1589146241),(371,76,9,1589150422,1589150422),(372,77,11,1589150646,1589150646),(373,73,12,1589150763,1589150763),(374,73,13,1589150788,1589150788),(375,189,3,1589432632,1589432632),(376,203,2,1589440552,1589440552),(377,203,3,1589441077,1589441077);
/*!40000 ALTER TABLE `dd_roles_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_roles_type`
--

DROP TABLE IF EXISTS `dd_roles_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_roles_type` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_roles_type`
--

LOCK TABLES `dd_roles_type` WRITE;
/*!40000 ALTER TABLE `dd_roles_type` DISABLE KEYS */;
INSERT INTO `dd_roles_type` VALUES (1,'普通用户'),(2,'会员'),(3,'工人'),(4,'初级合伙人'),(5,'高级合伙人'),(6,'准高级合伙人'),(7,'战略联盟'),(8,'驻场老师'),(9,'驻场经理'),(10,'工厂HR'),(11,'业务员'),(12,'人事部'),(13,'财务部'),(14,'总经理'),(15,'蛋蛋'),(16,'驻场经理');
/*!40000 ALTER TABLE `dd_roles_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_seting`
--

DROP TABLE IF EXISTS `dd_seting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_seting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `uid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_seting`
--

LOCK TABLES `dd_seting` WRITE;
/*!40000 ALTER TABLE `dd_seting` DISABLE KEYS */;
INSERT INTO `dd_seting` VALUES (1,'13800138000',72,1588036171),(2,'13416801001',73,1588078654),(3,'13800138100',202,1588093459),(4,'13412331222',204,1588153320),(5,'13318444535',78,1588159686),(6,'13800138001',189,1588393595),(7,'13800138009',205,1588406628),(8,'13828855724',76,1588724270),(9,'15813012130',206,1588742282),(10,'13412331222',207,1588761497),(11,'15363153911',208,1589044604),(12,'15363153911',209,1589052256),(13,'15363153911',210,1589052740),(14,'13800138002',203,1589434488);
/*!40000 ALTER TABLE `dd_seting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_shop_cart`
--

DROP TABLE IF EXISTS `dd_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_shop_cart` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `cid` int(32) NOT NULL COMMENT '商品id',
  `uid` int(32) NOT NULL COMMENT '下单用户id',
  `sid` int(32) NOT NULL COMMENT '商家id',
  `count` int(10) NOT NULL COMMENT '购买数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未支付\n1已支付',
  `price` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `create_time` int(32) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_shop_cart`
--

LOCK TABLES `dd_shop_cart` WRITE;
/*!40000 ALTER TABLE `dd_shop_cart` DISABLE KEYS */;
INSERT INTO `dd_shop_cart` VALUES (1,3,73,73,2,0,'58.0',1588957294,1588967551);
/*!40000 ALTER TABLE `dd_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_shop_commodity`
--

DROP TABLE IF EXISTS `dd_shop_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_shop_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品列表id',
  `name` varchar(45) NOT NULL,
  `tid` int(32) NOT NULL COMMENT '商品类别',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1: banner\n',
  `price` varchar(45) NOT NULL COMMENT '商品价格',
  `uid` int(32) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 未发布 1已发布 2已下架',
  `text` varchar(1204) NOT NULL COMMENT '商品描述',
  `images` varchar(1204) NOT NULL DEFAULT '[]',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_shop_commodity`
--

LOCK TABLES `dd_shop_commodity` WRITE;
/*!40000 ALTER TABLE `dd_shop_commodity` DISABLE KEYS */;
INSERT INTO `dd_shop_commodity` VALUES (1,'一个大标题',0,1,'128',73,1,'很多文字的介绍','[\"\\/uploads\\/images\\/db\\/5288a3136d6d4b5e752c1ffa0a3f67.jpg\",\"\\/uploads\\/images\\/17\\/37c2e1a1e2ff77415a764b8e39a92a.jpg\"]',1588883621,1588925445),(2,'自家蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925581),(3,'好吃的蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925618),(4,'一个大标题',0,1,'128',73,1,'很多文字的介绍','[\"\\/uploads\\/images\\/db\\/5288a3136d6d4b5e752c1ffa0a3f67.jpg\",\"\\/uploads\\/images\\/17\\/37c2e1a1e2ff77415a764b8e39a92a.jpg\"]',1588883621,1588925589),(5,'自家蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925418),(6,'好吃的蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925437),(7,'一个大标题',0,1,'128',73,1,'很多文字的介绍','[\"\\/uploads\\/images\\/db\\/5288a3136d6d4b5e752c1ffa0a3f67.jpg\",\"\\/uploads\\/images\\/17\\/37c2e1a1e2ff77415a764b8e39a92a.jpg\"]',1588883621,1588925593),(8,'自家蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925432),(9,'好吃的蛋糕',0,1,'58',73,1,'厂家直销，价格真实。','[\"\\/uploads\\/images\\/50\\/be8ace8ef81313fb6a53e3b69b61d4.jpg\"]',1588884161,1588925567);
/*!40000 ALTER TABLE `dd_shop_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_shop_order`
--

DROP TABLE IF EXISTS `dd_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_shop_order` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '商品列表',
  `cid` int(32) NOT NULL COMMENT '商品id',
  `uid` int(32) NOT NULL COMMENT '买家',
  `euid` int(32) NOT NULL COMMENT '商家',
  `status` int(11) NOT NULL COMMENT '订单状态\n0 未发货\n1 已发货\n2 已签收\n3 完成\n4 关闭',
  `addid` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_shop_order`
--

LOCK TABLES `dd_shop_order` WRITE;
/*!40000 ALTER TABLE `dd_shop_order` DISABLE KEYS */;
INSERT INTO `dd_shop_order` VALUES (3,7,73,73,0,'6','128',1,1588968492,1588968492),(4,3,73,73,0,'6','58',2,1588968492,1588968492),(5,2,210,73,0,'8','58',1,1589057414,1589057414),(6,3,210,73,0,'8','58',1,1589057414,1589057414),(7,4,210,73,0,'8','128',1,1589057697,1589057697),(8,2,210,73,0,'8','58',1,1589057697,1589057697),(9,2,210,73,0,'8','58',1,1589057791,1589057791),(10,4,210,73,0,'8','128',1,1589057791,1589057791);
/*!40000 ALTER TABLE `dd_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_shop_order_addres`
--

DROP TABLE IF EXISTS `dd_shop_order_addres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_shop_order_addres` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `province` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `address` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_shop_order_addres`
--

LOCK TABLES `dd_shop_order_addres` WRITE;
/*!40000 ALTER TABLE `dd_shop_order_addres` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_shop_order_addres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_shop_type`
--

DROP TABLE IF EXISTS `dd_shop_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_shop_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_shop_type`
--

LOCK TABLES `dd_shop_type` WRITE;
/*!40000 ALTER TABLE `dd_shop_type` DISABLE KEYS */;
INSERT INTO `dd_shop_type` VALUES (0,'新品推荐','/resources/nav_icon05.jpg',0,0),(2,'男鞋','/uploads/images/81/114bd33fdb9dd4bca155d1da952c60.jpg',0,0),(3,'女鞋','/uploads/images/d7/9c7a1b8dcaa33b67ba7bb4f994f117.jpg',0,0),(4,'T恤','/uploads/images/0b/348bbc86d2dac5aeef5654f73286c8.jpg',0,0),(5,'外套','/uploads/images/02/a0abd65f5b235a0c1c45df3e45bf4a.jpg',0,0),(6,'夏季新款','/uploads/images/22/6408cb7112400b8735161f165d8324.jpg',0,0),(7,'户外箱包','/uploads/images/4f/41d28cc2e63f23b60bd8eed6e433f1.jpg',0,0),(8,'体育器材','/uploads/images/87/a2178f9a186fb6a954d0c4edf41750.jpg',0,0);
/*!40000 ALTER TABLE `dd_shop_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_sign_in`
--

DROP TABLE IF EXISTS `dd_sign_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_sign_in` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `reward` varchar(45) NOT NULL DEFAULT '0' COMMENT '奖励:蛋蛋币',
  `isCheck` tinyint(4) NOT NULL COMMENT 'isCheck',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_sign_in`
--

LOCK TABLES `dd_sign_in` WRITE;
/*!40000 ALTER TABLE `dd_sign_in` DISABLE KEYS */;
INSERT INTO `dd_sign_in` VALUES (51,76,'3.0',0,1589472561),(52,203,'5.0',0,1589508149);
/*!40000 ALTER TABLE `dd_sign_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_strategic_alliance`
--

DROP TABLE IF EXISTS `dd_strategic_alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_strategic_alliance` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(32) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL COMMENT '战略名称',
  `province` varchar(45) NOT NULL COMMENT '省',
  `city` varchar(45) NOT NULL COMMENT '市',
  `county` varchar(45) NOT NULL COMMENT '区',
  `address` varchar(45) NOT NULL COMMENT '地址',
  `sos_name` varchar(45) NOT NULL COMMENT '紧急联系人',
  `soso_phone` varchar(45) NOT NULL COMMENT '紧急联系人phone',
  `jp_dividend` varchar(45) NOT NULL COMMENT '初级分红比例',
  `sp_dividend` varchar(45) NOT NULL COMMENT '高级全红比例',
  `sa_dividend` varchar(45) NOT NULL COMMENT '战略分红比例',
  `dd_dividend` varchar(45) NOT NULL COMMENT '蛋蛋分红比例',
  `dd_service_charge` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '手续费,不是提现手续费',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_strategic_alliance`
--

LOCK TABLES `dd_strategic_alliance` WRITE;
/*!40000 ALTER TABLE `dd_strategic_alliance` DISABLE KEYS */;
INSERT INTO `dd_strategic_alliance` VALUES (73,73,'张国栋公司','广东省','东莞市','常平镇','口岸大道53号','张国栋','13416801001','45.0','16.5','27.5','11.0','3.0',0,0,1),(74,74,'朱益龙公司','广东省','东莞市','常平镇','胜和豪岗新村2号楼B座702','刘琴','13650484877','45.0','16.5','27.5','11.0','3.0',0,0,1),(78,72,'李治明的公司','北京市','北京市','东城区','爆炸街128号','李易峰','','45.0','16.5','27.5','11.0','1.5',0,1589135199,1),(79,78,'佛具','北京市','北京市','东城区','东莞','饿了','','45.0','16.5','27.5','11.0','0.00',1588757802,1588757819,1);
/*!40000 ALTER TABLE `dd_strategic_alliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_system`
--

DROP TABLE IF EXISTS `dd_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distance` varchar(45) NOT NULL COMMENT '距离设置',
  `sign_in_reward` varchar(45) NOT NULL COMMENT '签到奖励',
  `share_rewards` varchar(45) NOT NULL COMMENT '分享奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_system`
--

LOCK TABLES `dd_system` WRITE;
/*!40000 ALTER TABLE `dd_system` DISABLE KEYS */;
INSERT INTO `dd_system` VALUES (1,'12.00','5.0','5.0');
/*!40000 ALTER TABLE `dd_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_users`
--

DROP TABLE IF EXISTS `dd_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_users` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(6) NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(10) NOT NULL DEFAULT '0',
  `birthday` varchar(255) NOT NULL,
  `isAdmin` int(1) NOT NULL DEFAULT '0',
  `isDeath` int(1) NOT NULL DEFAULT '0',
  `said` int(32) NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '/resources/avatar.png',
  `registrationID` varchar(128) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_users`
--

LOCK TABLES `dd_users` WRITE;
/*!40000 ALTER TABLE `dd_users` DISABLE KEYS */;
INSERT INTO `dd_users` VALUES (72,785850,'李治明','13800138000','4297f44b13955235245b2497399d7a93',1,0,'1588034591',1,0,0,'/uploads/images/20200225/ce6f173a0fdd8323fe05191d0ebe3cb8.jpg','1517bfd3f7a374d5735',1588032599,1588727894),(73,999999,'张国栋','13416801001','508df4cb2f4d8f80519256258cfb975f',1,39,'373651200',1,0,0,'/uploads/images/20200225/81aba86c5789c65ab2e4d9a2fb0eb48e.jpg','120c83f760a78ca0661',1588032600,1588780310),(74,888888,'朱益龙','13620002358','508df4cb2f4d8f80519256258cfb975f',0,0,'1588034591',1,0,0,'/resources/avatar.png','',1588032600,1588034591),(76,123456,'李飞恒','13828855724','4297f44b13955235245b2497399d7a93',1,35,'1588034591',1,0,0,'/uploads/images/20200225/1bcddebc7c2b4b56654b9b99fc18a844.jpg','120c83f760a78ca0661',1588032601,1589435064),(77,768964,'驻场老师','13566668888','0',0,22,'1588034591',1,0,0,'/resources/avatar.png','',1588032601,1589150646),(79,0,'','15205184124','1ee5a6915615246bbb971c4cba7ada75',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032601,1588034591),(80,579145,'李星亮','17869130706','f18a339c78eed4d9fed9a03288f727cd',0,26,'1588034591',0,0,0,'/resources/avatar.png','',1588032601,1588034591),(81,257500,'','13215237736','2592492ce1d0116116110e9656ad20cc',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032602,1588034591),(82,727990,'','15819482414','bfd59291e825b5f2bbf1eb76569f8fe7',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032602,1588034591),(83,695018,'','17722020496','b70a8436dcb2dd726b94ccb50b7b7a15',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032602,1588034591),(84,187440,'饶睿','13267321811','f735292e5d7e3a3a2d11d2f1085510ba',0,20,'1588034591',0,0,0,'/resources/avatar.png','',1588032602,1588034591),(85,446163,'黄乾海','18128577802','50be88f392bf88fdb900f6e7bfc261cf',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032603,1588034591),(86,231810,'梁进文','18176913956','7eae15de33ff3bf383388dab3dcf5621',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032603,1588034591),(87,583490,'周建发','13649864748','0aa2fa7b66dbe2b4e159d9de4d429926',0,48,'1588034591',0,0,0,'/resources/avatar.png','',1588032603,1588034591),(88,0,'宋兴会','15126720802','0573fb4ddb6386a04af0211c1df2aa8c',0,23,'1588034591',0,0,0,'/resources/avatar.png','',1588032604,1588034591),(89,749549,'冷金龙','13928175792','25e3f2ad3c0cf1eb847fb542636b7100',0,0,'1588034591',0,0,0,'/resources/avatar.png','',1588032604,1588034591),(90,258220,'黄啟超','18924481118','cc3c971869837459873dc0118f0f3382',0,28,'1588034592',0,0,0,'/resources/avatar.png','',1588032604,1588034592),(91,0,'','13423324413','ec3059dd69a09c57da4f8433dd7b1524',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(92,0,'熊顺兵','18829957032','0db84e80e4e1a3ec46ad8a3526616191',1,18,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(93,0,'','13798772908','8c65d975dca2228ad95fb40377cbe497',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(94,953141,'李胜','13790265608','7a0a634ac91c34c8c207f4ff2743b1de',1,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(96,433256,'','18178786393','1e55dbf412cb74d5e2c21fb6452408c7',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(97,0,'','15817512698','f77d3c849cf43fde82515e0381dd69e8',1,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(98,516063,'','15724025228','9f06d27acfed78b43b103653d22bd2f2',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032605,1588034592),(99,127650,'','18002938185','074d8749508d2883837e2a20f8861748',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032606,1588034592),(100,733879,'李成高','13713256024','2f5239e0f84c0d4b77b96b7f42a2bf6d',1,20,'1588034592',0,0,0,'/resources/avatar.png','',1588032606,1588034592),(101,829205,'周建明','17760130617','8df47461bf3204bb4acea03401361314',1,29,'1588034592',0,0,0,'/resources/avatar.png','',1588032606,1588034592),(102,681897,'','13729992799','4cc32993ca02e01bea78a45f981094a7',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032606,1588034592),(103,0,'','15187904063','f5e5846d0643e88109cdf8c23409e8a9',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032607,1588034592),(104,401110,'','18487807026','e10adc3949ba59abbe56e057f20f883e',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032607,1588034592),(105,796489,'','18000935265','f1af3e139325a880200074793b622a82',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032607,1588034592),(106,616003,'','17688884668','d0dcbf0d12a6b1e7fbfa2ce5848f3eff',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032607,1588034592),(107,413344,'','18897576059','b206e95a4384298962649e58dc7b39d4',0,0,'1588034592',0,0,0,'/resources/avatar.png','',1588032608,1588034592),(108,788850,'刘琴','13650484877','8f102145b473ff4f4182a7ce5ff6c69f',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032608,1588034593),(109,799350,'','13266599756','438521513932437058524764fd3b4d1d',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032608,1588034593),(110,0,'','17707567676','5e8667a439c68f5145dd2fcbecf02209',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032608,1588034593),(111,959480,'','17707561676','6ebe76c9fb411be97b3b0d48b791a7c9',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032608,1588034593),(112,0,'','13720315430','d323658defc10a9d223d74a1d64f70ec',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(113,856280,'彭国池','13412642015','8ef7aee46732d1dddf3e55103ec1359d',1,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(114,0,'','13316663636','a8e69b73cfe723f12fc78cd581b38377',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(115,954250,'','18928017333','82a18c0e93750cc2f33fb0937205c2cc',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(116,0,'','15112894940','0cc30264fee831692abb4be3e4bda9a9',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(117,885880,'谭志镜','13265971086','32a4b5c1572b55ff1052cdd2d6e0f30d',1,26,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(118,0,'','15377338840','b236ae3744ebeaf45943743f9b6fba42',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032609,1588034593),(119,696630,'','13308760983','fcea920f7412b5da7be0cf42b8c93759',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032610,1588034593),(120,769210,'','18091506899','ad228da7982ae4254bc8c85c8b317fca',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032610,1588034593),(121,765250,'吴小福','15220800851','f415a11cb18fe663c625be3f3a057fea',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032610,1588034593),(122,983920,'','15977646986','5fb43fa709a2e1512a7174867ae740e5',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032610,1588034593),(123,965730,'张仕凯','15812279568','13309f7ef0809b6cf15da47d4a8e2b5b',1,27,'1588034593',0,0,0,'/resources/avatar.png','',1588032610,1588034593),(124,969770,'张国东','13790648369','d1775d20b12e430869cc7be5d7d4a27e',1,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032611,1588034593),(125,0,'','13428472561','2f686c04baa9008f93d3d10b1a7b319e',0,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032611,1588034593),(126,658350,'杨祯祥','13539011855','e1c21364530057bc884be07f32491acc',1,0,'1588034593',0,0,0,'/resources/avatar.png','',1588032611,1588034593),(127,0,'','13457308705','b0b12b165d774c81fafcf58f35513456',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032611,1588034594),(128,876210,'张三牛','18576381748','4607e782c4d86fd5364d7e4508bb10d9',1,36,'1588034594',0,0,0,'/resources/avatar.png','',1588032611,1588034594),(129,589570,'张兆成','13018621929','0b54452221edab4c13d494ec611a8c8a',1,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032611,1588034594),(130,793630,'吴祝兵','18689455681','41c376edbbcd3410e797116f11da2393',1,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032612,1588034594),(131,0,'','18024702029','75e266f182b4fa3625d4a4f4f779af54',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032612,1588034594),(132,459894,'','19988323902','cb76771ee603d16408299a163548d5a6',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032612,1588034594),(133,609545,'','15987547698','a238ba5ff9ceaa74086350fc6be0c70c',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032612,1588034594),(134,358607,'','13418334716','5513967bbaf53259bae59290b9a81bfb',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032612,1588034594),(135,0,'张才东','18087617124','a29f9a873259b0518dbec6bb2d18cc2f',1,20,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(136,207027,'','18387638611','83ee37f1ec61473e4978fe7443d6dd78',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(137,0,'','18566571733','600be132ce0e8db227e6ff54d897c7b5',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(138,274558,'','13887622914','e10adc3949ba59abbe56e057f20f883e',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(139,142277,'','13639261070','52ddecab35550096539f470d174c3e0a',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(140,749583,'周金瑞','13712990490','391aa9e266a8604137ce598f9732846a',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032613,1588034594),(141,688050,'','15112336739','e4a04f6770efc9ea09b7df1a51016893',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032614,1588034594),(142,901835,'','13097963869','3d681aef22d032e2ce5729e841dd58ce',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032614,1588034594),(143,471157,'','16675855018','9f0cb6dbd4f054e262e0059501bcc0ad',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032614,1588034594),(144,688325,'','13887507697','9b79c9d319bc08e2bd6647ba0f7ac929',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032614,1588034594),(145,113942,'','15187187782','8e374d643bd348a3ccb82551e825042e',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032615,1588034594),(146,952392,'','15099750995','86330762d38818f5dc051c097fa58a5b',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032615,1588034594),(147,905050,'','15198636160','f0635820a05d7983dd29c7225e6399fd',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032615,1588034594),(148,0,'','19987685585','d1de3c25199524d757ebcecb30ef1adb',0,0,'1588034594',0,0,0,'/resources/avatar.png','',1588032615,1588034594),(149,0,'','19977126305','ae417dd9151af85740ec241c67a4bc35',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032615,1588034595),(150,647965,'','17387601039','5b1bd39e4c04de446efd43891a0a2fe8',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032615,1588034595),(151,368424,'农明稳','18934992099','25d55ad283aa400af464c76d713c07ad',1,26,'1588034595',0,0,0,'/resources/avatar.png','',1588032616,1588034595),(152,594901,'','15078216305','3e9f7c4f188dac05618d85645e47a7fa',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032616,1588034595),(153,810348,'周美仙','13877623506','ed11ee4d1bac397e58eed481963dbd59',0,27,'1588034595',0,0,0,'/resources/avatar.png','',1588032616,1588034595),(154,999130,'伏帮顺','18388624672','63376d365d6ccac73bac234517e0bb42',1,20,'1588034595',0,0,0,'/resources/avatar.png','',1588032616,1588034595),(155,343126,'','18929425243','b9bf1ebb9aa745e5311e056b26ff83dc',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032617,1588034595),(156,933276,'','15625502998','e28be1caffb3e8df36c882c8e0ddaa35',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032617,1588034595),(157,178647,'','18308760628','8b008959fa76d38c93fad4e79fe08859',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032617,1588034595),(158,409603,'','13688737676','afb6d6f763787f078535788502ad76f1',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032617,1588034595),(159,0,'','13226728008','448ea13fa9d144bdf59d045f772b63b2',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032617,1588034595),(160,857338,'张泽隆','18291538257','44b3a8b2298c64fc31e7d5d1550972ef',1,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032618,1588034595),(161,551785,'','15377771858','004c39e3d63b312768056c5763d9eb91',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032618,1588034595),(162,624720,'','13507762453','0318d57f34de80d0630424d51ed8c8dc',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032618,1588034595),(163,514650,'苏宁宁','18177614975','3bc8006e638ccc38963e7431896e9ddd',0,17,'1588034595',0,0,0,'/resources/avatar.png','',1588032618,1588034595),(164,572891,'谭金花','13297768258','c770240a25ec78ab0c82b78d312b2148',0,31,'1588034595',0,0,0,'/resources/avatar.png','',1588032618,1588034595),(165,212421,'','14769042089','733d7be2196ff70efaf6913fc8bdcabf',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032619,1588034595),(166,0,'','15126859809','68b8f51af97da94d4ffac6d9d1f5e661',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032619,1588034595),(167,886587,'熊国红','13532663869','06cf06349d3ea65ce7bad5aa24499fd9',1,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032619,1588034595),(168,647169,'李国龙','18775632600','6da0f41c2ba1d5a44ad22553ef16aad3',1,26,'1588034595',0,0,0,'/resources/avatar.png','',1588032619,1588034595),(169,941243,'','13549451421','39ceeca25a806dffa815f04cf04a1218',0,0,'1588034595',0,0,0,'/resources/avatar.png','',1588032619,1588034595),(170,724283,'方文思','15177639141','f013c20e225122aedd02a8acb2928179',0,34,'1588034595',0,0,0,'/resources/avatar.png','',1588032620,1588034595),(171,0,'韦福音','18177811724','a15e74ba5596f9c9919fa506248b0a9e',0,21,'1588034596',0,0,0,'/resources/avatar.png','',1588032620,1588034596),(172,637048,'','18825766260','e663cbde72da3337afe080014d3c49fd',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032620,1588034596),(173,0,'','17787652726','24d3faf66f25be2df34be3a6d5b38ed9',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032620,1588034596),(174,0,'','18387606856','f73a7b216fb732ab1b8c5b73250e13c6',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032620,1588034596),(175,388374,'','15878478307','c51591667fbae3bb4cc2fe14bec9da33',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032620,1588034596),(176,0,'','18200618590','e9f5c5240c0bb39488e6dbfbdb1517e0',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(177,0,'','18508592683','966afbf8c63ce53b048c46324131ee52',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(178,623688,'','17777615207','41e38763b5ebfcf35226dfb730b805f9',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(179,0,'','13427260911','ea6f09a52ab147a4ae2beb91bb39ffed',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(180,0,'','17387670479','4b52c54534caff3b56a5e5f2e9001754',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(181,0,'','17666235746','e5850964febbf93e9045b0999a3ae8eb',1,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(182,679462,'','17869130307','e95703529dbe0877d59021c596de6781',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(183,0,'','15154917898','fcea920f7412b5da7be0cf42b8c93759',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032621,1588034596),(184,0,'','17507699222','5778a43873851b9e52e92e638616384d',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032622,1588034596),(185,0,'','18666853295','4569d246f7bd36303d44244ddc447a67',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032622,1588034596),(189,747670,'李嘉诚','13800138001','4297f44b13955235245b2497399d7a93',1,48,'1588034596',0,0,0,'/uploads/images/20200225/07d803c68642ed6a89bcd0dd3fc71445.jpg','120c83f760a78ca0661',1588032622,1589434983),(192,768520,'小喜子','13800138010','4297f44b13955235245b2497399d7a93',0,21,'1588034596',0,0,0,'/uploads/images/20200301/d241597b7f00370ce08a55a656d4538c.jpg','',1588032622,1588034596),(194,764740,'陈书记','13800138011','4297f44b13955235245b2497399d7a93',1,35,'1588034596',0,0,0,'/uploads/images/20200301/a558873e92f308d864bee6c053b8502d.jpg','',1588032622,1588034596),(195,959810,'徐工','13800138012','4297f44b13955235245b2497399d7a93',1,29,'1588034596',0,0,0,'/uploads/images/20200301/297e3c0265434bff9c628305698ee514.jpg','',1588032623,1588034596),(196,799580,'吴迪','13800138013','4297f44b13955235245b2497399d7a93',1,48,'1588034596',0,0,0,'/uploads/images/20200301/00c107f55415161a0e5caaf43fbf007b.jpg','',1588032623,1588034596),(197,0,'','13800138014','4297f44b13955235245b2497399d7a93',0,0,'1588034596',0,0,0,'/resources/avatar.png','',1588032623,1588034596),(198,745480,'维护者','13800138020','4297f44b13955235245b2497399d7a93',1,20,'1588034596',0,0,0,'/uploads/images/20200302/c08eb1aaca3de8e817f4fc207d109f56.jpg','',1588032623,1588034596),(199,745210,'超级飞侠','13800138021','4297f44b13955235245b2497399d7a93',1,29,'1588034596',0,0,0,'/uploads/images/20200302/abe45106a81fc0b80056fb440e9ac719.jpg','',1588032624,1588034596),(200,859690,'','13800138022','4297f44b13955235245b2497399d7a93',0,0,'1588034597',0,0,0,'/resources/avatar.png','',1588032624,1588034597),(201,0,'','13480085238','fa5adaf4a3be4d5eaa84223220bac8d2',0,0,'1588034597',0,0,0,'/resources/avatar.png','',1588032624,1588034597),(202,0,'陈少宇','13800138100','4297f44b13955235245b2497399d7a93',1,2,'1522252800',0,0,0,'/uploads/images/01/8b9b3bb9a96990d762dfc3db88c0a8.jpg','120c83f760a78ca0661',1588093441,1588143975),(203,0,'小哥儿','13800138002','4297f44b13955235245b2497399d7a93',1,0,'1588106491',0,0,0,'/uploads/images/f0/2c537d4739538d52375f76de07e318.jpg','120c83f760a78ca0661',1588106491,1589440662),(205,0,'华盛典','13800138009','4297f44b13955235245b2497399d7a93',0,0,'1588406617',0,0,0,'/resources/avatar.png','120c83f760a78ca0661',1588406617,1588407119),(206,0,'','15813012130','670b14728ad9902aecba32e22fa4f6bd',0,0,'1588742265',0,0,0,'/resources/avatar.png','191e35f7e0c5e40e8a7',1588742265,1588742285),(207,0,'单单','13412331222','defac44447b57f152d14f30cea7a73cb',0,0,'1588761490',0,0,0,'/resources/avatar.png','100d855909d9c9262ad',1588761490,1588761560),(210,0,'花铁雀','15363153911','4297f44b13955235245b2497399d7a93',1,0,'1589052730',0,0,0,'/uploads/images/f0/5d5b96394a49594bcf331b2bc3425d.jpg','120c83f760a78ca0661',1589052730,1589052923);
/*!40000 ALTER TABLE `dd_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_versions`
--

DROP TABLE IF EXISTS `dd_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(45) NOT NULL,
  `build` int(10) NOT NULL,
  `isStrong` tinyint(4) NOT NULL DEFAULT '0',
  `review` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(45) NOT NULL DEFAULT '版本更新',
  `subtitle` varchar(255) NOT NULL,
  `system` varchar(255) NOT NULL COMMENT '1:ios\n2:android\n3:web',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_versions`
--

LOCK TABLES `dd_versions` WRITE;
/*!40000 ALTER TABLE `dd_versions` DISABLE KEYS */;
INSERT INTO `dd_versions` VALUES (1,'1.0.0',20050610,1,0,'https://www.betaqr.com/ddio?release_id=5eb2463023389f3f0aacbf4f&fir_source=ios&fir_campaign=20050610','版本更新','1：增强系统稳定性。2：增加大量新功能','ios',0),(2,'1.0.0',20050605,1,0,'https://www.betaqr.com/dandankj?release_id=5eb1de3123389f7bf54801f3&fir_source=android&fir_campaign=20050605','版本更新','1：增强系统稳定性。2：增加大量新功能','android',0);
/*!40000 ALTER TABLE `dd_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_wallet_service_charge`
--

DROP TABLE IF EXISTS `dd_wallet_service_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_wallet_service_charge` (
  `id` int(32) NOT NULL COMMENT '提成手续费',
  `service_charge_for_withdrawal` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '提现手续费',
  `commission_fee` varchar(45) NOT NULL COMMENT '提成的提现手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_wallet_service_charge`
--

LOCK TABLES `dd_wallet_service_charge` WRITE;
/*!40000 ALTER TABLE `dd_wallet_service_charge` DISABLE KEYS */;
INSERT INTO `dd_wallet_service_charge` VALUES (1,'1.00','3.00');
/*!40000 ALTER TABLE `dd_wallet_service_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_wallet_type`
--

DROP TABLE IF EXISTS `dd_wallet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_wallet_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_wallet_type`
--

LOCK TABLES `dd_wallet_type` WRITE;
/*!40000 ALTER TABLE `dd_wallet_type` DISABLE KEYS */;
INSERT INTO `dd_wallet_type` VALUES (0,'创建钱包'),(1,'发工资'),(2,'预支'),(3,'业务提成'),(4,'驻场提成'),(5,'初级分红'),(6,'高级分红'),(7,'战略联盟分红'),(8,'蛋蛋分红'),(9,'卖出'),(10,'消费'),(11,'签到'),(12,'分享'),(13,'工资'),(18,'提现到银行卡');
/*!40000 ALTER TABLE `dd_wallet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_wallet_virtual`
--

DROP TABLE IF EXISTS `dd_wallet_virtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_wallet_virtual` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `balance` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '余额',
  `egg_coin` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '蛋币',
  `uid` varchar(45) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_wallet_virtual`
--

LOCK TABLES `dd_wallet_virtual` WRITE;
/*!40000 ALTER TABLE `dd_wallet_virtual` DISABLE KEYS */;
INSERT INTO `dd_wallet_virtual` VALUES (9,'112.1','1.0','210',1589229028,1589243460),(10,'0.0','3','76',1589233531,1589472561),(11,'2481.5','0.0','73',1589265366,1589481451),(12,'0.0','0.0','189',1589431807,1589431807),(13,'2369.7','5','203',1589434489,1589516668),(15,'0.0','0.0','72',1589514947,1589514947);
/*!40000 ALTER TABLE `dd_wallet_virtual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_wallet_virtual_logs`
--

DROP TABLE IF EXISTS `dd_wallet_virtual_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dd_wallet_virtual_logs` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '钱包表',
  `wid` int(32) NOT NULL DEFAULT '0' COMMENT '钱包ID',
  `tid` int(32) NOT NULL COMMENT '流水类型',
  `single_number` varchar(64) NOT NULL COMMENT '单号',
  `amount` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '金额',
  `amount_type` varchar(45) NOT NULL COMMENT '金额类型 收入 or 支出',
  `uid` int(32) NOT NULL COMMENT '用户ID',
  `deduction` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '其他扣除费用，如手续费',
  `balance` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '余额',
  `egg_coin` varchar(45) NOT NULL DEFAULT '0.0' COMMENT '蛋币',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `commission_fee` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_wallet_virtual_logs`
--

LOCK TABLES `dd_wallet_virtual_logs` WRITE;
/*!40000 ALTER TABLE `dd_wallet_virtual_logs` DISABLE KEYS */;
INSERT INTO `dd_wallet_virtual_logs` VALUES (19,0,0,'0b62e784067c55d1c50ce8799d0fa906','0.0','',210,'0.0','0.1','0.0',1589229028,1589229028,0,'0.00'),(20,0,0,'e63ede1f4317f2a531463537022f519b','0.0','',76,'0.0','0.0','0.0',1589233531,1589233531,1,'0.00'),(21,9,2,'39503d9736992900cd9eaadde1d86b58','112','收入',210,'0.0','112.1','0.0',1589243460,1589243460,1,'0.00'),(22,0,0,'8d9178d0bfb03ce31eabb23eaac18629','0.0','',73,'0.0','0.0','0.0',1589265366,1589265366,1,'0.00'),(23,0,0,'b1477dea0faeb17f6f8f7d73bef35a6e','0.0','',189,'0.0','0.0','0.0',1589431807,1589431807,1,'0.00'),(24,0,0,'f28265c2122e08ad2361f4c4cfec57b5','0.0','',203,'0.0','0.0','0.0',1589434489,1589434489,1,'0.00'),(25,10,11,'db3d9d523d8394eb194739d548aed60c','0.0','',76,'0.0','0.0','3.0',1589472561,1589472561,1,'0.00'),(29,11,7,'4ac6e20cff5d9c4cc3eb4a370c1fd6b0','381.29','',73,'0.0','1903.45','0.0',1589481151,1589481151,0,'3.00'),(30,11,4,'04f0b9b1826cb8c078314ce5d4bcc5a5','7.30','',73,'0.0','1910.75','0.0',1589481368,1589481368,0,'3.00'),(31,11,5,'173a4ba547ef1ccae2f3e88449811a3c','570.75','',73,'0.0','2481.5','0.0',1589481451,1589481451,0,'3.00'),(32,13,11,'056e07180053814bed8618613e5c4eca','0.0','',203,'0.0','0.0','5.0',1589508149,1589508149,1,'0.00'),(33,13,13,'2074a3899dc03e7ae747cee60a4434f5','2480','',203,'0.0','2480','0.0',1589511254,1589511254,0,'0.0'),(34,0,0,'fb97af0dc3adb7718c0debc24f730673','0.0','',72,'0.0','0.0','0.0',1589514947,1589514947,1,'0.00'),(35,13,18,'35cf36399bd90d9d64569dac59b71415','10','',203,'0.0','2470','0.0',1589515703,1589515703,0,'0'),(36,13,18,'279f039c9187eb532a93159f8bae06b7','10','',203,'0.0','2460','0.0',1589515752,1589515752,0,'0'),(37,13,18,'b8daf912e9de58621b23a8223f124aeb','10','',203,'0.0','2450','0.0',1589515882,1589515882,0,'0'),(38,13,18,'134ef80cf279c52eeb8ff749b7f7f946','10','',203,'0.0','2440','0.0',1589515947,1589515947,0,'0'),(39,13,18,'79fae52731544a5c70ad0d7938d3a87c','10','',203,'0.0','2430','0.0',1589516123,1589516123,0,'0'),(40,13,18,'15c0c64291bbee248eb9614c016a8e3c','10','',203,'0.0','2420','0.0',1589516146,1589516146,0,'0'),(41,13,18,'e37259a7a16bf8a719a8bcfd54b4ca54','10','',203,'0.0','2410','0.0',1589516172,1589516172,0,'0'),(42,13,18,'7502da9dcae3616eb8eb9444346c05a0','10','',203,'0.0','2400','0.0',1589516317,1589516317,0,'0'),(43,13,18,'df14ff64631cf769afaf8d02048cbf16','10','',203,'0.0','2390','0.0',1589516348,1589516348,0,'0'),(44,13,18,'4b6857577c799f227707f00f0889e3e4','10','',203,'0.0','2380','0.0',1589516399,1589516399,0,'0'),(45,13,18,'c10091ba8f9e3b8a8945879f3c1f0b5c','10','',203,'0.0','2370','0.0',1589516421,1589516421,0,'0'),(46,13,18,'5e3a8a52ff2c0089f78ff83fc3ceaec7','0.1','',203,'0.0','2369.9','0.0',1589516546,1589516546,0,'0'),(47,13,18,'674cea727ccd84d5c2285593436df58d','0.1','',203,'0.0','2369.8','0.0',1589516570,1589516570,0,'0'),(48,13,18,'0a9ccadf3fc1f8f47ef5bca11af7eab0','0.1','',203,'0.0','2369.7','0.0',1589516668,1589516668,0,'0');
/*!40000 ALTER TABLE `dd_wallet_virtual_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_accounts`
--

DROP TABLE IF EXISTS `ss_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_accounts` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(32) unsigned DEFAULT '0' COMMENT '1工资 2提成 3预支 4消费 ',
  `status` int(16) unsigned DEFAULT '0' COMMENT '-1异常 0未处理 1完成',
  `money` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0.00' COMMENT '金额',
  `uid` int(32) unsigned NOT NULL COMMENT '发起者',
  `t_uid` int(32) DEFAULT NULL COMMENT '审核者',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `creation_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务流水总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_accounts`
--

LOCK TABLES `ss_accounts` WRITE;
/*!40000 ALTER TABLE `ss_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_ad`
--

DROP TABLE IF EXISTS `ss_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_ad` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '广告类型 1启动广告 2banner广告 3职位广告',
  `title` varchar(255) DEFAULT NULL COMMENT '广告标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '子标题',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `time` varchar(255) DEFAULT NULL COMMENT '广告时间',
  `image` varchar(255) DEFAULT NULL COMMENT '广告封面',
  `create_time` varchar(16) DEFAULT NULL,
  `update_time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_ad`
--

LOCK TABLES `ss_ad` WRITE;
/*!40000 ALTER TABLE `ss_ad` DISABLE KEYS */;
INSERT INTO `ss_ad` VALUES (35,'2','','','http://www.baidu.com','0','/uploads/images/20200113/d7a131df1ce2f07384c9d7d46e1b81c3.jpg','1578927218','1578927218'),(36,'3','','','http:///www.baidu.com','0','/uploads/images/20200113/e6f5d95630fb7050c1a1a4ef58f50474.jpg','1578927249','1578927249'),(37,'2','','','http://www.baidu.com','0','/uploads/images/20200115/bfbba8d9badc8d0e738c82c24b3a4ca7.jpg','1579020213','1579020213'),(42,'1','广告标题','副标题','http://www.jd.com','20','/uploads/images/20200115/010d8634703b5726f431a724c0c87195.png','1579021028','1579021028'),(43,'3','','','http://www.taobao.com','0','/uploads/images/20200115/26ee50bb39238fc9133f163d1c00beb1.jpg','1579021067','1579021067'),(44,'3','','','http://www.bing.com.cn','0','/uploads/images/20200115/42e0c408ed285d9cca3e1bd43912f642.jpg','1579021129','1579021129');
/*!40000 ALTER TABLE `ss_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_articles`
--

DROP TABLE IF EXISTS `ss_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_articles` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '文章类型(外键)',
  `visible` varchar(255) DEFAULT NULL COMMENT '谁可见',
  `users_id` int(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `desn` varchar(255) DEFAULT NULL COMMENT '描述',
  `click` varchar(255) DEFAULT '0' COMMENT '点击次数',
  `pay_count` int(255) unsigned DEFAULT '0' COMMENT '购买次数',
  `dandan_cost` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '蛋币个数',
  `much_money` float(255,1) NOT NULL DEFAULT '0.0' COMMENT '多少钱',
  `image` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `body` varchar(10000) DEFAULT NULL COMMENT '文章内容',
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_articles`
--

LOCK TABLES `ss_articles` WRITE;
/*!40000 ALTER TABLE `ss_articles` DISABLE KEYS */;
INSERT INTO `ss_articles` VALUES (1,'1','[0,1,2,100,600]',119,'苹果怒怼美国政府 要为解锁iPhone打官司','苹果怒怼美国政府 要为解锁iPhone打官司','0',0,0,0.0,'/uploads/images/20200117/3f5aa06db8580b4574ddbe2a71032b8e.jpeg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">数日前，苹果拒绝了FBI要求苹果公司解锁与佛罗里达枪击案有关的两部iPhone手机，而遭到FBI起诉，同时美国司法部长威廉·巴尔（William Barr）也再次要求苹果提供解锁服务。</span></p><p><img class=\"large\" src=\"https://pics5.baidu.com/feed/86d6277f9e2f0708325d5ca742d9a89fab01f2c4.jpeg?token=eba7451686a484075fd0f085271e1769&s=0F156D84CC60FC86414C09D8030050B2\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">因为此事，苹果遭到了美国总统带头的炮轰行为，但苹果针对这一事件并没有选择退让，苹果CEO库克召集了几名高级顾问，为了保护iPhone中的加密数据，苹果可能会选择起诉美国政府，对于消费者和政府利益的权衡，作为全球最大的消费电子公司而言依旧很难做到面面俱到。</span></p><p><br/></p>','1579340645','1579340645'),(3,'2','[0,1,2,100,200,201,300,400,500,600]',119,'标题','描述\n','0',0,0,0.0,'/uploads/images/20200118/b6738e19b8ee2edf1f990649eb28ebe6.jpg','<p><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">春节</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">，即农历新年，是一年之岁首、传统意义上的年节。俗称新春、新年、新岁、岁旦、年禧、大年等，口头上又称度岁、庆岁、过年、过大年。</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">春节</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">历史悠久，由上古时代岁首祈年祭祀演变而来。万物本乎天、人本乎祖，祈年祭祀、敬天法祖，报本反始也。</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">春节</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">的起源蕴含着深邃的文化内涵，在传承发展中承载了丰...</span></p>','1579340645','1583146795'),(4,'2','[0,1,2,100,200,201,300,400,500,600]',119,'揭秘！为什么现在还不能回校上课？看完这个视频就知道了……','2月28日，教育部党组印发通知，全国大中小学、幼儿园等开学时间原则上继续推迟，中小学开学工作要强化属地责任，错时错峰开学，可安排高三、初三毕业班学生先返校。','0',0,0,0.0,'/uploads/images/20200302/95852cc7bca1e19c62b0b1d2b8db5b92.jpg','<p>2月28日，教育部党组印发通知，全国大中小学、幼儿园等开学时间原则上继续推迟，中小学开学工作要强化属地责任，错时错峰开学，可安排高三、初三毕业班学生先返校。</p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200302/1583144918187105.jpg\" alt=\"\"/></p><p>　　广东省教育厅已于近日印发了线上教育安排的通知，全省中小学校3月2日起开展线上教育，学生不返校；大专院校、中职学校3月份开展线上教育，学生不返校；幼儿园、特殊教育学校不开展线上教育，学生不返校。</p><p>　　开学继续推迟，虽说给家长孩子和老师带来了很多不便，但如果你看了下面这个用数据模型制作的小视频，就会明白为什么要对开学这件事如此谨慎了！</p><p>　　从前有一座学校</p><p>　　同学们学习、生活在</p><p>　　教室、食堂、还有宿舍...</p><p>　　他们非常快乐</p><p>　　突然有一天....</p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200302/1583144918393482.jpg\" alt=\"\" width=\"305\" height=\"141\"/></p><p style=\"text-align: center;\"><img src=\"http://m.top.cnr.cn/bdxw/20200302/W020200302277972411766.gif\" alt=\"\"/></p><p style=\"text-align: center;\"><img src=\"http://m.top.cnr.cn/bdxw/20200302/W020200302277973024021.gif\" alt=\"\"/></p><p style=\"text-align: center;\"><img src=\"http://m.top.cnr.cn/bdxw/20200302/W020200302277973374331.gif\" alt=\"\"/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><img src=\"http://m.top.cnr.cn/bdxw/20200302/W020200302277973471117.gif\" alt=\"\"/></p><p>　　看完视频后，不少网友都留言表示，虽然只是模拟开学的情况，但是已经能够直观的感受到，没有做好疫情防护下就开学，后果将会不堪设想</p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200302/1583144962991306.png\" alt=\"\"/></p><p><strong>深圳市教育局局长：</strong></p><p><strong>　　疫情不结束，坚决不开学</strong></p><p>　　日前，深圳市教育局局长陈秋明做客深圳电台《民心桥》节目时，就已经明确表示：</p><p>　　疫情不结束，坚决不开学</p><p>　　要把师生生命安全和身心健康放在第一位</p><p>　　陈秋明透露，深圳何时开学目前还没有明确时间表，会根据疫情发展情况以及上级规定来综合研判，审慎研究，科学确定开学时间。</p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200302/1583144981245434.gif\" alt=\"\"/></p><p>　　“开展高质量的在线教学，是我们最好的防御手段，现在不清楚什么时候开学，多长时间之后开学也不清楚，如果不开展任何教学活动也不现实，只要我们把在线教学正常开展起来，有句话叫作‘手中有粮，心中不慌’”。陈秋明说，从不同层面做的调查和反馈来看，对于深圳开展的在线教学，大部分家长是支持的</p><p><br/></p>','1579340645','1583146946'),(5,'2','[0,1,2,100,200,201,300,400,500,600]',119,'标题','描述\n','0',0,0,0.0,'/uploads/images/20200302/8901376227963533246651c778de1fc5.jpg','','1579341228','1583153946'),(6,'2','[0,1,2,100,200,201,300,400,500,600]',127,'放假通知','春节放假','0',0,0,0.0,NULL,'<p>&nbsp; &nbsp; &nbsp; 春节于2020年1月21日至2020年1月31日放假！&nbsp;春节于2020年1月21日至2020年1月31日放假！&nbsp;春节于2020年1月21日至2020年1月31日放假！&nbsp;春节于2020年1月21日至2020年1月31日放假！&nbsp;春节于2020年1月21日至2020年1月31日放假！&nbsp;春节于2020年1月21日至2020年1月31日放假！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 蛋蛋科技</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20200119/1579429812467069.png\" title=\"1579429812467069.png\" alt=\"image.png\"/></p>','1579429616','1583154494'),(8,'2','[0,1,2,100,200,201,300,400,500,600]',73,'走进新时代','描述','0',0,0,0.0,'/uploads/images/20200302/d64840e0920ab457bd4d886da033be05.jpg','<p>内容<br/></p>','1583156693','1583156693');
/*!40000 ALTER TABLE `ss_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_articles_cates`
--

DROP TABLE IF EXISTS `ss_articles_cates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_articles_cates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_articles_cates`
--

LOCK TABLES `ss_articles_cates` WRITE;
/*!40000 ALTER TABLE `ss_articles_cates` DISABLE KEYS */;
INSERT INTO `ss_articles_cates` VALUES (1,'涨知识'),(2,'公告');
/*!40000 ALTER TABLE `ss_articles_cates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_enterprise`
--

DROP TABLE IF EXISTS `ss_enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL COMMENT '企业主id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(255) DEFAULT NULL COMMENT '企业主联系电话',
  `enterprise_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `enterprise_commisstions` varchar(255) DEFAULT NULL COMMENT '企业分红',
  `dandan_commisstions` varchar(255) DEFAULT NULL COMMENT '蛋蛋平台提成',
  `primary_commissions` varchar(255) DEFAULT NULL COMMENT '初级合伙人提成',
  `senior_commissions` varchar(255) DEFAULT NULL COMMENT '高级合伙人提成',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `status` int(255) DEFAULT NULL COMMENT '合作状态 1合伙中 2结束合作',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作员',
  `sos_name` varchar(255) DEFAULT NULL COMMENT '紧急联系人',
  `sos_phone` varchar(255) DEFAULT NULL COMMENT '紧急联系人电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='企业表(战略联盟)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_enterprise`
--

LOCK TABLES `ss_enterprise` WRITE;
/*!40000 ALTER TABLE `ss_enterprise` DISABLE KEYS */;
INSERT INTO `ss_enterprise` VALUES (105,'74','朱益龙','13650484877','朱益龙公司','27.5','11','45','16.5','广东省','东莞市','常平镇','胜和豪岗新村2号楼B座702',1,'1582135311','1582135311','朱益龙','刘琴','13650484877'),(106,'73','张国栋','13416801001','张国栋公司','27.5','11','45','16.5','广东省','东莞市','常平镇','口岸大道53号',1,'1582135554','1582135554','朱益龙','张国栋','13416801001');
/*!40000 ALTER TABLE `ss_enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_event`
--

DROP TABLE IF EXISTS `ss_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_event` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '事件ID',
  `type` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '事件类型',
  `uid` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '事件发起者id',
  `parent_id` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `jid` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '职位id',
  `fid` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '工厂id',
  `rid` int(32) unsigned NOT NULL DEFAULT '0' COMMENT '事件接收者id',
  `status` int(10) unsigned DEFAULT '0' COMMENT '事件当前状态 0未处理 1处理中 2已完成 3已驳回 4已失效 5代审',
  `title` varchar(32) NOT NULL COMMENT '事件标题',
  `remark` varchar(255) DEFAULT '无' COMMENT '事件备注',
  `level` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '0初级合伙人需要审核 1:人事部需要审核 2:驻场老师需要审核 3:其他人审核 10:需要财务部审核',
  `total` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '报销金额',
  `images` varchar(1024) DEFAULT NULL,
  `extend` varchar(2014) DEFAULT NULL,
  `start_time` varchar(15) DEFAULT '0' COMMENT '请假起始时间',
  `end_time` varchar(15) DEFAULT '0' COMMENT '请假结束时间',
  `create_time` varchar(15) DEFAULT '0' COMMENT '创建时间',
  `update_time` varchar(15) DEFAULT '0' COMMENT '更新时间',
  `history` varchar(2014) DEFAULT NULL COMMENT '历史操作',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_event`
--

LOCK TABLES `ss_event` WRITE;
/*!40000 ALTER TABLE `ss_event` DISABLE KEYS */;
INSERT INTO `ss_event` VALUES (97,100,119,0,0,30,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579635652','1582840449','[]'),(98,100,119,0,0,31,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579636081','1582840452','[]'),(99,100,119,0,0,32,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579636466','1582840459','[]'),(100,100,119,0,0,33,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579636979','1582840462','[]'),(101,100,119,0,0,34,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579638184','1582840466','[]'),(106,100,119,0,0,35,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579685927','1582840468','[]'),(107,100,119,0,0,36,0,2,'创建工厂','',0,0.00,'[]',NULL,'0','0','1579686501','1582840471','[]'),(135,800,76,0,34,30,0,5,'普工','职位报名',0,0.00,'[]',NULL,'0','0','1582766448','1582843286','[{\"uid\":124,\"create_time\":1582843286,\"remark\":\"同意\"}]'),(139,100,76,0,0,0,0,0,'初级合伙人','同意',0,0.00,'[]',NULL,'0','0','1582769189','1582822577','[]'),(143,200,76,0,0,0,0,0,'高级合伙人','好像有个人就',0,0.00,'[]','{\"province\":\"\\u8fbd\\u5b81\",\"city\":\"\\u672c\\u6eaa\\u5e02\",\"county\":\"\\u5357\\u82ac\\u533a\"}','0','0','1582812894','1582822602','[]'),(144,300,76,0,0,0,0,2,'战略联盟','原因',0,0.00,'[]','{\"enterprise\":\"\\u674e\\u98de\\u6052\\u516c\\u53f8\",\"province\":\"\\u6c5f\\u82cf\",\"city\":\"\\u5357\\u4eac\\u5e02\",\"county\":\"\\u79e6\\u6dee\\u533a\",\"address\":\"\\u8be6\\u60c5\\u5730\\u5740\"}','0','0','1582812964','1582823771','[]'),(145,400,76,0,0,31,0,2,'驻场老师','原因',0,0.00,'[]','{\"factory\":{\"id\":31,\"number\":\"20200122034800AM0958\",\"factory_name\":\"\\u4e1c\\u839e\\u664b\\u6768\\u7535\\u5b50\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u5e38\\u5e73\\u9547\\u5c97\\u6893\\u52a0\\u6cb9\\u7ad9\\u5bf9\\u9762\",\"location\":\"113.967027,22.983452\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"20000000\",\"registered_capital\":\"30000000\",\"km\":\"10000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"800\",\"average_age\":\"18-45\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"18-45\",\"word_tense_month\":\"200\",\"required_age\":\"18-45\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"4\\u5929\",\"job_way\":\"\\u767d\\u73ed\\u5750\\u73ed\\uff0c\\u5c11\\u90e8\\u5206\\u591c\\u73ed\",\"isInsurance\":\"\\u662f\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"5\\u5143\\/\\u665a\",\"hospice\":\"\\u5382\\u5185\\u4f4f\\u5bbf\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u5f20\\u56fd\\u4e1c\",\"receiver_phone\":\"13790648369\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\\u674e\\u5c0f\\u59d0\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/7058d40a8b620609e18c864e8451242e.jpg\",\"validity\":\"2019-08 ~ 2020-12\",\"balance_date\":\"2019-12-17\",\"longitude\":\"113.967027\",\"latitude\":\"22.983452\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":98,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/images\\/20200122\\/cd8ffef5d85c3162b65262','0','0','1582813028','1582958765','[{\"uid\":124,\"create_time\":1582865955,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1582958724,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1582958765,\"status\":\"2\",\"remark\":\"通过\"}]'),(146,500,76,0,0,33,0,2,'工厂HR','原因',0,0.00,'[]','{\"factory\":{\"id\":33,\"number\":\"20200122040258AM0454\",\"factory_name\":\"\\u4e1c\\u839e\\u5e02\\u91d1\\u9e3f\\u76db\\u7535\\u5668\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u4e1c\\u5e73\\u5927\\u905318\\u53f7\",\"location\":\"114.037376,23.018149\",\"cooperation_type\":\"1\",\"nature\":\"\\u81ea\\u5efa\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"\\u672a\\u77e5\",\"registered_capital\":\"500\\u4e07\\u4eba\\u6c11\\u5e01\",\"km\":\"1000\\u5e73\\u65b9\\u7c73\",\"male_female_ratio\":\"\\u7537\\u5973\\u6bd4\\u4f8b3:1\",\"staff_count\":\"500\\u4eba\",\"average_age\":\"18-45\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"18-45\",\"word_tense_month\":\"100\",\"required_age\":\"18-50\",\"word_time\":\"10-12\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u957f\\u767d\\u73ed\\u5750\\u73ed\\/\\u7ad9\\u73ed\",\"isInsurance\":\"\\u662f\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u5426\",\"hospice\":\"\\u5382\\u533a\\u5185\",\"hospice_count\":\"6-8\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u5f53\\u5929\",\"allocation_content\":\"\\u5c97\\u524d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u540d\\u65cf\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\\u539f\\u4ef6\\uff0c\\u8eab\\u4efd\\u8bc1\\u590d\\u5370\\u4ef62\\u5f20\\uff0c\\u5f69\\u8272\\u4e00\\u5bf8\\u7167\\u72472\\u5f20\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u51b7\\u91d1\\u9f99\",\"receiver_phone\":\"13928175792\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/335c6e28116e763e3d7fdfe208ba6e0d.jpg\",\"validity\":\"2019-10 ~ 2020-01\",\"balance_date\":\"\\u6bcf\\u6708\\u6708\\u5e95\\u53d1\\u653e\\u4e0a\\u6708\\u5de5\\u8d44\",\"longitude\":\"114.037376\",\"latitude\":\"23.018149\",\"payoff_way\":\"0\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":100,\"tense_month\":[\"1\\u6708\",\"2\\u6708\",\"3\\u6708\",\"4\\u6708\",\"5\\u6708\",\"6\\','0','0','1582813044','1582959052','[{\"uid\":124,\"create_time\":1582959052,\"status\":\"2\",\"remark\":\"通过\"}]'),(147,600,76,0,0,0,0,2,'业务员','原因是',0,0.00,'[]','{\"province\":\"\\u8fbd\\u5b81\",\"city\":\"\\u978d\\u5c71\\u5e02\",\"county\":\"\\u5343\\u5c71\\u533a\"}','0','0','1582813057','1582823915','[]'),(148,100,192,0,0,0,0,2,'初级合伙人','原因',0,0.00,'[]','{\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"county\":\"\\u4e1c\\u57ce\\u533a\"}','0','0','1582836320','1582844255','[{\"uid\":124,\"create_time\":1582844045,\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1582844178,\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1582844255,\"remark\":\"status\"}]'),(149,200,192,0,0,0,0,2,'高级合伙人','原因',0,0.00,'[]','{\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"county\":\"\\u4e1c\\u57ce\\u533a\"}','0','0','1582836362','1582844344','[{\"uid\":124,\"create_time\":1582844344,\"remark\":\"同意\"}]'),(150,300,192,0,0,0,0,0,'战略联盟','原因',0,0.00,'[]','{\"enterprise\":\"\",\"province\":\"\\u5c71\\u897f\",\"city\":\"\\u9633\\u6cc9\\u5e02\",\"county\":\"\\u90ca\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\"}','0','0','1582836416','1582836416','[]'),(151,400,192,0,0,30,0,2,'驻场老师','原因',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1582836431','1582844418','[{\"uid\":124,\"create_time\":1582844418,\"remark\":\"同意\"}]'),(152,500,192,0,0,30,0,2,'工厂HR','无',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1582836441','1582958989','[{\"uid\":124,\"create_time\":1582844400,\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1582958879,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1582958962,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1582958989,\"status\":\"2\",\"remark\":\"通过\"}]'),(153,600,192,0,0,0,0,2,'业务员','原因',0,0.00,'[]','{\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u8302\\u540d\\u5e02\",\"county\":\"\\u8302\\u6e2f\\u533a\"}','0','0','1582836470','1582844410','[{\"uid\":124,\"create_time\":1582844410,\"remark\":\"同意\"}]'),(155,1000,192,76,34,30,0,2,'普工','职位报名',3,0.00,'[]',NULL,'0','0','1582852071','1583072367','[{\"uid\":76,\"create_time\":1582858888,\"status\":2,\"remark\":\"驳回\"},{\"uid\":76,\"create_time\":1582859027,\"status\":3,\"remark\":\"驳回\"},{\"uid\":76,\"create_time\":1582859282,\"status\":2,\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1582859315,\"status\":1,\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1582860969,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1582968035,\"status\":2,\"level\":3,\"remark\":\"同意\"},{\"uid\":76,\"create_time\":1582968398,\"status\":2,\"level\":3,\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583072335,\"status\":\"2\",\"remark\":\"重审\"},{\"uid\":76,\"create_time\":1583072367,\"status\":2,\"level\":3,\"remark\":\"ok\"}]'),(156,1000,194,76,34,30,0,3,'普工','职位报名',3,0.00,'[]',NULL,'0','0','1583032849','1583038635','[{\"uid\":76,\"create_time\":1583036540,\"status\":1,\"level\":1,\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583036597,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583037047,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":76,\"create_time\":1583038635,\"status\":3,\"level\":3,\"remark\":\"驳回\"}]'),(157,1000,194,76,34,30,0,2,'普工','职位报名',3,0.00,'[]',NULL,'0','0','1583041320','1583043063','[{\"uid\":76,\"create_time\":1583042079,\"status\":1,\"level\":1,\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1583042133,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1583042266,\"status\":2,\"level\":3,\"remark\":\"已到场\"},{\"uid\":76,\"create_time\":1583042423,\"status\":2,\"level\":3,\"remark\":\"已到场\"},{\"uid\":76,\"create_time\":1583042593,\"status\":2,\"level\":3,\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1583042777,\"status\":2,\"level\":3,\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1583043063,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(158,1001,194,76,34,30,0,3,'工时','10小时',3,0.00,'[]','{\"hours\":10.00,\"staff_price\":\"20.00\",\"antipate\":\"200.00\"}','0','0','1583048876','1583073732','[{\"uid\":192,\"create_time\":1583073732,\"status\":3,\"level\":3,\"remark\":\"不对\"}]'),(159,1001,194,76,34,30,0,2,'工时','5小时',3,0.00,'[]','{\"hours\":5.00,\"staff_price\":\"20.00\",\"antipate\":\"100.00\"}','0','0','1583049595','1583073725','[{\"uid\":192,\"create_time\":1583073725,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(160,1001,194,76,34,30,0,3,'工时','6小时',3,0.00,'[]','{\"hours\":6.00,\"staff_price\":\"20.00\",\"antipate\":\"120.00\"}','0','0','1583049665','1583073702','[{\"uid\":192,\"create_time\":1583073702,\"status\":3,\"level\":3,\"remark\":\"不对\"}]'),(161,1000,195,76,34,30,0,2,'普工','职位报名',3,0.00,'[]','{\"creation_time\":1583056630099}','0','0','1583056631','1583056830','[{\"uid\":76,\"create_time\":1583056773,\"status\":1,\"level\":1,\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1583056817,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":76,\"create_time\":1583056830,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(162,1001,195,76,34,30,0,2,'工时','10小时',3,0.00,'[]','{\"hours\":10.00,\"staff_price\":\"20.00\",\"antipate\":\"200.00\"}','0','0','1583056928','1583073692','[{\"uid\":192,\"create_time\":1583073692,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(163,1000,196,76,34,30,0,2,'普工','职位报名',3,0.00,'[]','{\"creation_time\":1583057423070}','0','0','1583057424','1583058243','[{\"uid\":76,\"create_time\":1583057484,\"status\":1,\"level\":1,\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1583057530,\"status\":\"2\",\"remark\":\"确认\"},{\"uid\":76,\"create_time\":1583058087,\"status\":2,\"level\":3,\"remark\":\"通过\"},{\"uid\":76,\"create_time\":1583058243,\"status\":2,\"level\":3,\"remark\":\"能力\"}]'),(164,400,192,76,0,30,0,2,'驻场老师','驻场',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1583070645','1583070673','[{\"uid\":124,\"create_time\":1583070673,\"status\":\"2\",\"remark\":\"通过\"}]'),(165,400,192,76,0,30,0,2,'驻场老师','驻场',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1583071720','1583071740','[{\"uid\":124,\"create_time\":1583071740,\"status\":\"2\",\"remark\":\"通过\"}]'),(166,500,192,76,0,30,0,2,'工厂HR','工厂HR',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1583071785','1583071954','[{\"uid\":124,\"create_time\":1583071802,\"status\":\"2\",\"remark\":\"通过\"},{\"uid\":124,\"create_time\":1583071954,\"status\":\"2\",\"remark\":\"HR\"}]'),(167,1001,192,76,34,30,0,2,'工时','3小时',3,0.00,'[]','{\"hours\":3.00,\"staff_price\":\"20.00\",\"antipate\":\"60.00\"}','0','0','1583072431','1583072455','[{\"uid\":192,\"create_time\":1583072455,\"status\":2,\"level\":3,\"remark\":\"确认\"}]'),(168,100,198,76,0,0,0,2,'初级合伙人','走起',0,0.00,'[]','{\"province\":\"\\u7701\",\"city\":\"\\u5e02\",\"county\":\"\\u533a\\/\\u53bf\\/\\u9547\"}','0','0','1583081764','1583081940','[{\"uid\":124,\"create_time\":1583081940,\"status\":\"2\",\"remark\":\"同意\"}]'),(169,100,199,198,0,0,0,2,'初级合伙人','走起',0,0.00,'[]','{\"province\":\"\\u9ed1\\u9f99\\u6c5f\",\"city\":\"\\u54c8\\u5c14\\u6ee8\\u5e02\",\"county\":\"\\u9053\\u91cc\\u533a\"}','0','0','1583082079','1583083346','[{\"uid\":124,\"create_time\":1583082149,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583082356,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583082440,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583082484,\"status\":\"2\",\"remark\":\"走起\"},{\"uid\":124,\"create_time\":1583082520,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":124,\"create_time\":1583082609,\"status\":\"2\",\"remark\":\"走起\"},{\"uid\":124,\"create_time\":1583082639,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583082767,\"status\":\"2\",\"remark\":\"4321\"},{\"uid\":124,\"create_time\":1583082871,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583083022,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583083092,\"status\":\"2\",\"remark\":\"1231235431\"},{\"uid\":124,\"create_time\":1583083152,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583083248,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583083346,\"status\":\"2\",\"remark\":\"098765432\"}]'),(170,200,198,76,0,0,0,2,'高级合伙人','我要成为高级合伙人',0,0.00,'[]','{\"province\":\"\\u5185\\u8499\\u53e4\",\"city\":\"\\u547c\\u4f26\\u8d1d\\u5c14\\u5e02\",\"county\":\"\\u9102\\u4f26\\u6625\\u81ea\\u6cbb\\u65d7\"}','0','0','1583083439','1583084097','[{\"uid\":124,\"create_time\":1583083474,\"status\":\"2\",\"remark\":\"给你\"},{\"uid\":124,\"create_time\":1583083595,\"status\":\"2\",\"remark\":\"123\"},{\"uid\":124,\"create_time\":1583083693,\"status\":\"2\",\"remark\":\"321\"},{\"uid\":124,\"create_time\":1583083984,\"status\":\"2\",\"remark\":\"123123\"},{\"uid\":124,\"create_time\":1583084097,\"status\":\"2\",\"remark\":\"321\"}]'),(171,200,76,73,0,0,0,2,'高级合伙人','高级合伙人申请',0,0.00,'[]','{\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u6df1\\u5733\\u5e02\",\"county\":\"\\u798f\\u7530\\u533a\"}','0','0','1583085047','1583085066','[{\"uid\":124,\"create_time\":1583085066,\"status\":\"2\",\"remark\":\"同意\"}]'),(172,600,76,73,0,0,0,2,'业务员','业务员',0,0.00,'[]','{\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u6df1\\u5733\\u5e02\",\"county\":\"\\u798f\\u7530\\u533a\"}','0','0','1583085119','1583085134','[{\"uid\":124,\"create_time\":1583085134,\"status\":\"2\",\"remark\":\"同意\"}]'),(173,1000,76,73,34,30,0,2,'普工','职位报名',3,0.00,'[]','{\"creation_time\":1583085227872}','0','0','1583085228','1583086969','[{\"uid\":124,\"create_time\":1583086859,\"status\":\"2\",\"remark\":\"同意\"},{\"uid\":73,\"create_time\":1583086969,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(174,400,73,73,0,30,0,2,'驻场老师','驻场',0,0.00,'[]','{\"factory\":{\"id\":30,\"number\":\"20200122034052AM0764\",\"factory_name\":\"\\u4e1c\\u839e\\u5fb7\\u66fc\\u6728\\u4e1a\\u6709\\u9650\\u516c\\u53f8\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u4e1c\\u839e\\u5e02\",\"district\":\"\\u4e1c\\u839e\\u5e02\",\"addres\":\"\\u6865\\u5934\\u9547\\u5927\\u6d32\\u6751\\u7b2c\\u4e00\\u5de5\\u4e1a\\u533a\\u4e1c\\u65b0\\u8def32\\u53f7\",\"location\":\"114.053624,23.022759\",\"cooperation_type\":\"1\",\"nature\":\"\\u79df\\u8d41\",\"sile\":\"\\u79c1\\u8425\\u4f01\\u4e1a\",\"assets\":\"35000000\",\"registered_capital\":\"50000000\",\"km\":\"60000\",\"male_female_ratio\":\"\\u65e0\",\"staff_count\":\"2000\",\"average_age\":\"30-50\",\"job_channel\":\"\\u81ea\\u62db\",\"stable_age\":\"30-50\",\"word_tense_month\":\"50\",\"required_age\":\"18-50\",\"word_time\":\"11\\u5c0f\\u65f6\",\"month_rest_day_count\":\"2\\u5929\",\"job_way\":\"\\u8d70\\u52a8\\u5f0f\\u7ad9\\u73ed\",\"isInsurance\":\"\\u6709\",\"isUniform\":\"\\u5426\",\"dietary_pattern\":\"\\u5de5\\u4f5c\\u9910\",\"night_differential\":\"\\u6ee1\\u591c\\u73ed\\u6ee18\\u5c0f\\u65f6\\u8865\\u52a91\\u5c0f\\u65f6\",\"hospice\":\"\\u5382\\u91cc\\u5bbf\\u820d\",\"hospice_count\":\"8\\u4eba\",\"wc\":\"\\u662f\",\"time_allocation\":\"\\u5165\\u804c\\u7b2c\\u4e00\\u5929\",\"allocation_content\":\"\\u5c97\\u4f4d\\u57f9\\u8bad\",\"national_restrictions\":\"\\u56db\\u5927\\u6c11\\u65cf\\u5df2\\u6ee1\",\"credentials\":\"\\u8eab\\u4efd\\u8bc1\",\"uid\":\"119\",\"uname\":\"\\u7d22\\u83f2\\u4e9a\",\"uphone\":\"13828855724\",\"receiver_name\":\"\\u7530\\u5586\",\"receiver_phone\":\"13790514310\",\"hr_name\":\"\",\"hr_phone\":\"\",\"dorm_supervisor_name\":\"\",\"dorm_supervisor_phone\":\"\",\"order_supervisor_name\":\"\\u5218\\u670b\",\"order_supervisor_phone\":\"13412924555\",\"logo\":\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200122\\/98df618e9953c47eb3b5dc6f03671de5.jpg\",\"validity\":\"2019-08 ~ 2020-08\",\"balance_date\":\"2019-12-17\",\"longitude\":\"114.053624\",\"latitude\":\"23.022759\",\"payoff_way\":\"1\",\"sign_price\":null,\"staff_price\":null,\"me_money\":null,\"teacher_money\":null,\"status\":1,\"remark\":\"\",\"event_id\":97,\"tense_month\":[\"7\\u6708\",\"8\\u6708\",\"9\\u6708\",\"10\\u6708\",\"11\\u6708\",\"12\\u6708\"],\"bad_jobs\":[\"\\u5408\\u540c\\u5de5\"],\"word_typed\":[\"\\u5c0f\\u65f6\\u5de5\"],\"images\":[\"\\/uploads\\/imag','0','0','1583086782','1583086867','[{\"uid\":124,\"create_time\":1583086867,\"status\":\"2\",\"remark\":\"同意\"}]'),(175,1001,73,73,34,30,0,0,'工时','10小时',2,0.00,'[]','{\"hours\":10.00,\"staff_price\":\"20.00\",\"antipate\":\"200.00\"}','0','0','1583087729','1583087729','[]'),(176,1001,73,73,34,30,0,0,'工时','7小时',2,0.00,'[]','{\"hours\":7.00,\"staff_price\":\"20.00\",\"antipate\":\"140.00\"}','0','0','1583088973','1583088973','[]'),(177,1001,73,73,34,30,0,0,'工时','8小时',2,0.00,'[]','{\"hours\":8.00,\"staff_price\":20.00,\"antipate\":160.00}','0','0','1583089246','1583089246','[]'),(178,1001,73,73,34,30,0,0,'工时','11小时',2,0.00,'[]','{\"hours\":11.00,\"staff_price\":20.00,\"antipate\":220.00}','0','0','1583089330','1583089330','[]'),(179,1001,73,73,34,30,0,0,'工时','9小时',2,0.00,'[]','{\"hours\":9.00,\"staff_price\":20.00,\"antipate\":180.00}','0','0','1583089545','1583089545','[]'),(180,1001,73,73,34,30,0,0,'工时','8小时',2,0.00,'[]','{\"hours\":8.00,\"staff_price\":\"20.00\",\"antipate\":160.00}','0','0','1583089708','1583089708','[]'),(181,1001,73,73,34,30,0,2,'工时','10小时',3,0.00,'[]','{\"hours\":10.00,\"staff_price\":\"20.00\",\"antipate\":\"200.00\"}','0','0','1583089803','1583096590','[{\"uid\":73,\"create_time\":1583096525,\"status\":2,\"level\":3,\"remark\":\"通过\"},{\"uid\":73,\"create_time\":1583096590,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(182,1001,73,73,34,30,0,2,'工时','12小时',3,0.00,'[]','{\"hours\":\"12.00\",\"staff_price\":\"20.00\",\"antipate\":\"240.00\"}','0','0','1583089884','1583096464','[{\"uid\":73,\"create_time\":1583096120,\"status\":2,\"level\":3,\"remark\":\"确认\"},{\"uid\":73,\"create_time\":1583096144,\"status\":2,\"level\":3,\"remark\":\"确认\"},{\"uid\":73,\"create_time\":1583096464,\"status\":2,\"level\":3,\"remark\":\"确认\"}]'),(186,1020,73,73,34,30,0,2,'请假','事假',3,0.00,'[]','[]','0','0','1583101165','1583106288','[{\"uid\":73,\"create_time\":1583106288,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(200,1011,73,73,34,30,0,2,'报销','好的，',3,0.10,'[\"http:\\/\\/47.105.72.106\\/uploads\\/images\\/20200302\\/9398f41428008e96b82ae1ec536c8543.jpg\",\"images\\/addImage.png\",\"images\\/addImage.png\",\"images\\/addImage.png\"]',NULL,'0','0','1583105676','1583106303','[{\"uid\":73,\"create_time\":1583106303,\"status\":2,\"level\":3,\"remark\":\"通过\"}]'),(201,3100,73,73,34,30,0,0,'天天金蛋','签到',0,0.00,'[]','[]','0','0','1580686501','1583112420','[]'),(202,3100,73,73,34,30,0,0,'天天金蛋','签到',0,0.00,'[]','[]','0','0','1583115711','1583115711','[]');
/*!40000 ALTER TABLE `ss_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_factory`
--

DROP TABLE IF EXISTS `ss_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_factory` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(32) DEFAULT NULL COMMENT '''编号''',
  `factory_name` varchar(255) DEFAULT NULL COMMENT '''工厂名称''',
  `province` varchar(255) DEFAULT NULL COMMENT '''省''',
  `city` varchar(255) DEFAULT NULL COMMENT '''市''',
  `district` varchar(255) DEFAULT NULL COMMENT '''区''',
  `addres` varchar(255) DEFAULT NULL COMMENT '''详情地址''',
  `location` varchar(255) DEFAULT NULL COMMENT '经度纬度',
  `cooperation_type` varchar(255) DEFAULT NULL COMMENT '合作方式',
  `nature` varchar(255) DEFAULT NULL COMMENT '''厂房性质''',
  `sile` varchar(255) DEFAULT NULL COMMENT '''企业性质''',
  `assets` varchar(255) DEFAULT NULL COMMENT '''固定资产''',
  `registered_capital` varchar(255) DEFAULT NULL COMMENT '''注册资金''',
  `km` varchar(255) DEFAULT NULL COMMENT '''占地面积''',
  `male_female_ratio` varchar(255) DEFAULT NULL COMMENT '''男女比例''',
  `staff_count` varchar(255) DEFAULT NULL COMMENT '''员工数量''',
  `average_age` varchar(255) DEFAULT NULL COMMENT '''平均年龄''',
  `job_channel` varchar(255) DEFAULT NULL COMMENT '''现有招聘途径''',
  `stable_age` varchar(255) DEFAULT NULL COMMENT '''稳定年龄段''',
  `tense_month` varchar(255) DEFAULT NULL COMMENT '''用工紧张月''',
  `word_tense_month` varchar(255) DEFAULT NULL COMMENT '''预计招聘量''',
  `bad_jobs` varchar(255) DEFAULT NULL COMMENT '''不好招的岗位''',
  `word_typed` varchar(255) DEFAULT NULL COMMENT '用过的工种',
  `required_age` varchar(255) DEFAULT NULL COMMENT '''年龄要求''',
  `word_time` varchar(32) DEFAULT NULL COMMENT '''工作时长''',
  `month_rest_day_count` varchar(255) DEFAULT NULL COMMENT '''每月休息几天''',
  `job_way` varchar(255) DEFAULT NULL COMMENT '''上班方式''',
  `isInsurance` varchar(255) DEFAULT NULL COMMENT '''是否保险''',
  `isUniform` varchar(255) DEFAULT NULL COMMENT '''是否体验''',
  `dietary_pattern` varchar(255) DEFAULT NULL COMMENT '''膳食标准''',
  `night_differential` varchar(255) DEFAULT NULL COMMENT '''夜班补贴''',
  `hospice` varchar(255) DEFAULT NULL COMMENT '''宿舍位置''',
  `hospice_count` varchar(255) DEFAULT NULL COMMENT '''宿舍住多少人''',
  `wc` varchar(255) DEFAULT NULL COMMENT '''是否有厕所''',
  `time_allocation` varchar(255) DEFAULT NULL COMMENT '''培训时间''',
  `allocation_content` varchar(255) DEFAULT NULL COMMENT '''培训内容''',
  `national_restrictions` varchar(255) DEFAULT NULL COMMENT '''民族限制''',
  `credentials` varchar(255) DEFAULT NULL COMMENT '''所需证件''',
  `uid` varchar(32) DEFAULT NULL COMMENT '''业务员id''',
  `uname` varchar(13) DEFAULT NULL COMMENT '''业务员名字''',
  `uphone` varchar(255) DEFAULT NULL COMMENT '''业务员联系电话''',
  `receiver_name` varchar(255) DEFAULT NULL COMMENT '''接待人''',
  `receiver_phone` varchar(255) DEFAULT NULL COMMENT '''接待人联系电话''',
  `hr_name` varchar(255) DEFAULT NULL COMMENT '''工厂HR''',
  `hr_phone` varchar(255) DEFAULT NULL COMMENT '''工厂HR联系电话''',
  `dorm_supervisor_name` varchar(255) DEFAULT NULL COMMENT '''宿管联系人''',
  `dorm_supervisor_phone` varchar(255) DEFAULT NULL COMMENT '''宿管联系电话''',
  `order_supervisor_name` varchar(255) DEFAULT NULL COMMENT '''工厂负责跟进人''',
  `order_supervisor_phone` varchar(255) DEFAULT NULL COMMENT '''工厂负责跟进人联系电话''',
  `logo` varchar(255) DEFAULT NULL COMMENT '''工厂LOGO''',
  `images` varchar(1000) DEFAULT NULL COMMENT '''工厂环境图片''',
  `validity` varchar(255) DEFAULT NULL COMMENT '合同有效期',
  `balance_date` varchar(255) DEFAULT NULL COMMENT '合同届满薪资结算日期',
  `create_time` varchar(16) DEFAULT NULL,
  `update_time` varchar(16) DEFAULT NULL,
  `delete_time` varchar(16) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `payoff_way` varchar(255) DEFAULT NULL COMMENT '工资发放形式',
  `sign_price` decimal(10,0) DEFAULT NULL COMMENT '签单价',
  `staff_price` decimal(10,0) DEFAULT NULL COMMENT '员工单价',
  `me_money` varchar(255) DEFAULT NULL COMMENT '业务员提成',
  `teacher_money` varchar(255) DEFAULT '0' COMMENT '驻场老师提成',
  `status` int(10) unsigned DEFAULT '0' COMMENT '状态:0:未审核 1:审核通过 2:驳回',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `event_id` int(32) DEFAULT NULL COMMENT '事件ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='工厂表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_factory`
--

LOCK TABLES `ss_factory` WRITE;
/*!40000 ALTER TABLE `ss_factory` DISABLE KEYS */;
INSERT INTO `ss_factory` VALUES (30,'20200122034052AM0764','东莞德曼木业有限公司','广东省','东莞市','东莞市','桥头镇大洲村第一工业区东新路32号','114.053624,23.022759','1','租赁','私营企业','35000000','50000000','60000','无','2000','30-50','自招','30-50','[\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"]','50','[\"合同工\"]','[\"小时工\"]','18-50','11小时','2天','走动式站班','有','否','工作餐','满夜班满8小时补助1小时','厂里宿舍','8人','是','入职第一天','岗位培训','四大民族已满','身份证','119','索菲亚','13828855724','田喆','13790514310','','','','','刘朋','13412924555','/uploads/images/20200122/98df618e9953c47eb3b5dc6f03671de5.jpg','[\"\\/uploads\\/images\\/20200122\\/0f526b452a32053de3cfde89b3851979.jpg\",\"\\/uploads\\/images\\/20200122\\/0f526b452a32053de3cfde89b3851979.jpg\",\"\\/uploads\\/images\\/20200122\\/7da2486a93d7de89e0e9b25926b8a14e.jpg\",\"\\/uploads\\/images\\/20200122\\/b427d90587d128e1dba1969df52d147e.jpg\",\"\\/uploads\\/images\\/20200122\\/b427d90587d128e1dba1969df52d147e.jpg\"]','2019-08 ~ 2020-08','2019-12-17','1579635652','1579642502',NULL,'114.053624','23.022759','1',20,20,'0.6','0.2',1,'',97),(31,'20200122034800AM0958','东莞晋杨电子有限公司','广东省','东莞市','东莞市','常平镇岗梓加油站对面','113.967027,22.983452','1','租赁','私营企业','20000000','30000000','10000','无','800','18-45','自招','18-45','[\"7月\",\"8月\",\"9月\",\"10月\",\"12月\"]','200','[\"合同工\"]','[\"小时工\"]','18-45','11小时','4天','白班坐班，少部分夜班','是','否','工作餐','5元/晚','厂内住宿','8人','是','入职第一天','岗位培训','四大民族已满','身份证','119','索菲亚','13828855724','张国东','13790648369','','','李小姐','','刘朋','13412924555','/uploads/images/20200122/7058d40a8b620609e18c864e8451242e.jpg','[\"\\/uploads\\/images\\/20200122\\/cd8ffef5d85c3162b6526237905e70cd.jpg\",\"\\/uploads\\/images\\/20200122\\/cd8ffef5d85c3162b6526237905e70cd.jpg\",\"\\/uploads\\/images\\/20200122\\/680d4e795ef18af9567640f718a3c1e0.jpg\"]','2019-08 ~ 2020-12','2019-12-17','1579636080','1579642529',NULL,'113.967027','22.983452','1',14,14,'0.6','0.2',1,'',98),(32,'20200122035426AM0185','东莞艾华电子有限公司','广东省','东莞市','东莞市','石排镇福地市场福隆第一工业区','113.960887,23.08193','1','租赁','私营企业','15000000','25000000','10000','全女','1200','18-45岁','自招','18-45岁','[\"3月\",\"4月\",\"5月\",\"6月\",\"7月\"]','50','[\"合同工\"]','[\"小时工\"]','18-45岁','11-12小时','4天','白班坐班','是','否','工作餐','无','厂内宿舍','8人','有','入职第一天','岗位培训','四大民族已满','身份证','119','索菲亚','13828855724','张先生','13790648369','','','杜小姐','','于宏','13428425554','/uploads/images/20200122/6f945a99c261728edfc3f0c6868a233f.jpg','[\"\\/uploads\\/images\\/20200122\\/edb3bd856c9284d47f24679dbde9afea.jpg\",\"\\/uploads\\/images\\/20200122\\/edb3bd856c9284d47f24679dbde9afea.jpg\",\"\\/uploads\\/images\\/20200122\\/edb3bd856c9284d47f24679dbde9afea.jpg\",\"\\/uploads\\/images\\/20200122\\/53ce7694aa18ab055ad205ce20e6b12b.jpg\"]','2019-10 ~ 2023-02','2023-10-01','1579636466','1579642535',NULL,'113.960887','23.08193','1',13,13,'0.6','0.2',1,'',99),(33,'20200122040258AM0454','东莞市金鸿盛电器有限公司','广东省','东莞市','东莞市','东平大道18号','114.037376,23.018149','1','自建','私营企业','未知','500万人民币','1000平方米','男女比例3:1','500人','18-45','自招','18-45','[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\"]','100','[\"小时工\"]','[\"小时工\"]','18-50','10-12','2天','长白班坐班/站班','是','否','工作餐','否','厂区内','6-8','是','入职当天','岗前培训','四大名族','身份证原件，身份证复印件2张，彩色一寸照片2张','119','索菲亚','13828855724','冷金龙','13928175792','','','','','刘朋','13412924555','/uploads/images/20200122/335c6e28116e763e3d7fdfe208ba6e0d.jpg','[\"\\/uploads\\/images\\/20200122\\/950bba7c7b33057bac4edf6b9494dfdd.jpg\",\"\\/uploads\\/images\\/20200122\\/7c97fb75ee9445fd5af55006fab4e174.jpg\",\"\\/uploads\\/images\\/20200122\\/7c97fb75ee9445fd5af55006fab4e174.jpg\",\"\\/uploads\\/images\\/20200122\\/1d7f755c54036549c6e09faf7e7ac960.jpg\"]','2019-10 ~ 2020-01','每月月底发放上月工资','1579636978','1579642542',NULL,'114.037376','23.018149','0',13,13,'0.6','0.2',1,'',100),(34,'20200122042303AM0226','深鹏电子','广东省','东莞市','东莞市','常平镇岗梓大埔工业区','113.975647,22.985408','1','租赁','私营企业','2000万人民币','2000万人民币','10000','男女不限','500人','18-45','自招','18-45','[\"3月\",\"4月\",\"10月\",\"11月\"]','50','[\"小时工\"]','[\"小时工\"]','18-45','10-12','2天','长白班坐班','有','否','工作餐','无','厂区内','6-8','有','入职当天','岗前培训','四大名族','身份证原件，身份证复印件2张，彩色一寸照片2张','119','索菲亚','13828855724','张国东','13790648369','','','','','刘朋','13412924555','/uploads/images/20200122/fdf0e5849d9d80cc051332d39ae12c40.jpg','[\"\\/uploads\\/images\\/20200122\\/c99c1770b9b426d8a410c3352ff9758c.jpg\",\"\\/uploads\\/images\\/20200122\\/cc37b1319e8c3623d652befde13c6e39.jpg\",\"\\/uploads\\/images\\/20200122\\/cc37b1319e8c3623d652befde13c6e39.jpg\",\"\\/uploads\\/images\\/20200122\\/cd8992d421f87dcb7bdd2bfc337024a7.jpg\",\"\\/uploads\\/images\\/20200122\\/cfc872f9e72645c1a8f282adff39c737.jpg\"]','2020-01 ~ 2020-02','未知','1579638183','1579642551',NULL,'113.975647','22.985408','1',14,1,'0.6','0.2',1,'',101),(35,'20200122173846PM0269','彩易达光电有限公司','广东省','东莞市','东莞市','常平镇横江厦工业一路勤上光电股份有限公司','114.01574,22.986266','1','自建','','5000000','10000000','10000','0','2000','18-48','自招','18-48','[\"9月\",\"10月\",\"11月\",\"12月\"]','50','[\"小时工\"]','[\"小时工\"]','18-48','10-10.5小时','2天','白天长白班','是','否','工作餐','无','工厂内','6-8个','是','入职当天','岗前培训','四大民族','身份证','119','索菲亚','13828855724','张先生','13416801001','','','','','张先生','13416801001','/uploads/images/20200122/4bdf7a940a02b43493160bd560e5935e.jpg','[\"\\/uploads\\/images\\/20200122\\/d7ca4bb445ae7a8319779197a8ccd1a5.jpg\",\"\\/uploads\\/images\\/20200122\\/11330369d92a1c96143fec98af4d89e2.jpg\",\"\\/uploads\\/images\\/20200122\\/aa3290f3d636674fe3d552c95e0112e8.jpg\"]','2020-01 ~ 2021-02','离职后一个星期内','1579685926','1579685956',NULL,'114.01574','22.986266','0',17,14,'0.3','0.2',1,'',106),(36,'20200122174820PM0793','奕东电子科技','广东省','东莞市','东莞市','同沙东城科技园同欢路','113.831914,22.983674','1','租赁','私营企业','5000000','10000000','20000平方','男女不限','2800','18-45岁','自招','18-45岁','[\"9月\",\"10月\",\"11月\",\"12月\"]','80','[\"小时工\"]','[\"小时工\"]','18-45岁','10小时','4天','长白班坐班','是','否','工作餐','无','工厂内','空调宿舍4-6人/间','是','入职当天','岗前培训','四大民族','身份证','119','索菲亚','13828855724','张先生','13416801001','','','','','张先生','13416801001','/uploads/images/20200122/7cce3e321357710ca56a3f50e3d6edd2.gif','[\"\\/uploads\\/images\\/20200122\\/76968d0850a7d790120bfb0488a4a958.jpg\",\"\\/uploads\\/images\\/20200122\\/7b5cff671a48553bede2d5940284016e.jpg\",\"\\/uploads\\/images\\/20200122\\/77786a432c3d9c555fc65314a9fd0195.jpg\"]','2020-01 ~ 2020-12','离职后一周内','1579686500','1579686516',NULL,'113.831914','22.983674','0',18,14,'0.3','0.2',1,'',107);
/*!40000 ALTER TABLE `ss_factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_factory_role`
--

DROP TABLE IF EXISTS `ss_factory_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_factory_role` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `hr` int(10) DEFAULT '0' COMMENT '是否工厂HR',
  `teacher` int(10) DEFAULT '0' COMMENT '是否驻场老师',
  `fid` int(32) DEFAULT NULL COMMENT '工厂id',
  `create_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='工厂角色表:工厂HR,驻场老师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_factory_role`
--

LOCK TABLES `ss_factory_role` WRITE;
/*!40000 ALTER TABLE `ss_factory_role` DISABLE KEYS */;
INSERT INTO `ss_factory_role` VALUES (4,129,0,1,30,'1579644053'),(5,129,0,1,31,'1579644067'),(6,129,0,1,32,'1579644107'),(7,129,0,1,33,'1579644140'),(8,129,0,1,34,'1579644152'),(9,73,0,1,30,'1582139778'),(10,76,0,1,31,'1583059462'),(11,76,0,1,31,'1583059549'),(12,76,0,1,30,'1583059815'),(13,76,0,1,30,'1583059902'),(14,76,0,1,30,'1583060017'),(15,76,0,1,30,'1583060172'),(16,76,0,1,30,'1583060240'),(17,76,0,1,30,'1583060260'),(18,76,0,1,32,'1583060394'),(19,192,0,1,34,'1583072531');
/*!40000 ALTER TABLE `ss_factory_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_favorites`
--

DROP TABLE IF EXISTS `ss_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_favorites` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(32) unsigned DEFAULT '0' COMMENT '收藏类型 1:职位收藏 2:工厂收藏 3:文章ID',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `jid` int(32) unsigned DEFAULT '0' COMMENT '职位id',
  `fid` int(32) unsigned DEFAULT '0' COMMENT '工厂id',
  `aid` int(32) unsigned DEFAULT '0' COMMENT '文章id',
  `money` varchar(255) DEFAULT '0.00' COMMENT '费用',
  `image` varchar(255) DEFAULT NULL COMMENT '图地址,如果有的话',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='收藏夹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_favorites`
--

LOCK TABLES `ss_favorites` WRITE;
/*!40000 ALTER TABLE `ss_favorites` DISABLE KEYS */;
INSERT INTO `ss_favorites` VALUES (14,1,76,'普工','东莞晋杨电子有限公司',35,0,0,'0.00','/uploads/images/20200122/7058d40a8b620609e18c864e8451242e.jpg','favorites/addFavorites','1582730265'),(15,1,76,'普工','东莞德曼木业有限公司',34,0,0,'0.00','/uploads/images/20200122/98df618e9953c47eb3b5dc6f03671de5.jpg','favorites/addFavorites','1582742193'),(16,1,192,'普工','东莞德曼木业有限公司',34,0,0,'0.00','/uploads/images/20200122/98df618e9953c47eb3b5dc6f03671de5.jpg','favorites/addFavorites','1582846512');
/*!40000 ALTER TABLE `ss_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_feedbackes`
--

DROP TABLE IF EXISTS `ss_feedbackes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_feedbackes` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `uid` int(32) DEFAULT NULL COMMENT '提交用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_feedbackes`
--

LOCK TABLES `ss_feedbackes` WRITE;
/*!40000 ALTER TABLE `ss_feedbackes` DISABLE KEYS */;
INSERT INTO `ss_feedbackes` VALUES (1,'我叫川谱','我有想法请回复印店员，我','1579188825',124),(2,'eyeyyy','hshhshhshshshshhshshshsjsj','1582585655',72),(3,'The way','The same thing I have to do it again','1582731305',76);
/*!40000 ALTER TABLE `ss_feedbackes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_historyes_stream`
--

DROP TABLE IF EXISTS `ss_historyes_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_historyes_stream` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL DEFAULT '0' COMMENT '当前操作用户的id',
  `event_id` int(32) DEFAULT '0' COMMENT '对应的事件id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(16) DEFAULT NULL,
  `status` int(32) DEFAULT '0' COMMENT '当前状态',
  `did` int(11) DEFAULT '0' COMMENT '附件id',
  `urls` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='事件历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_historyes_stream`
--

LOCK TABLES `ss_historyes_stream` WRITE;
/*!40000 ALTER TABLE `ss_historyes_stream` DISABLE KEYS */;
INSERT INTO `ss_historyes_stream` VALUES (63,129,102,'同意','1579643974',1,0,NULL),(64,119,102,'同意','1579644017',1,0,NULL),(65,129,102,'同意','1579644219',3,0,NULL),(66,129,103,'可以','1579644379',1,0,NULL),(67,119,103,'通过','1579644425',1,0,NULL),(68,129,103,'好的','1579644460',3,0,NULL),(69,129,110,'同意','1581022490',3,0,NULL),(70,129,105,'通过','1581026205',3,0,NULL),(71,129,104,'通过','1581026329',3,0,NULL),(72,73,125,'同意','1582139722',1,0,NULL),(73,74,125,'同意','1582140043',1,0,NULL),(74,73,125,'完成入职','1582140088',3,0,NULL),(75,73,126,'同意','1582140802',3,0,NULL);
/*!40000 ALTER TABLE `ss_historyes_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_job`
--

DROP TABLE IF EXISTS `ss_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_job` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `fid` int(32) DEFAULT NULL COMMENT '工厂id',
  `jtid` int(255) unsigned DEFAULT NULL COMMENT '职位类型id',
  `job_treatment` varchar(255) DEFAULT NULL COMMENT '待遇',
  `max_count` varchar(255) DEFAULT NULL COMMENT '计划招聘人数',
  `min_count` varchar(255) DEFAULT NULL COMMENT '已经招聘人数',
  `isHot` varchar(1) DEFAULT NULL COMMENT '是否热招',
  `job_wage` varchar(255) DEFAULT NULL COMMENT '综合薪资',
  `job_payroll_time` varchar(255) DEFAULT NULL COMMENT '发薪日期',
  `job_salary_structure` varchar(255) DEFAULT NULL COMMENT '薪资结构',
  `job_traffic` varchar(255) DEFAULT NULL COMMENT '交通',
  `contract_note` varchar(255) DEFAULT NULL COMMENT '合同说明',
  `job_content` varchar(255) DEFAULT NULL COMMENT '工作内容',
  `job_description` varchar(255) DEFAULT NULL COMMENT '职位说明',
  `job_environment` varchar(255) DEFAULT NULL COMMENT '工作环境',
  `graduation_certificate` varchar(255) DEFAULT NULL COMMENT '毕业证明复印件',
  `creadential` varchar(255) DEFAULT NULL COMMENT '身份证',
  `phto` varchar(255) DEFAULT NULL COMMENT '照片',
  `graduation` varchar(255) DEFAULT NULL COMMENT '毕业证',
  `tattoo` varchar(255) DEFAULT NULL COMMENT '纹身',
  `cigarette` varchar(255) DEFAULT NULL COMMENT '烟疤',
  `goBack` varchar(255) DEFAULT NULL COMMENT '返厂规定',
  `en` varchar(255) DEFAULT NULL COMMENT '英文要求',
  `arithmetic` varchar(255) DEFAULT NULL COMMENT '简单算术',
  `face_recognition` varchar(255) DEFAULT NULL COMMENT '人脸识别',
  `uniform` varchar(255) DEFAULT NULL COMMENT '无尘服',
  `in_vivo` varchar(255) DEFAULT NULL COMMENT '体内异物',
  `update_time` varchar(16) DEFAULT NULL,
  `create_time` varchar(16) DEFAULT NULL,
  `delete_time` varchar(16) DEFAULT NULL,
  `job_tip` varchar(255) DEFAULT NULL COMMENT '温馨提示',
  `job_basic` varchar(255) DEFAULT NULL COMMENT '底薪',
  `dimission_count` int(255) unsigned DEFAULT '0' COMMENT '离职数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='职位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_job`
--

LOCK TABLES `ss_job` WRITE;
/*!40000 ALTER TABLE `ss_job` DISABLE KEYS */;
INSERT INTO `ss_job` VALUES (34,'普工',30,5,'全勤奖，岗位津贴，奖金','48','52','1','5000-7000','次月25号发上月工资','工作满一个月18元，有全勤奖，岗位津贴，奖金','厂里住宿','与企业指定人力资源公司签订','打磨，木工，抬门','8点上班，','没有空调，有风扇，走动站班','本人身份证原件','带磁身份证','2张','不要','无','无','无','无要求','无要求','无','无','查','1583036563','1579642943',NULL,'','18-20元/小时',0),(35,'普工',31,5,'','199','181','1','3600-4500','月底发上月工资','工作满一个月14元/小时','厂内宿舍','与企业指定人力资源公司签订','装配，品检','','白班坐班','不用','本人证件原件','2张','不用','无','无','自离员工不录取，正常离职的无规定','无','无','无','无','查','1583036563','1579643159',NULL,'','14元/小时',0);
/*!40000 ALTER TABLE `ss_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_resumes`
--

DROP TABLE IF EXISTS `ss_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_resumes` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `origin` varchar(255) DEFAULT NULL COMMENT '贯籍',
  `marriage` int(1) DEFAULT NULL COMMENT '是否已婚',
  `nation` varchar(12) DEFAULT NULL COMMENT '民族',
  `education` varchar(32) DEFAULT NULL COMMENT '学历',
  `speciality` varchar(250) DEFAULT NULL COMMENT '特长',
  `sos_name` varchar(255) DEFAULT NULL COMMENT '紧急联系人',
  `sos_phone` varchar(255) DEFAULT NULL COMMENT '紧急联系人电话',
  `update_time` int(16) DEFAULT NULL,
  `create_time` int(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='简历-基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_resumes`
--

LOCK TABLES `ss_resumes` WRITE;
/*!40000 ALTER TABLE `ss_resumes` DISABLE KEYS */;
INSERT INTO `ss_resumes` VALUES (14,124,'黑龙江 双鸭山市 龙沙区',1,'汉族','博士','李飞恒1423','陈奕迅','13800138000',1579186125,1579186125),(15,127,'湖南 岳阳市 平江县',1,'汉族','大专学历','管理策划','刘琴','13650484877',1579428638,1579428638),(16,133,NULL,NULL,'瑶族','初中学历',NULL,'班华骏','15217530056',1580367638,1580367638),(17,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1582584077,1582584077);
/*!40000 ALTER TABLE `ss_resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_roles`
--

DROP TABLE IF EXISTS `ss_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_roles` (
  `id` int(11) NOT NULL COMMENT '主键',
  `type` int(255) NOT NULL COMMENT '类型',
  `type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_roles`
--

LOCK TABLES `ss_roles` WRITE;
/*!40000 ALTER TABLE `ss_roles` DISABLE KEYS */;
INSERT INTO `ss_roles` VALUES (0,0,'基础服务'),(1,1,'准工人'),(2,2,'工人'),(3,3,'初级合伙人'),(4,4,'高级合伙人'),(5,5,'准高级合伙人'),(6,6,'合伙公司'),(7,7,'驻场老师'),(8,8,'工厂HR'),(9,9,'驻场经理'),(10,10,'人事部'),(11,11,'财务部'),(12,12,'总经理'),(13,13,'业务员');
/*!40000 ALTER TABLE `ss_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_types`
--

DROP TABLE IF EXISTS `ss_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_types` (
  `id` int(32) NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_types`
--

LOCK TABLES `ss_types` WRITE;
/*!40000 ALTER TABLE `ss_types` DISABLE KEYS */;
INSERT INTO `ss_types` VALUES (1,'职位类'),(2,'工厂类'),(3,'文章类');
/*!40000 ALTER TABLE `ss_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_user`
--

DROP TABLE IF EXISTS `ss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_user` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(6) unsigned DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL COMMENT '0:普通用户 1:准工人 2:工人 3:初级合伙人 4:高级合伙人 5:准高级合伙人 6:合伙公司 7:驻场老师 8:工厂HR 9:驻场经理 10:人事部 11:财务部  12:总经理',
  `username` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `sex` int(255) unsigned DEFAULT '0',
  `age` int(255) unsigned DEFAULT '0',
  `parent_id` int(32) unsigned DEFAULT '0' COMMENT '上级ID',
  `parent_eid` int(32) unsigned DEFAULT '0' COMMENT '所在公司ID',
  `isAdmin` int(255) unsigned DEFAULT '0',
  `isPrimary` int(10) unsigned DEFAULT '0' COMMENT '初级合伙人',
  `isSetupAdvanced` int(10) unsigned DEFAULT '0' COMMENT '准高级合伙人',
  `isAdvanced` int(10) unsigned DEFAULT '0' COMMENT '高级合伙人',
  `isOriginator` int(10) unsigned DEFAULT '0' COMMENT '创始人',
  `enterprise_id` int(32) unsigned DEFAULT '0' COMMENT '创始人的公司ID',
  `factory_id` varchar(255) DEFAULT '0' COMMENT '驻场老师所在工厂ID',
  `job_id` int(10) unsigned DEFAULT '0',
  `isDeath` int(10) unsigned DEFAULT '0',
  `inJob` int(10) unsigned DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `login_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `ecode` int(6) DEFAULT '0' COMMENT '战略合伙人邀请码',
  `factory_teacher_ids` varchar(255) DEFAULT NULL,
  `factory_hr_ids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_user`
--

LOCK TABLES `ss_user` WRITE;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` VALUES (72,993422,'13800138000','[0,1,100,200]','李治明','1',0,0,73,106,2,1,0,1,0,0,'0',0,0,0,'/uploads/images/20200225/ce6f173a0fdd8323fe05191d0ebe3cb8.jpg','508df4cb2f4d8f80519256258cfb975f','1575356004','1582757033','1582757033',0,'[]','[]'),(73,999999,'13416801001','[0,1,100,200,300,2,400]','张国栋','351878400',1,39,73,106,2,1,0,1,1,106,'30',34,0,1,'/uploads/images/20200225/81aba86c5789c65ab2e4d9a2fb0eb48e.jpg','508df4cb2f4d8f80519256258cfb975f','1575357033','1583234500','1583234500',0,'[30]','[]'),(74,888888,'13620002358','[0,1,100,200,300]','朱益龙','0',0,0,74,0,2,1,0,1,1,105,'0',0,0,0,'/resources/avatar.png','508df4cb2f4d8f80519256258cfb975f','1575358240','1582425123','1582425123',0,'[]','[]'),(76,123456,'13828855724','[0,1,100,800,400,500,200,600,2]','李飞恒','478108800',1,35,73,106,1,1,0,1,0,0,'30',34,0,1,'/uploads/images/20200225/1bcddebc7c2b4b56654b9b99fc18a844.jpg','4297f44b13955235245b2497399d7a93','1575462669','1583179541','1583179541',789310,'[31,30,32]','[33]'),(77,768964,'13566668888','[0,100]','驻场老师','2147443200',0,22,0,0,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0','1575569157','0','0',0,'[]','[]'),(78,0,'13318444535','[0]',NULL,'0',0,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0e0ee27a729d3d9021e7424fc49065b8','1576120488','0','0',0,'[]','[]'),(79,0,'15205184124','[0]',NULL,'0',0,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','1ee5a6915615246bbb971c4cba7ada75','1576305593','0','0',0,'[]','[]'),(80,579145,'17869130706','[0,1,100,200]','李星亮','1',0,26,73,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','f18a339c78eed4d9fed9a03288f727cd','1576499956','0','0',0,'[]','[]'),(81,257500,'13215237736','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','2592492ce1d0116116110e9656ad20cc','1577248218','0','0',0,'[]','[]'),(82,727990,'15819482414','[0,7]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','bfd59291e825b5f2bbf1eb76569f8fe7','1577519687','0','0',0,'[]','[]'),(83,695018,'17722020496','[0,1,100,200]',NULL,'1',0,0,0,0,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','b70a8436dcb2dd726b94ccb50b7b7a15','1577520437','0','0',0,'[]','[]'),(84,187440,'13267321811','[0,1,100,200]','饶睿','1',0,20,74,105,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','f735292e5d7e3a3a2d11d2f1085510ba','1577521896','0','0',0,'[]','[]'),(85,446163,'18128577802','[0,1,100,200]','黄乾海','1',0,0,80,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','50be88f392bf88fdb900f6e7bfc261cf','1577522015','0','0',0,'[]','[]'),(86,231810,'18176913956','[0,1,100,200]','梁进文','1',0,0,73,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','7eae15de33ff3bf383388dab3dcf5621','1577522039','0','0',0,'[]','[]'),(87,583490,'13649864748','[0,1,100,200]','周建发','1',0,48,73,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','0aa2fa7b66dbe2b4e159d9de4d429926','1577522060','0','0',0,'[]','[]'),(88,0,'15126720802','[0]','宋兴会','2147483647',0,23,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0573fb4ddb6386a04af0211c1df2aa8c','1577522104','0','0',0,'[]','[]'),(89,749549,'13928175792','[0,1,100,200]','冷金龙','1',0,0,74,105,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','25e3f2ad3c0cf1eb847fb542636b7100','1577522217','0','0',0,'[]','[]'),(90,258220,'18924481118','[0,1,100,200]','黄啟超','1',0,28,73,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','cc3c971869837459873dc0118f0f3382','1577522373','0','0',0,'[]','[]'),(91,0,'13423324413','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','ec3059dd69a09c57da4f8433dd7b1524','1577523108','0','0',0,'[]','[]'),(92,0,'18829957032','[0]','熊顺兵','2147483647',1,18,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0db84e80e4e1a3ec46ad8a3526616191','1577524779','0','0',0,'[]','[]'),(93,0,'13798772908','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8c65d975dca2228ad95fb40377cbe497','1577524950','0','0',0,'[]','[]'),(94,953141,'13790265608','[0,1,100,200]','李胜','1',1,0,73,106,0,1,0,1,0,0,'0',0,0,0,'/resources/avatar.png','7a0a634ac91c34c8c207f4ff2743b1de','1577525176','0','0',0,'[]','[]'),(96,433256,'18178786393','[0,1,100]',NULL,'0',0,0,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','1e55dbf412cb74d5e2c21fb6452408c7','1577528094','0','0',0,'[]','[]'),(97,0,'15817512698','[0]',NULL,'0',1,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f77d3c849cf43fde82515e0381dd69e8','1577529891','0','0',0,'[]','[]'),(98,516063,'15724025228','[0,1]',NULL,'0',0,0,87,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','9f06d27acfed78b43b103653d22bd2f2','1577531152','0','0',0,'[]','[]'),(99,127650,'18002938185','[0,1,100]',NULL,'0',0,0,87,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','074d8749508d2883837e2a20f8861748','1577534850','0','0',0,'[]','[]'),(100,733879,'13713256024','[0,1,100]','李成高','2147483647',1,20,87,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','2f5239e0f84c0d4b77b96b7f42a2bf6d','1577534950','0','0',0,'[]','[]'),(101,829205,'17760130617','[0,1,100]','周建明','2147483647',1,29,87,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8df47461bf3204bb4acea03401361314','1577535098','0','0',0,'[]','[]'),(102,681897,'13729992799','[0,1,100]',NULL,'0',0,0,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4cc32993ca02e01bea78a45f981094a7','1577609440','0','0',0,'[]','[]'),(103,0,'15187904063','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f5e5846d0643e88109cdf8c23409e8a9','1577616233','0','0',0,'[]','[]'),(104,401110,'18487807026','[0,1,100]',NULL,'0',0,0,80,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e10adc3949ba59abbe56e057f20f883e','1577619438','0','0',0,'[]','[]'),(105,796489,'18000935265','[0,1,100]',NULL,'0',0,0,80,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f1af3e139325a880200074793b622a82','1577620301','0','0',0,'[]','[]'),(106,616003,'17688884668','[0,1,100]',NULL,'0',0,0,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','d0dcbf0d12a6b1e7fbfa2ce5848f3eff','1577622669','0','0',0,'[]','[]'),(107,413344,'18897576059','[0,1,100]',NULL,'0',0,0,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','b206e95a4384298962649e58dc7b39d4','1577626591','0','0',0,'[]','[]'),(108,0,'13650484877','[0,1]','刘琴','0',0,0,74,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8f102145b473ff4f4182a7ce5ff6c69f','1577668741','0','0',0,'[]','[]'),(109,0,'13266599756','[0,1]',NULL,'0',0,0,74,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','438521513932437058524764fd3b4d1d','1577671747','0','0',0,'[]','[]'),(110,0,'17707567676','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','5e8667a439c68f5145dd2fcbecf02209','1577677854','0','0',0,'[]','[]'),(111,0,'17707561676','[0,1]',NULL,'0',0,0,74,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','6ebe76c9fb411be97b3b0d48b791a7c9','1577677978','0','0',0,'[]','[]'),(112,0,'13720315430','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','d323658defc10a9d223d74a1d64f70ec','1577685705','0','0',0,'[]','[]'),(113,0,'13412642015','[0,1]','彭国池','0',1,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8ef7aee46732d1dddf3e55103ec1359d','1577686615','0','0',0,'[]','[]'),(114,0,'13316663636','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','a8e69b73cfe723f12fc78cd581b38377','1577693335','0','0',0,'[]','[]'),(115,0,'18928017333','[0,1]',NULL,'0',0,0,74,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','82a18c0e93750cc2f33fb0937205c2cc','1577693521','0','0',0,'[]','[]'),(116,0,'15112894940','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0cc30264fee831692abb4be3e4bda9a9','1577704518','0','0',0,'[]','[]'),(117,0,'13265971086','[0,1]','谭志镜','2147483647',1,26,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','32a4b5c1572b55ff1052cdd2d6e0f30d','1577704997','0','0',0,'[]','[]'),(118,0,'15377338840','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','b236ae3744ebeaf45943743f9b6fba42','1577705799','0','0',0,'[]','[]'),(119,0,'13308760983','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','fcea920f7412b5da7be0cf42b8c93759','1577713394','0','0',0,'[]','[]'),(120,0,'18091506899','[0,1]',NULL,'0',0,0,74,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','ad228da7982ae4254bc8c85c8b317fca','1577748180','0','0',0,'[]','[]'),(121,0,'15220800851','[0,1]','吴小福','0',0,0,94,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f415a11cb18fe663c625be3f3a057fea','1577759817','0','0',0,'[]','[]'),(122,0,'15977646986','[0,1]',NULL,'0',0,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','5fb43fa709a2e1512a7174867ae740e5','1577775361','0','0',0,'[]','[]'),(123,0,'15812279568','[0,1]','张仕凯','2147483647',1,27,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','13309f7ef0809b6cf15da47d4a8e2b5b','1577778204','0','0',0,'[]','[]'),(124,0,'13790648369','[0,1]','张国东','0',1,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','d1775d20b12e430869cc7be5d7d4a27e','1577780110','0','0',0,'[]','[]'),(125,0,'13428472561','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','2f686c04baa9008f93d3d10b1a7b319e','1577780144','0','0',0,'[]','[]'),(126,0,'13539011855','[0,1]','杨祯祥','0',1,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e1c21364530057bc884be07f32491acc','1577780265','0','0',0,'[]','[]'),(127,0,'13457308705','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','b0b12b165d774c81fafcf58f35513456','1577780281','0','0',0,'[]','[]'),(128,0,'18576381748','[0,1]','张三牛','2147483647',1,36,87,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4607e782c4d86fd5364d7e4508bb10d9','1577780315','0','0',0,'[]','[]'),(129,0,'13018621929','[0,1]','张兆成','0',1,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0b54452221edab4c13d494ec611a8c8a','1577780379','0','0',0,'[]','[]'),(130,0,'18689455681','[0,1]','吴祝兵','0',1,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','41c376edbbcd3410e797116f11da2393','1577780411','0','0',0,'[]','[]'),(131,0,'18024702029','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','75e266f182b4fa3625d4a4f4f779af54','1577783760','0','0',0,'[]','[]'),(132,459894,'19988323902','[0,1,100,200]',NULL,'1',0,0,80,106,0,0,0,1,0,0,'0',0,0,0,'/resources/avatar.png','cb76771ee603d16408299a163548d5a6','1577791153','0','0',0,'[]','[]'),(133,609545,'15987547698','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','a238ba5ff9ceaa74086350fc6be0c70c','1577794105','0','0',0,'[]','[]'),(134,358607,'13418334716','[0,1,100]',NULL,'0',0,0,108,105,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','5513967bbaf53259bae59290b9a81bfb','1577797631','0','0',0,'[]','[]'),(135,0,'18087617124','[0]','张才东','2147483647',1,20,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','a29f9a873259b0518dbec6bb2d18cc2f','1577798157','0','0',0,'[]','[]'),(136,207027,'18387638611','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','83ee37f1ec61473e4978fe7443d6dd78','1577847050','0','0',0,'[]','[]'),(137,0,'18566571733','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','600be132ce0e8db227e6ff54d897c7b5','1577848639','0','0',0,'[]','[]'),(138,274558,'13887622914','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e10adc3949ba59abbe56e057f20f883e','1577963389','0','0',0,'[]','[]'),(139,142277,'13639261070','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','52ddecab35550096539f470d174c3e0a','1578020291','0','0',0,'[]','[]'),(140,749583,'13712990490','[0,1,100]','周金瑞','0',0,0,87,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','391aa9e266a8604137ce598f9732846a','1578037923','0','0',0,'[]','[]'),(141,688050,'15112336739','[0,1,100]',NULL,'0',0,0,122,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e4a04f6770efc9ea09b7df1a51016893','1578105820','0','0',0,'[]','[]'),(142,901835,'13097963869','[0,1,100]',NULL,'0',0,0,122,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','3d681aef22d032e2ce5729e841dd58ce','1578106368','0','0',0,'[]','[]'),(143,471157,'16675855018','[0,1,100]',NULL,'0',0,0,141,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','9f0cb6dbd4f054e262e0059501bcc0ad','1578116907','0','0',0,'[]','[]'),(144,688325,'13887507697','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','9b79c9d319bc08e2bd6647ba0f7ac929','1578209229','0','0',0,'[]','[]'),(145,113942,'15187187782','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8e374d643bd348a3ccb82551e825042e','1578209248','0','0',0,'[]','[]'),(146,952392,'15099750995','[0,1,100]',NULL,'0',0,0,108,105,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','86330762d38818f5dc051c097fa58a5b','1578214700','0','0',0,'[]','[]'),(147,905050,'15198636160','[0,1]',NULL,'0',0,0,100,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f0635820a05d7983dd29c7225e6399fd','1578218167','0','0',0,'[]','[]'),(148,0,'19987685585','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','d1de3c25199524d757ebcecb30ef1adb','1578226709','0','0',0,'[]','[]'),(149,0,'19977126305','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','ae417dd9151af85740ec241c67a4bc35','1578227137','0','0',0,'[]','[]'),(150,647965,'17387601039','[0,1]',NULL,'0',0,0,100,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','5b1bd39e4c04de446efd43891a0a2fe8','1578235625','0','0',0,'[]','[]'),(151,368424,'18934992099','[0,1,100]','农明稳','2147483647',1,26,153,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','25d55ad283aa400af464c76d713c07ad','1578294884','0','0',0,'[]','[]'),(152,594901,'15078216305','[0,1,100]',NULL,'0',0,0,117,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','3e9f7c4f188dac05618d85645e47a7fa','1578295478','0','0',0,'[]','[]'),(153,810348,'13877623506','[0,1,100]','周美仙','2147483647',0,27,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','ed11ee4d1bac397e58eed481963dbd59','1578296212','0','0',0,'[]','[]'),(154,999130,'18388624672','[0,1]','伏帮顺','2147483647',1,20,100,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','63376d365d6ccac73bac234517e0bb42','1578313163','0','0',0,'[]','[]'),(155,343126,'18929425243','[0,1]',NULL,'0',0,0,100,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','b9bf1ebb9aa745e5311e056b26ff83dc','1578313448','0','0',0,'[]','[]'),(156,933276,'15625502998','[0,1]',NULL,'0',0,0,100,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e28be1caffb3e8df36c882c8e0ddaa35','1578313692','0','0',0,'[]','[]'),(157,178647,'18308760628','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','8b008959fa76d38c93fad4e79fe08859','1578322318','0','0',0,'[]','[]'),(158,409603,'13688737676','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','afb6d6f763787f078535788502ad76f1','1578368299','0','0',0,'[]','[]'),(159,0,'13226728008','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','448ea13fa9d144bdf59d045f772b63b2','1578396364','0','0',0,'[]','[]'),(160,857338,'18291538257','[0,1]','张泽隆','0',1,0,120,105,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','44b3a8b2298c64fc31e7d5d1550972ef','1578454331','0','0',0,'[]','[]'),(161,551785,'15377771858','[0,1]',NULL,'0',0,0,73,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','004c39e3d63b312768056c5763d9eb91','1578471467','0','0',0,'[]','[]'),(162,624720,'13507762453','[0,1,100]',NULL,'0',0,0,73,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','0318d57f34de80d0630424d51ed8c8dc','1578491379','0','0',0,'[]','[]'),(163,514650,'18177614975','[0,1]','苏宁宁','1070467200',0,17,117,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','3bc8006e638ccc38963e7431896e9ddd','1578549275','0','0',0,'[]','[]'),(164,572891,'13297768258','[0,1]','谭金花','2147483647',0,31,117,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','c770240a25ec78ab0c82b78d312b2148','1578550508','0','0',0,'[]','[]'),(165,212421,'14769042089','[0,1]',NULL,'0',0,0,132,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','733d7be2196ff70efaf6913fc8bdcabf','1578562040','0','0',0,'[]','[]'),(166,0,'15126859809','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','68b8f51af97da94d4ffac6d9d1f5e661','1578629511','0','0',0,'[]','[]'),(167,886587,'13532663869','[0,1,100]','熊国红','0',1,0,94,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','06cf06349d3ea65ce7bad5aa24499fd9','1578716922','0','0',0,'[]','[]'),(168,647169,'18775632600','[0,1,100]','李国龙','2147483647',1,26,117,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','6da0f41c2ba1d5a44ad22553ef16aad3','1578720267','0','0',0,'[]','[]'),(169,941243,'13549451421','[0,1]',NULL,'0',0,0,95,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','39ceeca25a806dffa815f04cf04a1218','1578843399','0','0',0,'[]','[]'),(170,724283,'15177639141','[0,1,100]','方文思','2147483647',0,34,117,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f013c20e225122aedd02a8acb2928179','1578903719','0','0',0,'[]','[]'),(171,0,'18177811724','[0]','韦福音','2147483647',0,21,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','a15e74ba5596f9c9919fa506248b0a9e','1578903875','0','0',0,'[]','[]'),(172,637048,'18825766260','[0,1,100]',NULL,'0',0,0,95,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e663cbde72da3337afe080014d3c49fd','1578921845','0','0',0,'[]','[]'),(173,0,'17787652726','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','24d3faf66f25be2df34be3a6d5b38ed9','1579138229','0','0',0,'[]','[]'),(174,0,'18387606856','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','f73a7b216fb732ab1b8c5b73250e13c6','1579149607','0','0',0,'[]','[]'),(175,388374,'15878478307','[0,1,100]',NULL,'0',0,0,122,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','c51591667fbae3bb4cc2fe14bec9da33','1579331892','0','0',0,'[]','[]'),(176,0,'18200618590','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e9f5c5240c0bb39488e6dbfbdb1517e0','1579411314','0','0',0,'[]','[]'),(177,0,'18508592683','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','966afbf8c63ce53b048c46324131ee52','1579537012','0','0',0,'[]','[]'),(178,623688,'17777615207','[0,1,100]',NULL,'0',0,0,122,106,0,1,0,0,0,0,'0',0,0,0,'/resources/avatar.png','41e38763b5ebfcf35226dfb730b805f9','1579751542','0','0',0,'[]','[]'),(179,0,'13427260911','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','ea6f09a52ab147a4ae2beb91bb39ffed','1579758013','0','0',0,'[]','[]'),(180,0,'17387670479','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4b52c54534caff3b56a5e5f2e9001754','1579780633','0','0',0,'[]','[]'),(181,0,'17666235746','[0]',NULL,'0',1,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e5850964febbf93e9045b0999a3ae8eb','1580394815','0','0',0,'[]','[]'),(182,679462,'17869130307','[0,1]',NULL,'0',0,0,80,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','e95703529dbe0877d59021c596de6781','1581056312','0','0',0,'[]','[]'),(183,0,'15154917898','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','fcea920f7412b5da7be0cf42b8c93759','0','0','0',0,'[]','[]'),(184,0,'17507699222','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','5778a43873851b9e52e92e638616384d','0','1582463003','1582463003',0,'[]','[]'),(185,0,'18666853295','[0]',NULL,'0',0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4569d246f7bd36303d44244ddc447a67','0','0','0',0,'[]','[]'),(189,0,'13800138001','[0,1]','李嘉诚','67795200',1,48,73,106,0,0,0,0,0,0,'0',0,0,0,'/uploads/images/20200225/07d803c68642ed6a89bcd0dd3fc71445.jpg','4297f44b13955235245b2497399d7a93','1582235847','1583173701','1583173701',0,'[]','[]'),(192,768520,'13800138010','[0,1,100,200,600,400,500,2]','小喜子','920217600',0,21,76,106,1,1,0,1,0,0,'30',34,0,1,'/uploads/images/20200301/d241597b7f00370ce08a55a656d4538c.jpg','4297f44b13955235245b2497399d7a93','1582831235','1583080775','1583080775',0,'[30,34]','[30]'),(194,0,'13800138011','[0,1,2]','陈书记','478454400',1,35,76,106,0,0,0,0,0,0,'30',34,0,1,'/uploads/images/20200301/a558873e92f308d864bee6c053b8502d.jpg','4297f44b13955235245b2497399d7a93','1582975483','1583179767','1583179767',0,'[]','[]'),(195,0,'13800138012','[0,1,2]','徐工','667756800',1,29,76,106,0,0,0,0,0,0,'30',34,0,1,'/uploads/images/20200301/297e3c0265434bff9c628305698ee514.jpg','4297f44b13955235245b2497399d7a93','1583055375','1583056943','1583056943',0,NULL,NULL),(196,0,'13800138013','[0,1,2]','吴迪','68227200',1,48,76,106,0,0,0,0,0,0,'30',34,0,1,'/uploads/images/20200301/00c107f55415161a0e5caaf43fbf007b.jpg','4297f44b13955235245b2497399d7a93','1583055766','1583057447','1583058243',0,NULL,NULL),(197,0,'13800138014','[0]','',NULL,0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4297f44b13955235245b2497399d7a93','1583055892',NULL,'1583055892',0,NULL,NULL),(198,745480,'13800138020','[0,1,100,200]','维护者','951926400',1,20,76,106,0,1,0,1,0,0,'0',0,0,0,'/uploads/images/20200302/c08eb1aaca3de8e817f4fc207d109f56.jpg','4297f44b13955235245b2497399d7a93','1583081650','1583084991','1583084991',0,NULL,NULL),(199,745210,'13800138021','[0,1,100]','超级飞侠','667843200',1,29,198,106,0,1,0,0,0,0,'0',0,0,0,'/uploads/images/20200302/abe45106a81fc0b80056fb440e9ac719.jpg','4297f44b13955235245b2497399d7a93','1583081670','1583083368','1583083368',0,NULL,NULL),(200,0,'13800138022','[0,1]','',NULL,0,0,198,106,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','4297f44b13955235245b2497399d7a93','1583084792','1583084850','1583084850',0,NULL,NULL),(201,0,'13480085238','[0]','',NULL,0,0,0,0,0,0,0,0,0,0,'0',0,0,0,'/resources/avatar.png','fa5adaf4a3be4d5eaa84223220bac8d2','1583200602','1583211405','1583211405',0,NULL,NULL);
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet`
--

DROP TABLE IF EXISTS `ss_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '钱包ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户',
  `money` varchar(32) DEFAULT '0.00' COMMENT '可用额度',
  `frost` varchar(32) DEFAULT NULL COMMENT '冻结额度',
  `virtual_coin` varchar(255) DEFAULT NULL COMMENT '虚拟币',
  `total_money` varchar(255) DEFAULT NULL COMMENT '总额度',
  `creation_time` datetime DEFAULT NULL COMMENT '钱包创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '额度是更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet`
--

LOCK TABLES `ss_wallet` WRITE;
/*!40000 ALTER TABLE `ss_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_bill_flow`
--

DROP TABLE IF EXISTS `ss_wallet_bill_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_bill_flow` (
  `id` int(32) NOT NULL COMMENT '账单流水记录',
  `uid` varchar(45) NOT NULL COMMENT '用户',
  `price` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `dandan_cost` varchar(45) NOT NULL DEFAULT '0' COMMENT '蛋币',
  `tid` int(32) NOT NULL COMMENT '账单流水类型',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_bill_flow`
--

LOCK TABLES `ss_wallet_bill_flow` WRITE;
/*!40000 ALTER TABLE `ss_wallet_bill_flow` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_wallet_bill_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_bill_flow_type`
--

DROP TABLE IF EXISTS `ss_wallet_bill_flow_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_bill_flow_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '账单流水类型',
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_bill_flow_type`
--

LOCK TABLES `ss_wallet_bill_flow_type` WRITE;
/*!40000 ALTER TABLE `ss_wallet_bill_flow_type` DISABLE KEYS */;
INSERT INTO `ss_wallet_bill_flow_type` VALUES (1,'购买资料'),(2,'商城购物'),(3,'提现'),(4,'预支'),(5,'工资'),(6,'提成&分红'),(7,'签到'),(8,'卖出');
/*!40000 ALTER TABLE `ss_wallet_bill_flow_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_commission`
--

DROP TABLE IF EXISTS `ss_wallet_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_commission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `tid` int(32) NOT NULL,
  `amount` varchar(45) NOT NULL DEFAULT '0.00',
  `fid` int(32) NOT NULL COMMENT '生产佣金的工厂ID',
  `uid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_commission`
--

LOCK TABLES `ss_wallet_commission` WRITE;
/*!40000 ALTER TABLE `ss_wallet_commission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_wallet_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_commission_type`
--

DROP TABLE IF EXISTS `ss_wallet_commission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_commission_type` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(46) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_commission_type`
--

LOCK TABLES `ss_wallet_commission_type` WRITE;
/*!40000 ALTER TABLE `ss_wallet_commission_type` DISABLE KEYS */;
INSERT INTO `ss_wallet_commission_type` VALUES (1,'驻场老师提成'),(2,'业务员提成'),(3,'初级合伙人提成'),(4,'高级合伙人提成'),(5,'战略合伙人提成'),(6,'蛋蛋提成');
/*!40000 ALTER TABLE `ss_wallet_commission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_dd`
--

DROP TABLE IF EXISTS `ss_wallet_dd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_dd` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `count` int(32) NOT NULL DEFAULT '0',
  `uid` int(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_dd`
--

LOCK TABLES `ss_wallet_dd` WRITE;
/*!40000 ALTER TABLE `ss_wallet_dd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_wallet_dd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_wallet_wgae`
--

DROP TABLE IF EXISTS `ss_wallet_wgae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_wallet_wgae` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '工资表',
  `uid` int(32) NOT NULL,
  `amount` varchar(45) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被用户确认 \n0:默认未确认\n1:已经确认并可以申请提现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_wallet_wgae`
--

LOCK TABLES `ss_wallet_wgae` WRITE;
/*!40000 ALTER TABLE `ss_wallet_wgae` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_wallet_wgae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_work_time`
--

DROP TABLE IF EXISTS `ss_work_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_work_time` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` varchar(32) DEFAULT NULL COMMENT '打卡时间',
  `hour` float(5,2) DEFAULT '0.00' COMMENT '录入的时间',
  `uid` int(32) DEFAULT '0' COMMENT '谁打的卡',
  `fid` int(32) DEFAULT '0' COMMENT '工厂ID',
  `jid` int(32) DEFAULT '0' COMMENT '职位ID',
  `event_id` int(32) DEFAULT '0' COMMENT '事件id',
  `price` float(32,2) DEFAULT '0.00' COMMENT '单价',
  `antipate` float(32,2) DEFAULT NULL COMMENT '预算工资',
  `isCredible` int(255) DEFAULT '0' COMMENT '是否被驻场都审核过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='工时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_work_time`
--

LOCK TABLES `ss_work_time` WRITE;
/*!40000 ALTER TABLE `ss_work_time` DISABLE KEYS */;
INSERT INTO `ss_work_time` VALUES (29,'1579644773',8.50,124,31,35,104,14.00,119.00,0),(30,'1579645858',10.00,124,31,35,105,14.00,140.00,0),(31,'1583088972',0.00,73,30,34,0,20.00,140.00,0);
/*!40000 ALTER TABLE `ss_work_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 18:49:14
