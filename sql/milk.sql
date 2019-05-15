/*
Navicat MySQL Data Transfer

Source Server         : kang
Source Server Version : 50643
Source Host           : 106.13.106.73:3306
Source Database       : milk

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-05-15 09:10:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buyer_address`
-- ----------------------------
DROP TABLE IF EXISTS `buyer_address`;
CREATE TABLE `buyer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  CONSTRAINT `buyer_address_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `buyer_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buyer_address
-- ----------------------------
INSERT INTO `buyer_address` VALUES ('1', '康康', '15038701808', '先生', '河南省, 南阳市, 卧龙区,理工学院', '1');
INSERT INTO `buyer_address` VALUES ('2', 'gao', '18338448958', '先生', '河南省, 南阳市, 宛城区,zgc', '3');
INSERT INTO `buyer_address` VALUES ('3', '豆', '15038701808', '先生', '河南省, 南阳市, 卧龙区，中关村', '1');
INSERT INTO `buyer_address` VALUES ('4', '胡崇浩', '15888888887', '先生', '河南省, 南阳市, 卧龙区', '6');
INSERT INTO `buyer_address` VALUES ('5', '康康', '18338448958', '先生', '河南省, 南阳市, 宛城区,南阳理工学院', '9');
INSERT INTO `buyer_address` VALUES ('6', 'gkk', '15711255657', '先生', '南阳理工学院', '8');

-- ----------------------------
-- Table structure for `buyer_user`
-- ----------------------------
DROP TABLE IF EXISTS `buyer_user`;
CREATE TABLE `buyer_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '买家id',
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_pwd` varchar(255) NOT NULL COMMENT '买家密码',
  `buyer_phone` varchar(255) NOT NULL COMMENT '买家手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `buyer_name_UNIQUE` (`buyer_name`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of buyer_user
-- ----------------------------
INSERT INTO `buyer_user` VALUES ('1', 'zhangsan', '123', '');
INSERT INTO `buyer_user` VALUES ('2', 'mudongdong', '888', '15029831163');
INSERT INTO `buyer_user` VALUES ('3', 'root', 'root', '18338448958');
INSERT INTO `buyer_user` VALUES ('4', 'xubin', '666', '13525105347');
INSERT INTO `buyer_user` VALUES ('5', 'dou', '123', '13262073125');
INSERT INTO `buyer_user` VALUES ('6', 'huchonghao', '123', '15038705152');
INSERT INTO `buyer_user` VALUES ('7', 'lisi', '51ea015c9749e0ee553be2296ed036bfafc871e1fb2f8691896fef17f3e952fa', '15711255657');
INSERT INTO `buyer_user` VALUES ('8', 'gkk', '15fb3f24905b5ffbc60c2ff99e5e601a181c071f8b4a0cbfe15f6959baf1cd2f', '18338448958');
INSERT INTO `buyer_user` VALUES ('9', 'wangwu', '6aba166da80b2280e73936e3f75d0a939b38136c2ad19cd0929ea1cfcb803f09', '18338448958');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_id` varchar(255) NOT NULL DEFAULT '0',
  `product_id` int(4) NOT NULL DEFAULT '0',
  `product_quantity` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `productid_id` (`product_id`) USING BTREE,
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_master` (`order_id`),
  CONSTRAINT `productid_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('1557830412278382519', '1', '1');
INSERT INTO `order_item` VALUES ('1557227407627883522', '2', '1');
INSERT INTO `order_item` VALUES ('1557830412278382519', '3', '3');
INSERT INTO `order_item` VALUES ('1556610095513675481', '4', '1');
INSERT INTO `order_item` VALUES ('1556610429115277756', '5', '1');

-- ----------------------------
-- Table structure for `order_master`
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `order_id` varchar(255) NOT NULL,
  `buyer_phone` varchar(32) DEFAULT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) DEFAULT NULL COMMENT '买家地址',
  `order_amount` double(8,2) DEFAULT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` tinyint(3) DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `buyer_name` varchar(23) NOT NULL COMMENT '买家称呼',
  `seller_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `buyer_name` (`buyer_name`) USING BTREE,
  KEY `seller_id` (`seller_id`) USING BTREE,
  CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`buyer_name`) REFERENCES `buyer_user` (`buyer_name`),
  CONSTRAINT `order_master_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('1538193657451500619', '18338448958', '河南省, 南阳市, 宛城区,zgc', '66.00', '1', '1', '2018-09-29 12:00:57', null, 'root', '2');
INSERT INTO `order_master` VALUES ('1538272727605832149', '18338448958', '河南省, 南阳市, 宛城区,zgc', '1351.30', '0', '0', '2018-09-30 09:58:48', null, 'root', '2');
INSERT INTO `order_master` VALUES ('1538299344792938470', '15888888887', '河南省, 南阳市, 卧龙区', '558.26', '1', '1', '2018-09-30 17:22:25', null, 'huchonghao', '2');
INSERT INTO `order_master` VALUES ('1554213614215158139', '15038701808', '河南省, 南阳市, 卧龙区，中关村', '166.00', '1', '0', '2019-04-02 22:00:14', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1556610095513675481', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '160.20', '0', '1', '2019-04-30 15:41:36', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1556610429115277756', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '110.00', '0', '1', '2019-04-30 15:47:09', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1556765103225839558', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '110.26', '0', '0', '2019-05-02 10:45:03', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1557226657592695356', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '515.84', '0', '0', '2019-05-07 18:57:38', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1557226710364853343', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '0.00', '1', '0', '2019-05-07 18:58:30', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1557227407627883522', '15038701808', '河南省, 南阳市, 卧龙区,理工学院', '66.00', '1', '1', '2019-05-07 19:10:08', null, 'zhangsan', '2');
INSERT INTO `order_master` VALUES ('1557827703048598262', '18338448958', '河南省, 南阳市, 宛城区,南阳理工学院', '210.52', '0', '1', '2019-05-14 17:55:03', null, 'wangwu', '2');
INSERT INTO `order_master` VALUES ('1557830412278382519', '15711255657', '南阳理工学院', '299.95', '0', '0', '2019-05-14 18:40:12', null, 'gkk', '2');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(32) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` double(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `product_photo` varchar(512) DEFAULT NULL COMMENT '小图',
  `product_tid` int(11) NOT NULL COMMENT '类目',
  `seller_id` int(4) DEFAULT NULL COMMENT '卖家id',
  PRIMARY KEY (`product_id`) USING BTREE,
  UNIQUE KEY `product_id_UNIQUE` (`product_id`) USING BTREE,
  KEY `product_tid` (`product_tid`) USING BTREE,
  KEY `seller_id_idx` (`seller_id`) USING BTREE,
  CONSTRAINT `producttid_id` FOREIGN KEY (`product_tid`) REFERENCES `product_type` (`id`),
  CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '巴氏消毒奶001', '100.26', '62', '狠辣', '001.jpg', '1', '1');
INSERT INTO `product` VALUES ('2', '常温奶001', '56.00', '73', '超好喝', '002.jpg', '2', '1');
INSERT INTO `product` VALUES ('3', '常温奶002', '63.23', '51', '好吃', '003.jpg', '2', '1');
INSERT INTO `product` VALUES ('4', '巴氏消毒奶002', '50.20', '58', '好喝', 'a3244ab9-f382-44bb-8362-94a16ebf7b71.jpg', '1', '2');
INSERT INTO `product` VALUES ('5', '巴氏消毒奶003', '100.00', '97', '好想吃', '3be55d6b-a5fd-44f5-891c-cd55ad143d41.jpg', '1', '2');
INSERT INTO `product` VALUES ('6', '还原奶001', '120.00', '120', '好喝的不得了', '83be28f9-9055-48d2-828b-da3b98fc84a6.jpg', '3', '2');
INSERT INTO `product` VALUES ('7', '常温奶003', '100.00', '120', '爽歪歪', 'b577b870-cbda-4ebe-b3b2-dbe07e287faa.jpg', '2', '2');
INSERT INTO `product` VALUES ('8', '巴氏消毒奶004', '14.00', '23', '很甜', '796ada8a-fdf9-4b00-9f90-ef9e27cb7552.jpg', '1', '2');
INSERT INTO `product` VALUES ('9', '巴氏消毒奶005', '16.00', '23', 'very good', '065dbbc1-be87-4aec-ae79-eeeb66af3bca.jpg', '1', '2');
INSERT INTO `product` VALUES ('10', '巴氏消毒奶006', '12.00', '21', '我的', '9d7d7f35-5c6f-4e73-a574-ed2c485cb583.jpg', '1', '2');
INSERT INTO `product` VALUES ('11', '巴氏消毒奶007', '21.00', '21', '212', 'd28483eb-e199-4fa0-8276-fc7c7586ffd8.jpg', '1', '2');
INSERT INTO `product` VALUES ('12', '生鲜牛奶001', '12.00', '23', '不错不错', '644bed23-5ed2-45ca-a0b9-31db58f6a53c.jpg', '4', '2');
INSERT INTO `product` VALUES ('13', '无抗奶001', '23.00', '34', '真心不错', '03e52135-7aa6-45c9-82e9-620dcc99b8b4.jpg', '5', '2');
INSERT INTO `product` VALUES ('14', '灭菌牛奶001', '54.00', '43', '牛', '31a571db-b85d-4cbb-abc3-84ffeb5618db.jpg', '6', '2');
INSERT INTO `product` VALUES ('15', '水牛奶001', '43.00', '23', '好喝好喝', 'ee7ec96e-88c0-47a6-8e41-fd2e6e3bfafa.jpg', '7', '2');

-- ----------------------------
-- Table structure for `product_type`
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL COMMENT '类目名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '巴氏消毒奶');
INSERT INTO `product_type` VALUES ('2', '常温奶');
INSERT INTO `product_type` VALUES ('3', '还原奶');
INSERT INTO `product_type` VALUES ('4', '生鲜牛奶');
INSERT INTO `product_type` VALUES ('5', '无抗奶');
INSERT INTO `product_type` VALUES ('6', '灭菌牛奶');
INSERT INTO `product_type` VALUES ('7', '水牛奶');

-- ----------------------------
-- Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `isadmin` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='卖家信息表';

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', 'admin', 'admin', '1');
INSERT INTO `seller` VALUES ('2', 'root', 'root', '1');
