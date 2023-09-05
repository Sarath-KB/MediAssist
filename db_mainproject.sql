# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_mainproject
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2022-05-17 10:42:02 PM
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_mainproject'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_mainproject" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_mainproject";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_username" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_username", "admin_password", "admin_id") VALUES
	('admin','admin','1');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bmedicine'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bmedicine" (
  "bmedicine_id" int(11) NOT NULL auto_increment,
  "branch_id" int(11) NOT NULL,
  "bmedicine_rate" varchar(50) NOT NULL default '0',
  "cmedicine_id" int(11) NOT NULL,
  PRIMARY KEY  ("bmedicine_id"),
  UNIQUE KEY "bmedicine_id" ("bmedicine_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_bmedicine'
#

LOCK TABLES "tbl_bmedicine" WRITE;
/*!40000 ALTER TABLE "tbl_bmedicine" DISABLE KEYS;*/
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(1,6,'0',6);
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(2,6,'0',6);
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(3,6,'0',6);
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(4,6,'0',6);
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(5,5,'500',3);
REPLACE INTO "tbl_bmedicine" ("bmedicine_id", "branch_id", "bmedicine_rate", "cmedicine_id") VALUES
	(6,5,'650',2);
/*!40000 ALTER TABLE "tbl_bmedicine" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_branch'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_branch" (
  "branch_id" int(11) NOT NULL auto_increment,
  "place_id" int(10) unsigned NOT NULL,
  "branch_contact" varchar(50) NOT NULL,
  "branch_email" varchar(50) NOT NULL,
  "branch_address" varchar(50) NOT NULL,
  "branch_username" varchar(50) NOT NULL,
  "branch_ownername" varchar(50) NOT NULL,
  "branch_ownercontact" varchar(50) default NULL,
  "branch_owneremail" varchar(50) NOT NULL,
  "branch_ownerphoto" varchar(50) NOT NULL,
  "branch_licno" int(10) unsigned NOT NULL,
  "branch_licproof" varchar(50) NOT NULL,
  "branch_isactive" int(11) NOT NULL default '0',
  "branch_password" varchar(50) NOT NULL,
  "branch_doj" date NOT NULL,
  "company_id" int(11) NOT NULL,
  "branch_vstatus" int(11) NOT NULL default '1',
  PRIMARY KEY  ("branch_id"),
  UNIQUE KEY "branch_id" ("branch_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_branch'
#

LOCK TABLES "tbl_branch" WRITE;
/*!40000 ALTER TABLE "tbl_branch" DISABLE KEYS;*/
REPLACE INTO "tbl_branch" ("branch_id", "place_id", "branch_contact", "branch_email", "branch_address", "branch_username", "branch_ownername", "branch_ownercontact", "branch_owneremail", "branch_ownerphoto", "branch_licno", "branch_licproof", "branch_isactive", "branch_password", "branch_doj", "company_id", "branch_vstatus") VALUES
	(1,'2','4545454545','abc@gmail.com','wqft','aaa','aaa','2323232323','abc@gmail.com','ownerphoto_s1649.jpeg','123','User_1387.jpeg',0,'12','2022-02-02',1,1);
REPLACE INTO "tbl_branch" ("branch_id", "place_id", "branch_contact", "branch_email", "branch_address", "branch_username", "branch_ownername", "branch_ownercontact", "branch_owneremail", "branch_ownerphoto", "branch_licno", "branch_licproof", "branch_isactive", "branch_password", "branch_doj", "company_id", "branch_vstatus") VALUES
	(4,'2','1234567890','anu@gmail.com','n jhb','vvv','jvgjh','6552565254','anu@gmail.com','ownerphoto_s1767.jpeg','2121','User_1219.png',0,'vvv','2022-02-25',2,2);
REPLACE INTO "tbl_branch" ("branch_id", "place_id", "branch_contact", "branch_email", "branch_address", "branch_username", "branch_ownername", "branch_ownercontact", "branch_owneremail", "branch_ownerphoto", "branch_licno", "branch_licproof", "branch_isactive", "branch_password", "branch_doj", "company_id", "branch_vstatus") VALUES
	(5,'2','1234567890','shop@gmail.com','kkkkkk','branch123','riyaa','58545265232','aleena@gmail.com','photo_1453.jpeg','125','User_2006.webp',0,'1234','2022-03-11',2,1);
REPLACE INTO "tbl_branch" ("branch_id", "place_id", "branch_contact", "branch_email", "branch_address", "branch_username", "branch_ownername", "branch_ownercontact", "branch_owneremail", "branch_ownerphoto", "branch_licno", "branch_licproof", "branch_isactive", "branch_password", "branch_doj", "company_id", "branch_vstatus") VALUES
	(6,'2','2596471258','branch456@gmail.com','aaaa','branch456','anu','959595959595','anu@gmail.com','ownerphoto_s1461.jpeg','456','User_1113.jpeg',0,'456','2022-04-09',4,1);
/*!40000 ALTER TABLE "tbl_branch" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_branchpurchase'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_branchpurchase" (
  "bp_id" int(11) NOT NULL auto_increment,
  "bph_id" int(11) NOT NULL,
  "cmedicine_id" int(11) NOT NULL,
  "bp_qty" varchar(50) NOT NULL default '1',
  "bp_amount" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("bp_id"),
  UNIQUE KEY "bp_id" ("bp_id")
) AUTO_INCREMENT=35;



#
# Dumping data for table 'tbl_branchpurchase'
#

LOCK TABLES "tbl_branchpurchase" WRITE;
/*!40000 ALTER TABLE "tbl_branchpurchase" DISABLE KEYS;*/
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(29,21,6,'1','0');
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(30,22,6,'1','0');
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(31,23,3,'10','0');
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(32,24,2,'1','0');
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(33,25,2,'2','0');
REPLACE INTO "tbl_branchpurchase" ("bp_id", "bph_id", "cmedicine_id", "bp_qty", "bp_amount") VALUES
	(34,25,3,'1','0');
/*!40000 ALTER TABLE "tbl_branchpurchase" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_branchpurchasehead'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_branchpurchasehead" (
  "bph_id" int(11) NOT NULL auto_increment,
  "bph_billno" varchar(50) NOT NULL default '0',
  "bph_totalamt" varchar(50) NOT NULL default '0',
  "branch_id" int(11) NOT NULL,
  "bph_date" varchar(50) NOT NULL,
  "bph_status" varchar(50) NOT NULL default '0',
  "bph_paymentstatus" varchar(50) NOT NULL default '0',
  "bph_requeststatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("bph_id"),
  UNIQUE KEY "bhp_id" ("bph_id")
) AUTO_INCREMENT=26;



#
# Dumping data for table 'tbl_branchpurchasehead'
#

LOCK TABLES "tbl_branchpurchasehead" WRITE;
/*!40000 ALTER TABLE "tbl_branchpurchasehead" DISABLE KEYS;*/
REPLACE INTO "tbl_branchpurchasehead" ("bph_id", "bph_billno", "bph_totalamt", "branch_id", "bph_date", "bph_status", "bph_paymentstatus", "bph_requeststatus") VALUES
	(21,'0','300.00',6,'2022-04-23','1','1',2);
REPLACE INTO "tbl_branchpurchasehead" ("bph_id", "bph_billno", "bph_totalamt", "branch_id", "bph_date", "bph_status", "bph_paymentstatus", "bph_requeststatus") VALUES
	(22,'0','300.00',6,'2022-04-23','1','1',2);
REPLACE INTO "tbl_branchpurchasehead" ("bph_id", "bph_billno", "bph_totalamt", "branch_id", "bph_date", "bph_status", "bph_paymentstatus", "bph_requeststatus") VALUES
	(23,'0','5000.00',5,'2022-05-02','1','1',2);
REPLACE INTO "tbl_branchpurchasehead" ("bph_id", "bph_billno", "bph_totalamt", "branch_id", "bph_date", "bph_status", "bph_paymentstatus", "bph_requeststatus") VALUES
	(24,'0','500.00',5,'2022-05-02','1','1',2);
REPLACE INTO "tbl_branchpurchasehead" ("bph_id", "bph_billno", "bph_totalamt", "branch_id", "bph_date", "bph_status", "bph_paymentstatus", "bph_requeststatus") VALUES
	(25,'0','0',5,'2022-05-02','0','0',1);
/*!40000 ALTER TABLE "tbl_branchpurchasehead" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_branchstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_branchstock" (
  "branchstock_id" int(11) NOT NULL auto_increment,
  "branchstock_qty" varchar(50) NOT NULL,
  "bmedicine_id" int(11) NOT NULL,
  PRIMARY KEY  ("branchstock_id"),
  UNIQUE KEY "branchstock_id" ("branchstock_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_branchstock'
#

LOCK TABLES "tbl_branchstock" WRITE;
/*!40000 ALTER TABLE "tbl_branchstock" DISABLE KEYS;*/
REPLACE INTO "tbl_branchstock" ("branchstock_id", "branchstock_qty", "bmedicine_id") VALUES
	(1,'1',3);
REPLACE INTO "tbl_branchstock" ("branchstock_id", "branchstock_qty", "bmedicine_id") VALUES
	(2,'10',5);
REPLACE INTO "tbl_branchstock" ("branchstock_id", "branchstock_qty", "bmedicine_id") VALUES
	(3,'1',6);
/*!40000 ALTER TABLE "tbl_branchstock" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_category'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_category" (
  "category_id" int(11) NOT NULL auto_increment,
  "category_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("category_id"),
  UNIQUE KEY "category_id" ("category_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_category'
#

LOCK TABLES "tbl_category" WRITE;
/*!40000 ALTER TABLE "tbl_category" DISABLE KEYS;*/
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(2,'liquid');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(3,'aaa');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(4,'liquid');
/*!40000 ALTER TABLE "tbl_category" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_cmedicine'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_cmedicine" (
  "cmedicine_id" int(11) NOT NULL auto_increment,
  "cmedicine_image" varchar(50) NOT NULL,
  "cmedicine_description" varchar(50) NOT NULL,
  "cmedicine_expduration" varchar(50) NOT NULL,
  "cmedicine_name" varchar(50) NOT NULL,
  "medicinecategory_id" int(11) NOT NULL,
  "company_id" int(11) NOT NULL,
  "cmedicine_rate" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("cmedicine_id"),
  UNIQUE KEY "cmedicine_id" ("cmedicine_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_cmedicine'
#

LOCK TABLES "tbl_cmedicine" WRITE;
/*!40000 ALTER TABLE "tbl_cmedicine" DISABLE KEYS;*/
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(1,'cmedicine_1856.png','zxC','sd','sdf',2,3,'200');
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(2,'cmedicine_1705.jpeg','cds','sd','aa',2,2,'500');
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(3,'cmedicine_2078.png','haii','2032','bbb',3,2,'500');
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(4,'cmedicine_1208.png',' k ','2022-03-17','nm',2,2,'200');
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(5,'cmedicine_1155.webp','syerap','2022-04-06','new',2,2,'200');
REPLACE INTO "tbl_cmedicine" ("cmedicine_id", "cmedicine_image", "cmedicine_description", "cmedicine_expduration", "cmedicine_name", "medicinecategory_id", "company_id", "cmedicine_rate") VALUES
	(6,'cmedicine_1554.png','latest','2022-04-06','latest',3,4,'300');
/*!40000 ALTER TABLE "tbl_cmedicine" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_company'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_company" (
  "company_id" int(4) NOT NULL auto_increment,
  "company_name" varchar(50) NOT NULL,
  "company_contact" varchar(50) NOT NULL,
  "company_email" varchar(50) NOT NULL,
  "district_id" int(11) NOT NULL,
  "company_address" varchar(50) NOT NULL,
  "company_logo" varchar(50) NOT NULL,
  "company_licno" int(10) unsigned NOT NULL,
  "company_proof" varchar(50) NOT NULL,
  "company_username" varchar(50) NOT NULL,
  "company_password" varchar(50) NOT NULL,
  "company_vstatus" int(4) NOT NULL default '1',
  "company_doj" date NOT NULL,
  PRIMARY KEY  ("company_id"),
  UNIQUE KEY "company_id" ("company_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_company'
#

LOCK TABLES "tbl_company" WRITE;
/*!40000 ALTER TABLE "tbl_company" DISABLE KEYS;*/
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(2,'abcdd','7034807168','kunjuz@gmail.com',3,'aaaaa','logo_1210.webp','111','cmpproof_1224.jpg','company','22',2,'2022-02-03');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(3,'sha','4545454545','a@gmail.com',1,'dsF','cmplogo_1574.jpeg','456','cmpproof_1754.jpeg','ccc','333',2,'2022-02-19');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(4,'tt','1234567890','adarshsanildd@gmail.com',1,'zxc','cmplogo_1346.jpeg','4532','cmpproof_2060.jpeg','company3','33',1,'2022-03-04');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(5,'tt','1234567890','anjanabiju24@gmail.com',1,'zxc','cmplogo_1036.jpeg','4532777','cmpproof_1226.jpeg','company4','44',2,'2022-03-04');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(6,'tt','1234567890','aleena@gmail.com',1,'zxc','cmplogo_1085.jpeg','4532777','cmpproof_1119.jpeg','company4','55',2,'2022-03-04');
REPLACE INTO "tbl_company" ("company_id", "company_name", "company_contact", "company_email", "district_id", "company_address", "company_logo", "company_licno", "company_proof", "company_username", "company_password", "company_vstatus", "company_doj") VALUES
	(7,'arya','1234567890','aleena@gmail.com',1,'jjjj','cmplogo_2080.png','456','cmpproof_1277.png','company12','12',1,'2022-03-11');
/*!40000 ALTER TABLE "tbl_company" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_companystock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_companystock" (
  "companystock_id" int(11) NOT NULL auto_increment,
  "companystock_qty" varchar(200) NOT NULL,
  "cmedicine_id" int(11) NOT NULL,
  PRIMARY KEY  ("companystock_id"),
  UNIQUE KEY "companystock_id" ("companystock_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_companystock'
#

LOCK TABLES "tbl_companystock" WRITE;
/*!40000 ALTER TABLE "tbl_companystock" DISABLE KEYS;*/
REPLACE INTO "tbl_companystock" ("companystock_id", "companystock_qty", "cmedicine_id") VALUES
	(6,'101',1);
REPLACE INTO "tbl_companystock" ("companystock_id", "companystock_qty", "cmedicine_id") VALUES
	(7,'99',2);
REPLACE INTO "tbl_companystock" ("companystock_id", "companystock_qty", "cmedicine_id") VALUES
	(8,'160',3);
REPLACE INTO "tbl_companystock" ("companystock_id", "companystock_qty", "cmedicine_id") VALUES
	(9,'30',5);
REPLACE INTO "tbl_companystock" ("companystock_id", "companystock_qty", "cmedicine_id") VALUES
	(10,'20',6);
/*!40000 ALTER TABLE "tbl_companystock" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(11) NOT NULL auto_increment,
  "company_id" int(11) NOT NULL,
  "branch_id" int(11) NOT NULL,
  "complaint_reply" varchar(50) default NULL,
  "complaint_description" varchar(50) default NULL,
  "complaint_senddate" varchar(50) NOT NULL,
  "complaint_vstatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("complaint_id"),
  UNIQUE KEY "complaint_id" ("complaint_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "company_id", "branch_id", "complaint_reply", "complaint_description", "complaint_senddate", "complaint_vstatus") VALUES
	(1,2,5,'ok','bad','2022-05-08',1);
REPLACE INTO "tbl_complaint" ("complaint_id", "company_id", "branch_id", "complaint_reply", "complaint_description", "complaint_senddate", "complaint_vstatus") VALUES
	(2,3,5,NULL,'haii','2022-05-09',0);
REPLACE INTO "tbl_complaint" ("complaint_id", "company_id", "branch_id", "complaint_reply", "complaint_description", "complaint_senddate", "complaint_vstatus") VALUES
	(3,3,5,'todayy','today','2022-05-09',1);
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaints'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaints" (
  "complaints_id" int(11) NOT NULL auto_increment,
  "complaints_description" varchar(50) default NULL,
  "complaints_senddate" varchar(50) NOT NULL,
  "complaints_vstatus" int(11) NOT NULL default '0',
  "branch_id" int(11) NOT NULL,
  "shop_id" int(11) NOT NULL,
  "complaints_reply" varchar(50) default NULL,
  PRIMARY KEY  ("complaints_id"),
  UNIQUE KEY "complaints_id" ("complaints_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_complaints'
#

LOCK TABLES "tbl_complaints" WRITE;
/*!40000 ALTER TABLE "tbl_complaints" DISABLE KEYS;*/
REPLACE INTO "tbl_complaints" ("complaints_id", "complaints_description", "complaints_senddate", "complaints_vstatus", "branch_id", "shop_id", "complaints_reply") VALUES
	(1,'baddd','2022-05-08',1,1,4,'okk');
REPLACE INTO "tbl_complaints" ("complaints_id", "complaints_description", "complaints_senddate", "complaints_vstatus", "branch_id", "shop_id", "complaints_reply") VALUES
	(2,'toooo bad','2022-05-09',1,1,4,'kooi');
REPLACE INTO "tbl_complaints" ("complaints_id", "complaints_description", "complaints_senddate", "complaints_vstatus", "branch_id", "shop_id", "complaints_reply") VALUES
	(3,'today','2022-05-09',1,5,4,'tdyy');
/*!40000 ALTER TABLE "tbl_complaints" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id"),
  UNIQUE KEY "district_id" ("district_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(1,'Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(3,'Kottayam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_healthproblemcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_healthproblemcategory" (
  "hpc_id" int(11) NOT NULL auto_increment,
  "hpc_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("hpc_id"),
  UNIQUE KEY "hpc_id" ("hpc_id")
);



#
# Dumping data for table 'tbl_healthproblemcategory'
#

# No data found.



#
# Table structure for table 'tbl_medicinecategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_medicinecategory" (
  "medicinecategory_id" int(11) NOT NULL auto_increment,
  "medicinecategory_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("medicinecategory_id"),
  UNIQUE KEY "medicinecategory_id" ("medicinecategory_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_medicinecategory'
#

LOCK TABLES "tbl_medicinecategory" WRITE;
/*!40000 ALTER TABLE "tbl_medicinecategory" DISABLE KEYS;*/
REPLACE INTO "tbl_medicinecategory" ("medicinecategory_id", "medicinecategory_name") VALUES
	(2,'liquid');
REPLACE INTO "tbl_medicinecategory" ("medicinecategory_id", "medicinecategory_name") VALUES
	(3,'pills');
/*!40000 ALTER TABLE "tbl_medicinecategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(11) NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "place_pincode" varchar(50) NOT NULL,
  "district_id" int(10) NOT NULL,
  PRIMARY KEY  ("place_id"),
  UNIQUE KEY "place_id" ("place_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	(2,'vazhakku','686671',1);
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	(4,'MUVTPSS','656869',1);
REPLACE INTO "tbl_place" ("place_id", "place_name", "place_pincode", "district_id") VALUES
	(5,'prmbvr','686670',1);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shop" (
  "shop_id" int(11) NOT NULL auto_increment,
  "shop_name" varchar(50) NOT NULL,
  "shop_contact" varchar(50) NOT NULL,
  "shop_email" varchar(50) NOT NULL,
  "shop_address" varchar(50) NOT NULL,
  "place_id" int(10) NOT NULL,
  "shop_logo" varchar(50) NOT NULL,
  "shop_proof" varchar(60) NOT NULL,
  "shop_licno" varchar(30) NOT NULL,
  "shoptype_id" int(10) NOT NULL,
  "shop_ownername" varchar(50) NOT NULL,
  "shop_ownerphoto" varchar(50) NOT NULL,
  "shop_ownerproof" varchar(50) NOT NULL,
  "shop_owneremail" varchar(50) NOT NULL,
  "shop_doj" varchar(60) NOT NULL,
  "shop_vstatus" int(10) NOT NULL default '0',
  "shop_isactive" int(11) NOT NULL default '0',
  "shop_username" varchar(50) NOT NULL,
  "shop_password" varchar(50) NOT NULL,
  "shop_ownercontact" varchar(50) NOT NULL,
  PRIMARY KEY  ("shop_id"),
  UNIQUE KEY "shop_id" ("shop_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "place_id", "shop_logo", "shop_proof", "shop_licno", "shoptype_id", "shop_ownername", "shop_ownerphoto", "shop_ownerproof", "shop_owneremail", "shop_doj", "shop_vstatus", "shop_isactive", "shop_username", "shop_password", "shop_ownercontact") VALUES
	(3,'shop123','5252525252','anjanabiju432@gmail.com','aaa',2,'shop_2104.webp','shopproof_1438.jpeg','1234',1,'aaya','ownerphoto_1854.jpeg','ownerproof_1461.jpeg','anjanabiju432@gmail.com','2022-01-28',1,0,'bb','11','2545215254');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "place_id", "shop_logo", "shop_proof", "shop_licno", "shoptype_id", "shop_ownername", "shop_ownerphoto", "shop_ownerproof", "shop_owneremail", "shop_doj", "shop_vstatus", "shop_isactive", "shop_username", "shop_password", "shop_ownercontact") VALUES
	(4,'shop','1234567890','shop@gmail.com','sdavg',2,'shoplogo_1676.png','shopproof_1899.jpeg','456',1,'riya','ownerproof_1951.jpeg','ownerphoto_1215.jpeg','riya@gmail.com','2022-03-11',2,0,'shop','123','4541454145');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_contact", "shop_email", "shop_address", "place_id", "shop_logo", "shop_proof", "shop_licno", "shoptype_id", "shop_ownername", "shop_ownerphoto", "shop_ownerproof", "shop_owneremail", "shop_doj", "shop_vstatus", "shop_isactive", "shop_username", "shop_password", "shop_ownercontact") VALUES
	(5,'aleena','1234567890','a@gmail.com','sfadb',2,'shoplogo_1435.jpeg','shopproof_1393.jpeg','4t532',1,'adarsh','ownerphoto_1854.jpeg','ownerproof_1762.jpeg','aleena@gmail.com','2022-03-11',1,0,'shop45','45','58545265232');
/*!40000 ALTER TABLE "tbl_shop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shopmedicine'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shopmedicine" (
  "smedicine_id" int(11) NOT NULL auto_increment,
  "shop_id" int(11) NOT NULL,
  "bmedicine_id" int(11) NOT NULL,
  PRIMARY KEY  ("smedicine_id"),
  UNIQUE KEY "smedicine_id" ("smedicine_id")
);



#
# Dumping data for table 'tbl_shopmedicine'
#

# No data found.



#
# Table structure for table 'tbl_shoppurchase'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shoppurchase" (
  "sp_id" int(11) NOT NULL auto_increment,
  "sph_id" int(11) NOT NULL,
  "bmedicine_id" int(11) NOT NULL,
  "sp_qty" varchar(50) NOT NULL default '1',
  "sp_amount" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("sp_id"),
  UNIQUE KEY "sp_id" ("sp_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_shoppurchase'
#

LOCK TABLES "tbl_shoppurchase" WRITE;
/*!40000 ALTER TABLE "tbl_shoppurchase" DISABLE KEYS;*/
REPLACE INTO "tbl_shoppurchase" ("sp_id", "sph_id", "bmedicine_id", "sp_qty", "sp_amount") VALUES
	(1,1,3,'1','0');
REPLACE INTO "tbl_shoppurchase" ("sp_id", "sph_id", "bmedicine_id", "sp_qty", "sp_amount") VALUES
	(2,1,5,'1','0');
REPLACE INTO "tbl_shoppurchase" ("sp_id", "sph_id", "bmedicine_id", "sp_qty", "sp_amount") VALUES
	(3,1,6,'1','0');
REPLACE INTO "tbl_shoppurchase" ("sp_id", "sph_id", "bmedicine_id", "sp_qty", "sp_amount") VALUES
	(4,2,3,'1','0');
/*!40000 ALTER TABLE "tbl_shoppurchase" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shoppurchasehead'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shoppurchasehead" (
  "sph_id" tinyint(4) NOT NULL auto_increment,
  "sph_totalamt" varchar(50) NOT NULL default '0',
  "sph_date" varchar(50) NOT NULL,
  "sph_status" int(11) NOT NULL default '0',
  "sph_paymentstatus" int(11) NOT NULL default '0',
  "shop_id" int(11) NOT NULL,
  "sph_requeststatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("sph_id"),
  UNIQUE KEY "sph_id" ("sph_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_shoppurchasehead'
#

LOCK TABLES "tbl_shoppurchasehead" WRITE;
/*!40000 ALTER TABLE "tbl_shoppurchasehead" DISABLE KEYS;*/
REPLACE INTO "tbl_shoppurchasehead" ("sph_id", "sph_totalamt", "sph_date", "sph_status", "sph_paymentstatus", "shop_id", "sph_requeststatus") VALUES
	(1,'1300.00','2022-05-10',1,0,3,2);
REPLACE INTO "tbl_shoppurchasehead" ("sph_id", "sph_totalamt", "sph_date", "sph_status", "sph_paymentstatus", "shop_id", "sph_requeststatus") VALUES
	(2,'0','2022-05-11',0,0,3,1);
/*!40000 ALTER TABLE "tbl_shoppurchasehead" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shopstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shopstock" (
  "shopstock_id" int(11) NOT NULL auto_increment,
  "smedicine_id" int(11) NOT NULL,
  "shopstock_qty" varchar(50) NOT NULL,
  PRIMARY KEY  ("shopstock_id"),
  UNIQUE KEY "shopstock_id" ("shopstock_id")
);



#
# Dumping data for table 'tbl_shopstock'
#

# No data found.



#
# Table structure for table 'tbl_shoptype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shoptype" (
  "shoptype_id" int(11) NOT NULL auto_increment,
  "shoptype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("shoptype_id"),
  UNIQUE KEY "shoptype_id" ("shoptype_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_shoptype'
#

LOCK TABLES "tbl_shoptype" WRITE;
/*!40000 ALTER TABLE "tbl_shoptype" DISABLE KEYS;*/
REPLACE INTO "tbl_shoptype" ("shoptype_id", "shoptype_name") VALUES
	(1,'EWFERFFFF');
/*!40000 ALTER TABLE "tbl_shoptype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
