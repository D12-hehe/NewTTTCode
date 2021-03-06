CREATE TABLE IF NOT EXISTS `moat_inv_items` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`itemid` int(10) unsigned NOT NULL,
	`ownerid` bigint(20) unsigned NOT NULL,
	`slotid` int(10) DEFAULT NULL,
	`classname` varchar(32) DEFAULT NULL,
	`createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `ownerid` (`ownerid`)
);