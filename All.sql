-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema btl csdl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema btl csdl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `btl csdl` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `btl csdl` ;

-- -----------------------------------------------------
-- Table `btl csdl`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`Cart` (
  `IDcart` INT NOT NULL,
  `GuestID` INT NOT NULL,
  PRIMARY KEY (`IDcart`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `btl csdl`.`CartDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`CartDetail` (
  `IDcart` INT NOT NULL AUTO_INCREMENT,
  `IDproduct` INT NOT NULL,
  `amount` INT NOT NULL,
  `Price` FLOAT NOT NULL,
  PRIMARY KEY (`IDcart`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `btl csdl`.`Guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`Guest` (
  `idGuest` INT NOT NULL AUTO_INCREMENT,
  `Mail` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `ResgistrationTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idGuest`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `btl csdl`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`Payment` (
  `idPayment` INT NOT NULL AUTO_INCREMENT,
  `idGuest` VARCHAR(45) NOT NULL,
  `Method` TINYINT NOT NULL,
  `idCreditCard` INT NOT NULL,
  `secureNum` INT NOT NULL,
  `Note` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `btl csdl`.`SalerList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`SalerList` (
  `idSalerList` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `ResgistrationTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idSalerList`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `btl csdl`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `btl csdl`.`product` (
  `IDproduct` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Type` TINYINT NULL DEFAULT '1',
  `Price` FLOAT NOT NULL,
  `amount` INT NULL DEFAULT NULL,
  `Ship` VARCHAR(45) NULL DEFAULT NULL,
  `Status` TINYINT(3) UNSIGNED ZEROFILL NULL DEFAULT '001',
  PRIMARY KEY (`IDproduct`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
