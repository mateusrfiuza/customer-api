-- MySQL Script generated by MySQL Workbench
-- Fri Mar 12 14:41:28 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema challenge
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema challenge
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `challenge` DEFAULT CHARACTER SET utf8 ;
USE `challenge` ;

-- -----------------------------------------------------
-- Table `challenge`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `challenge`.`CLIENT` (
  `id` VARCHAR(36) GENERATED ALWAYS AS (uuid()) VIRTUAL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `idCLIENT_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge`.`WISHLIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `challenge`.`WISHLIST` (
  `id` VARCHAR(36) GENERATED ALWAYS AS (uuid()) VIRTUAL,
  `description` VARCHAR(255) NOT NULL,
  `CLIENT_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCLIENT_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_WISHLIST_CLIENT_idx` (`CLIENT_id` ASC) VISIBLE,
  CONSTRAINT `fk_WISHLIST_CLIENT`
    FOREIGN KEY (`CLIENT_id`)
    REFERENCES `challenge`.`CLIENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge`.`WISHLIST_ITEM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `challenge`.`WISHLIST_ITEM` (
  `id` VARCHAR(36) GENERATED ALWAYS AS (uuid()) VIRTUAL,
  `product_key` VARCHAR(255) NOT NULL,
  `WISHLIST_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCLIENT_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_WISHLIST_ITEM_WISHLIST1_idx` (`WISHLIST_id` ASC) VISIBLE,
  UNIQUE INDEX `WISHLIST_id_UNIQUE` (`WISHLIST_id` ASC) VISIBLE,
  CONSTRAINT `fk_WISHLIST_ITEM_WISHLIST1`
    FOREIGN KEY (`WISHLIST_id`)
    REFERENCES `challenge`.`WISHLIST` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;