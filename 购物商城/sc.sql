SET NAMES UTF8;
DROP DATABASE IF EXISTS sc;
CREATE DATABASE sc CHARSET=UTF8;
USE sc;

CREATE TABLE orders(
  odid INT PRIMARY KEY AUTO_INCREMENT, #订单ID	主键，不能为空，自增，且惟一
  oduserid BIGINT,  #用户的ID	外键，约束
  odshoppingid INT,  #收货信息ID
  payment DECIMAL(20,2),             #实付金额	保留小数两位
  paymenttype INT,      #付款类型	1-支付宝，0-微信，2-云闪付
  postage INT,        #运费	不能为空
  odstatus INT,    #订单状态	0-取消，1-未付款，2-已付款，3-已发货，4-交易成功，5-交易关闭
  paymenttime DATETIME,    #支付时间	自动生成时间
  sendtime DATETIME,    #发货时间
  endtime DATETIME,    #订单完成时间
  closetime DATETIME,   #交易关闭时间
  odcreatetime DATETIME,  #订单创建时间
  odupdatetime DATETIME   #订单修改时间
);

/**用户订单**/
CREATE TABLE orderitem(
  oiid INT PRIMARY KEY AUTO_INCREMENT,  #子订单ID	主键，不能为空，自增，且惟一
  oiordersid INT,           #订单ID
  oiuserid BIGINT,         #用户ID
  oiproductid BIGINT,               #商品ID
  oiproductname VARCHAR(50),  #商品名称
  oiproductimage TEXT,  #商品主图
  oiprice DECIMAL(20,2), #单价
  oicount INT,           #商品数量
  oicreatetime DATETIME,   #订单明细创建时间
  oiupdatetime DATETIME    #订单明细修改时间
);

INSERT INTO orders VALUES(1,'1','1','50','支付宝','45','未付款','2020-10-10 10:10:10','2020-10-10 11:10:10','2020-10-11 10:10:10','2020-10-10 10:10:9','2020-10-10 10:10:10','2020-10-12 10:10:10');
INSERT INTO orders VALUES(2,'2','2','50','支付宝','45','未付款','2020-10-10 10:10:10','2020-10-10 11:10:10','2020-10-11 10:10:10','2020-10-10 10:10:9','2020-10-10 10:10:10','2020-10-12 10:10:10');
INSERT INTO orders VALUES(3,'3','2','50','支付宝','45','未付款','2020-10-10 10:10:10','2020-10-10 11:10:10','2020-10-11 10:10:10','2020-10-10 10:10:9','2020-10-10 10:10:10','2020-10-12 10:10:10');
INSERT INTO orders VALUES(4,'3','4','50','支付宝','45','未付款','2020-10-10 10:10:10','2020-10-10 11:10:10','2020-10-11 10:10:10','2020-10-10 10:10:9','2020-10-10 10:10:10','2020-10-12 10:10:10');



INSERT INTO orderitem VALUES(1,'1','1','1','耐克','images/1.jpg','20','4','2020-10-10 10:10:10','2020-10-10 10:10:15');
INSERT INTO orderitem VALUES(2,'2','2','2','耐克','images/1.jpg','20','4','2020-10-10 10:10:10','2020-10-10 10:10:14');
INSERT INTO orderitem VALUES(3,'3','3','3','耐克','images/1.jpg','20','4','2020-10-10 10:10:10','2020-10-10 10:10:13');
INSERT INTO orderitem VALUES(4,'4','4','4','耐克','images/1.jpg','20','4','2020-10-10 10:10:10','2020-10-10 10:10:12');

