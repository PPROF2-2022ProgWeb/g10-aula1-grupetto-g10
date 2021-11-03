-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Grupetto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Grupetto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Grupetto` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Grupetto` ;

-- -----------------------------------------------------
-- Table `Grupetto`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `Esta_Activo` TINYINT NOT NULL,
  `Es_Admin` TINYINT NOT NULL,
  `Fecha_Creacion` DATE NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Pais` (
  `idPais` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Ciudad` (
  `idCiudad` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Codigo postal` INT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idCiudad`, `Pais_idPais`),
  INDEX `fk_Ciudad_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `Grupetto`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Comentario` (
  `idComentario` INT NOT NULL,
  `Contenido` TEXT NULL,
  `Fecha_Publicacion` DATE NULL,
  `Perfil_idPerfil` INT NOT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Perfil1_idx` (`Perfil_idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Perfil1`
    FOREIGN KEY (`Perfil_idPerfil`)
    REFERENCES `Grupetto`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Recorrido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Recorrido` (
  `idRecorrido` INT NOT NULL,
  `Km` INT NOT NULL,
  `Likes` INT NULL,
  `DisLikes` INT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  `Ciudad_Pais_idPais` INT NOT NULL,
  `Comentario_idComentario` INT NOT NULL,
  `Fecha_Creacion` DATE NULL,
  `Autor_idPerfil` INT NOT NULL,
  PRIMARY KEY (`idRecorrido`),
  INDEX `fk_Recorrido_Ciudad1_idx` (`Ciudad_idCiudad` ASC, `Ciudad_Pais_idPais` ASC) VISIBLE,
  INDEX `fk_Recorrido_Comentario1_idx` (`Comentario_idComentario` ASC) VISIBLE,
  INDEX `fk_Recorrido_Perfil2_idx` (`Autor_idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Recorrido_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad` , `Ciudad_Pais_idPais`)
    REFERENCES `Grupetto`.`Ciudad` (`idCiudad` , `Pais_idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recorrido_Comentario1`
    FOREIGN KEY (`Comentario_idComentario`)
    REFERENCES `Grupetto`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recorrido_Perfil2`
    FOREIGN KEY (`Autor_idPerfil`)
    REFERENCES `Grupetto`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Perfil` (
  `idPerfil` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Amigos` INT NULL,
  `Km Recorriods` INT NULL,
  `genero` VARCHAR(1) NULL,
  `Apodo` VARCHAR(45) NULL,
  `Biografia` TEXT NULL,
  `Recorrido_idRecorrido` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idPerfil`),
  INDEX `fk_Perfil_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Perfil_Recorrido1_idx` (`Recorrido_idRecorrido` ASC) VISIBLE,
  INDEX `fk_Perfil_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Grupetto`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Recorrido1`
    FOREIGN KEY (`Recorrido_idRecorrido`)
    REFERENCES `Grupetto`.`Recorrido` (`idRecorrido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `Grupetto`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
