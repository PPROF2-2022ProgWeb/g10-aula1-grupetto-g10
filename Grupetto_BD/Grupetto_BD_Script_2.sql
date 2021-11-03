drop database grupetto;

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
  `Fecha_Creacion` DATE NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  `Amigos` INT NULL,
  `Km Recorriods` INT NULL,
  `genero` VARCHAR(1) NULL,
  `Apodo` VARCHAR(45) NULL,
  `Biografia` TEXT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idPerfil`),
  INDEX `fk_Perfil_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Perfil_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  UNIQUE INDEX `Usuario_idUsuario_UNIQUE` (`Usuario_idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `idPerfil_UNIQUE` (`idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Grupetto`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `Grupetto`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `Contenido` TEXT NULL,
  `Fecha_Publicacion` DATE NOT NULL,
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
-- Table `Grupetto`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Codigo postal` INT NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_Ciudad_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  UNIQUE INDEX `Codigo postal_UNIQUE` (`Codigo postal` ASC) VISIBLE,
  UNIQUE INDEX `Pais_idPais_UNIQUE` (`Pais_idPais` ASC) VISIBLE,
  UNIQUE INDEX `idCiudad_UNIQUE` (`idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `Grupetto`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grupetto`.`Recorrido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Grupetto`.`Recorrido` (
  `idRecorrido` INT NOT NULL AUTO_INCREMENT,
  `Km` INT NOT NULL,
  `Likes` INT NULL,
  `DisLikes` INT NULL,
  `Fecha_Creacion` DATE NULL,
  `Autor_idPerfil` INT NOT NULL,
  `Comentario_idComentario` INT NOT NULL,
  `Ciudad_idCiudad` INT NOT NULL,
  PRIMARY KEY (`idRecorrido`),
  INDEX `fk_Recorrido_Perfil2_idx` (`Autor_idPerfil` ASC) VISIBLE,
  UNIQUE INDEX `Autor_idPerfil_UNIQUE` (`Autor_idPerfil` ASC) VISIBLE,
  INDEX `fk_Recorrido_Comentario1_idx` (`Comentario_idComentario` ASC) VISIBLE,
  INDEX `fk_Recorrido_Ciudad1_idx` (`Ciudad_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Recorrido_Perfil2`
    FOREIGN KEY (`Autor_idPerfil`)
    REFERENCES `Grupetto`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recorrido_Comentario1`
    FOREIGN KEY (`Comentario_idComentario`)
    REFERENCES `Grupetto`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recorrido_Ciudad1`
    FOREIGN KEY (`Ciudad_idCiudad`)
    REFERENCES `Grupetto`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `grupetto`.`pais` (`idPais`, `Nombre`) VALUES 
('1', 'argentina'),
('2', 'brasil');

INSERT INTO `grupetto`.`ciudad` (`idCiudad`, `Nombre`, `Codigo postal`, `Pais_idPais`) VALUES 
('1', 'cordoba', '1234', '1');

INSERT INTO `grupetto`.`usuario` (`idUsuario`, `Nombre`, `Apellido`, `email`, `contraseña`, `Fecha_Creacion`) VALUES 
('1', 'marcos', 'santana', 'marcos@algo', '1234', '2021/2/1'),
('2', 'juan', 'perez', 'juan@algo', '123456', '2021/2/1'),
('3', 'nicolas' , 'gutierrez', 'nico@algo' , '1234' , '2021/4/4'),
('4', 'emanuel' , 'martinez', 'ema@algo' , '1234' , '2021/4/3');

INSERT INTO `grupetto`.`perfil` (`idPerfil`, `Usuario_idUsuario`, `Amigos`, `Km Recorriods`, `genero`, `Apodo`, `Biografia`, `Pais_idPais`) VALUES 
('1', '1', '0', '2', 'm', 'pancho', 'a ', '1');

select nombre
from usuario
where nombre = 'juan';

INSERT INTO `grupetto`.`comentario` (`idComentario`, `Contenido`, `Fecha_Publicacion`, `Perfil_idPerfil`) VALUES 
('1', 'hola', '2020/5/1', '1');

INSERT INTO `grupetto`.`recorrido` (`idRecorrido`, `Km`, `Likes`, `DisLikes`, `Fecha_Creacion`, `Autor_idPerfil`, `Comentario_idComentario`, `Ciudad_idCiudad`) VALUES 
('1', '12', '0', '0', '2020/5/7', '1', '1', '1');

update usuario
set email='papa27@hotmail'
where nombre='juan';

update usuario
set contraseña='papa'
where contraseña='1234';

delete from usuario
where idUsuario='3';
