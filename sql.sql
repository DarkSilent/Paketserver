CREATE TABLE `wcf1_updateserver_packages` (
`packageID` INT( 20 ) NOT NULL AUTO_INCREMENT ,
`package` VARCHAR( 255 ) NOT NULL ,
`packageName` VARCHAR( 255 ) NOT NULL ,
`packageDescription` VARCHAR( 255 ) NOT NULL ,
`plugin` VARCHAR( 255 ) NOT NULL ,
`author` VARCHAR( 255 ) NOT NULL ,
`authorURL` VARCHAR( 255 ) NOT NULL ,
PRIMARY KEY ( `packageID` ) 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_versions_stable` (
`versionID` INT( 20 ) NOT NULL AUTO_INCREMENT ,
`packageID` INT( 25 ) NOT NULL ,
`version` VARCHAR( 20 ) NOT NULL ,
`updatetype` VARCHAR( 20 ) NOT NULL ,
`time` INT( 100 ) NOT NULL ,
`file` VARCHAR( 255 ) NOT NULL ,
`server` INT( 1 ) NOT NULL ,
PRIMARY KEY ( `versionID` ) 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_versions_testing` (
`versionID` INT( 20 ) NOT NULL AUTO_INCREMENT ,
`packageID` INT( 25 ) NOT NULL ,
`version` VARCHAR( 20 ) NOT NULL ,
`updatetype` VARCHAR( 20 ) NOT NULL ,
`time` INT( 100 ) NOT NULL ,
`file` VARCHAR( 255 ) NOT NULL ,
`server` INT( 1 ) NOT NULL ,
PRIMARY KEY ( `versionID` ) 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_versions_unstable` (
`versionID` INT( 20 ) NOT NULL AUTO_INCREMENT ,
`packageID` INT( 25 ) NOT NULL ,
`version` VARCHAR( 20 ) NOT NULL ,
`updatetype` VARCHAR( 20 ) NOT NULL ,
`time` INT( 100 ) NOT NULL ,
`file` VARCHAR( 255 ) NOT NULL ,
`server` INT( 1 ) NOT NULL ,
PRIMARY KEY ( `versionID` ) 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_requirements_stable` (
`versionID` INT( 20 ) NOT NULL ,
`requiredpackage` VARCHAR( 255 ) NOT NULL ,
`minversion` VARCHAR( 255 ) NOT NULL 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_requirements_testing` (
`versionID` INT( 20 ) NOT NULL ,
`requiredpackage` VARCHAR( 255 ) NOT NULL ,
`minversion` VARCHAR( 255 ) NOT NULL 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_requirements_unstable` (
`versionID` INT( 20 ) NOT NULL ,
`requiredpackage` VARCHAR( 255 ) NOT NULL ,
`minversion` VARCHAR( 255 ) NOT NULL 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_fromversions_stable` (
`versionID` INT( 20 ) NOT NULL ,
`fromversion` VARCHAR( 30 ) NOT NULL 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_fromversions_testing` (
`versionID` INT( 20 ) NOT NULL ,
`fromversion` VARCHAR( 30 ) NOT NULL 
) ENGINE = MYISAM ;

CREATE TABLE `wcf1_updateserver_fromversions_unstable` (
`versionID` INT( 20 ) NOT NULL ,
`fromversion` VARCHAR( 30 ) NOT NULL 
) ENGINE = MYISAM ;