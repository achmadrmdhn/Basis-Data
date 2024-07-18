-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UjianOnline
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UjianOnline
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UjianOnline` DEFAULT CHARACTER SET utf8 ;
USE `UjianOnline` ;

-- -----------------------------------------------------
-- Table `UjianOnline`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`User` (
  `id` INT NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  `role_id` INT NULL,
  `role` ENUM('Student', 'Tacher') NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Course` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Student_Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Student_Answer` (
  `id` INT NOT NULL,
  `student_quiz_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `answer_id` INT NOT NULL,
  `Question_id` INT NOT NULL,
  `answer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Student_Answer_Question1_idx` (`Question_id` ASC) VISIBLE,
  INDEX `fk_Student_Answer_answer1_idx` (`answer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Answer_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `UjianOnline`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Answer_answer1`
    FOREIGN KEY (`answer_id`)
    REFERENCES `UjianOnline`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Student` (
  `id` INT NOT NULL,
  `nama` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `gender` ENUM("Laki-Laki", "Perempuan") NOT NULL,
  `user_id` INT NOT NULL,
  `Role_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Student_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `UjianOnline`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Student_Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Student_Quiz` (
  `id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `Student_Answer_id` INT NOT NULL,
  `Student_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Student_Quiz_Student_Answer1_idx` (`Student_Answer_id` ASC) VISIBLE,
  INDEX `fk_Student_Quiz_Student1_idx` (`Student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Quiz_Student_Answer1`
    FOREIGN KEY (`Student_Answer_id`)
    REFERENCES `UjianOnline`.`Student_Answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Quiz_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `UjianOnline`.`Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Quiz` (
  `id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `quiz_title` VARCHAR(15) NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  `Course_id` INT NOT NULL,
  `Student_Quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Quiz_Course1_idx` (`Course_id` ASC) VISIBLE,
  INDEX `fk_Quiz_Student_Quiz1_idx` (`Student_Quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Quiz_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `UjianOnline`.`Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quiz_Student_Quiz1`
    FOREIGN KEY (`Student_Quiz_id`)
    REFERENCES `UjianOnline`.`Student_Quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Question` (
  `id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `question_text` VARCHAR(200) NOT NULL,
  `Quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Question_Quiz1_idx` (`Quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Question_Quiz1`
    FOREIGN KEY (`Quiz_id`)
    REFERENCES `UjianOnline`.`Quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`answer` (
  `id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `answer_text` VARCHAR(1000) NOT NULL,
  `is_correct` TINYINT NOT NULL,
  `Question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_answer_Question1_idx` (`Question_id` ASC) VISIBLE,
  CONSTRAINT `fk_answer_Question1`
    FOREIGN KEY (`Question_id`)
    REFERENCES `UjianOnline`.`Question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Score` (
  `id` INT NOT NULL,
  `student_quiz_id` INT NOT NULL,
  `score_value` INT NULL,
  `Student_Quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Score_Student_Quiz1_idx` (`Student_Quiz_id` ASC) VISIBLE,
  CONSTRAINT `fk_Score_Student_Quiz1`
    FOREIGN KEY (`Student_Quiz_id`)
    REFERENCES `UjianOnline`.`Student_Quiz` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Teacher` (
  `id` INT NOT NULL,
  `nama` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `gender` ENUM("Laki-Laki", "Perempuan") NOT NULL,
  `user_id` INT NOT NULL,
  `Role_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Teacher_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Teacher_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `UjianOnline`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UjianOnline`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UjianOnline`.`Admin` (
  `id` INT NOT NULL,
  `nama` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `Role_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Admin_User1_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `fk_Admin_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `UjianOnline`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
