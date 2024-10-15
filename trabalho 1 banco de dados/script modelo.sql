-- MySQL Script generated by MySQL Workbench
-- Tue Oct 15 01:12:23 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma` (
  `idturma` INT NOT NULL AUTO_INCREMENT,
  `curso_idcurso` INT NOT NULL,
  `curso_professor_idprofessor` INT NOT NULL,
  `capacidade` INT NULL,
  `numero_de_alunos` INT NULL,
  PRIMARY KEY (`idturma`, `curso_idcurso`, `curso_professor_idprofessor`),
  UNIQUE INDEX `idturma_UNIQUE` (`idturma` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NULL,
  `endereco` VARCHAR(200) NULL,
  `email` VARCHAR(45) NULL,
  `cpf` BIGINT(11) NULL,
  `turma_idturma` INT NOT NULL,
  `turma_curso_idcurso` INT NOT NULL,
  `turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`matricula`, `turma_idturma`, `turma_curso_idcurso`, `turma_curso_professor_idprofessor`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_aluno_turma_idx` (`turma_idturma` ASC, `turma_curso_idcurso` ASC, `turma_curso_professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_turma`
    FOREIGN KEY (`turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`turma` (`idturma` , `curso_idcurso` , `curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(15) NULL,
  `nome` VARCHAR(45) NULL,
  `professor_idprofessor` INT NOT NULL,
  `horas` INT NULL,
  `requisitos` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `turma_idturma` INT NOT NULL,
  `turma_curso_idcurso` INT NOT NULL,
  `turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idcurso`, `professor_idprofessor`, `turma_idturma`, `turma_curso_idcurso`, `turma_curso_professor_idprofessor`),
  UNIQUE INDEX `idcurso_UNIQUE` (`idcurso` ASC) VISIBLE,
  INDEX `fk_curso_turma1_idx` (`turma_idturma` ASC, `turma_curso_idcurso` ASC, `turma_curso_professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_curso_turma1`
    FOREIGN KEY (`turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`turma` (`idturma` , `curso_idcurso` , `curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avaliações`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`avaliações` (
  `idavaliações` INT NOT NULL AUTO_INCREMENT,
  `Nota` INT NULL,
  `data` DATETIME NULL,
  `peso` VARCHAR(45) NULL,
  `curso_idcurso` INT NOT NULL,
  `curso_professor_idprofessor` INT NOT NULL,
  `curso_turma_idturma` INT NOT NULL,
  `curso_turma_curso_idcurso` INT NOT NULL,
  `curso_turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idavaliações`, `curso_idcurso`, `curso_professor_idprofessor`, `curso_turma_idturma`, `curso_turma_curso_idcurso`, `curso_turma_curso_professor_idprofessor`),
  UNIQUE INDEX `idavaliações_UNIQUE` (`idavaliações` ASC) VISIBLE,
  INDEX `fk_avaliações_curso1_idx` (`curso_idcurso` ASC, `curso_professor_idprofessor` ASC, `curso_turma_idturma` ASC, `curso_turma_curso_idcurso` ASC, `curso_turma_curso_professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_avaliações_curso1`
    FOREIGN KEY (`curso_idcurso` , `curso_professor_idprofessor` , `curso_turma_idturma` , `curso_turma_curso_idcurso` , `curso_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`curso` (`idcurso` , `professor_idprofessor` , `turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notas` (
  `idnotas` INT NOT NULL AUTO_INCREMENT,
  `aluno_idaluno` INT NOT NULL,
  `numero` INT NULL,
  `aprovação` INT NULL,
  `avaliações_idavaliações` INT NOT NULL,
  `avaliações_curso_idcurso` INT NOT NULL,
  `avaliações_curso_professor_idprofessor` INT NOT NULL,
  `avaliações_curso_turma_idturma` INT NOT NULL,
  `avaliações_curso_turma_curso_idcurso` INT NOT NULL,
  `avaliações_curso_turma_curso_professor_idprofessor` INT NOT NULL,
  `aluno_matricula` INT NOT NULL,
  `aluno_turma_idturma` INT NOT NULL,
  `aluno_turma_curso_idcurso` INT NOT NULL,
  `aluno_turma_curso_professor_idprofessor` INT NOT NULL,
  `turma_idturma` INT NOT NULL,
  `turma_curso_idcurso` INT NOT NULL,
  `turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idnotas`, `aluno_idaluno`, `avaliações_idavaliações`, `avaliações_curso_idcurso`, `avaliações_curso_professor_idprofessor`, `avaliações_curso_turma_idturma`, `avaliações_curso_turma_curso_idcurso`, `avaliações_curso_turma_curso_professor_idprofessor`, `aluno_matricula`, `aluno_turma_idturma`, `aluno_turma_curso_idcurso`, `aluno_turma_curso_professor_idprofessor`, `turma_idturma`, `turma_curso_idcurso`, `turma_curso_professor_idprofessor`),
  INDEX `fk_notas_avaliações1_idx` (`avaliações_idavaliações` ASC, `avaliações_curso_idcurso` ASC, `avaliações_curso_professor_idprofessor` ASC, `avaliações_curso_turma_idturma` ASC, `avaliações_curso_turma_curso_idcurso` ASC, `avaliações_curso_turma_curso_professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_notas_aluno1_idx` (`aluno_matricula` ASC, `aluno_turma_idturma` ASC, `aluno_turma_curso_idcurso` ASC, `aluno_turma_curso_professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_notas_turma1_idx` (`turma_idturma` ASC, `turma_curso_idcurso` ASC, `turma_curso_professor_idprofessor` ASC) VISIBLE,
  UNIQUE INDEX `idnotas_UNIQUE` (`idnotas` ASC) VISIBLE,
  CONSTRAINT `fk_notas_avaliações1`
    FOREIGN KEY (`avaliações_idavaliações` , `avaliações_curso_idcurso` , `avaliações_curso_professor_idprofessor` , `avaliações_curso_turma_idturma` , `avaliações_curso_turma_curso_idcurso` , `avaliações_curso_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`avaliações` (`idavaliações` , `curso_idcurso` , `curso_professor_idprofessor` , `curso_turma_idturma` , `curso_turma_curso_idcurso` , `curso_turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_aluno1`
    FOREIGN KEY (`aluno_matricula` , `aluno_turma_idturma` , `aluno_turma_curso_idcurso` , `aluno_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`aluno` (`matricula` , `turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_turma1`
    FOREIGN KEY (`turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`turma` (`idturma` , `curso_idcurso` , `curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`forum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`forum` (
  `idforum` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `ultima_atualizacao` DATETIME NULL,
  `curso_idcurso` INT NOT NULL,
  `curso_professor_idprofessor` INT NOT NULL,
  `curso_turma_idturma` INT NOT NULL,
  `curso_turma_curso_idcurso` INT NOT NULL,
  `curso_turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idforum`, `curso_idcurso`, `curso_professor_idprofessor`, `curso_turma_idturma`, `curso_turma_curso_idcurso`, `curso_turma_curso_professor_idprofessor`),
  INDEX `fk_forum_curso1_idx` (`curso_idcurso` ASC, `curso_professor_idprofessor` ASC, `curso_turma_idturma` ASC, `curso_turma_curso_idcurso` ASC, `curso_turma_curso_professor_idprofessor` ASC) VISIBLE,
  UNIQUE INDEX `idforum_UNIQUE` (`idforum` ASC) VISIBLE,
  CONSTRAINT `fk_forum_curso1`
    FOREIGN KEY (`curso_idcurso` , `curso_professor_idprofessor` , `curso_turma_idturma` , `curso_turma_curso_idcurso` , `curso_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`curso` (`idcurso` , `professor_idprofessor` , `turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `idprofessor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `formacao` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `numero` VARCHAR(11) NULL,
  `endereco` VARCHAR(200) NULL,
  `bio` VARCHAR(200) NULL,
  `turma_idturma` INT NOT NULL,
  `turma_curso_idcurso` INT NOT NULL,
  `turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idprofessor`, `turma_idturma`, `turma_curso_idcurso`, `turma_curso_professor_idprofessor`),
  UNIQUE INDEX `idprofessor_UNIQUE` (`idprofessor` ASC) VISIBLE,
  INDEX `fk_professor_turma1_idx` (`turma_idturma` ASC, `turma_curso_idcurso` ASC, `turma_curso_professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_turma1`
    FOREIGN KEY (`turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`turma` (`idturma` , `curso_idcurso` , `curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`material_de_estudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`material_de_estudo` (
  `idmaterial_de_estudo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NULL,
  `formato_de_arquivo` VARCHAR(4) NULL,
  `professor_idprofessor` INT NOT NULL,
  `professor_turma_idturma` INT NOT NULL,
  `professor_turma_curso_idcurso` INT NOT NULL,
  `professor_turma_curso_professor_idprofessor` INT NOT NULL,
  `curso_idcurso` INT NOT NULL,
  `curso_professor_idprofessor` INT NOT NULL,
  `curso_turma_idturma` INT NOT NULL,
  `curso_turma_curso_idcurso` INT NOT NULL,
  `curso_turma_curso_professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`idmaterial_de_estudo`, `professor_idprofessor`, `professor_turma_idturma`, `professor_turma_curso_idcurso`, `professor_turma_curso_professor_idprofessor`, `curso_idcurso`, `curso_professor_idprofessor`, `curso_turma_idturma`, `curso_turma_curso_idcurso`, `curso_turma_curso_professor_idprofessor`),
  INDEX `fk_material_de_estudo_professor1_idx` (`professor_idprofessor` ASC, `professor_turma_idturma` ASC, `professor_turma_curso_idcurso` ASC, `professor_turma_curso_professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_material_de_estudo_curso1_idx` (`curso_idcurso` ASC, `curso_professor_idprofessor` ASC, `curso_turma_idturma` ASC, `curso_turma_curso_idcurso` ASC, `curso_turma_curso_professor_idprofessor` ASC) VISIBLE,
  UNIQUE INDEX `idmaterial_de_estudo_UNIQUE` (`idmaterial_de_estudo` ASC) VISIBLE,
  CONSTRAINT `fk_material_de_estudo_professor1`
    FOREIGN KEY (`professor_idprofessor` , `professor_turma_idturma` , `professor_turma_curso_idcurso` , `professor_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`professor` (`idprofessor` , `turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_de_estudo_curso1`
    FOREIGN KEY (`curso_idcurso` , `curso_professor_idprofessor` , `curso_turma_idturma` , `curso_turma_curso_idcurso` , `curso_turma_curso_professor_idprofessor`)
    REFERENCES `mydb`.`curso` (`idcurso` , `professor_idprofessor` , `turma_idturma` , `turma_curso_idcurso` , `turma_curso_professor_idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
