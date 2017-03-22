CREATE DATABASE `speculative_scale_explorer` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `ecosytems` (
  `ecoID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ecoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `images` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `image` longblob,
  `ecoIDFK` int(11) NOT NULL,
  PRIMARY KEY (`imageID`),
  KEY `ecoIDFK_idx` (`ecoIDFK`),
  CONSTRAINT `ecoIDFK` FOREIGN KEY (`ecoIDFK`) REFERENCES `ecosytems` (`ecoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tags` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `image_tags` (
  `imageIDFK` int(11) NOT NULL,
  `tagIDFK` int(11) NOT NULL,
  PRIMARY KEY (`imageIDFK`,`tagIDFK`),
  KEY `tagIDFK_idx` (`tagIDFK`),
  CONSTRAINT `imageIDFK` FOREIGN KEY (`imageIDFK`) REFERENCES `images` (`imageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tagIDFK` FOREIGN KEY (`tagIDFK`) REFERENCES `tags` (`tagID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



