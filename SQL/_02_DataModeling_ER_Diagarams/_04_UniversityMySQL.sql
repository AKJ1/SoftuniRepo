SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `university`.`faculties`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`faculties` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT ,
  `faculty_name` VARCHAR(100) NULL ,
  `faculty_departments` VARCHAR(45) NULL ,
  PRIMARY KEY (`faculty_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`departments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`departments` (
  `department_id` INT NOT NULL AUTO_INCREMENT ,
  `department_name` VARCHAR(45) NULL ,
  `department_professors` VARCHAR(45) NULL ,
  `department_faculty` VARCHAR(45) NULL ,
  `faculties_faculty_id` INT NOT NULL ,
  PRIMARY KEY (`department_id`, `faculties_faculty_id`) ,
  INDEX `fk_departments_faculties1_idx` (`faculties_faculty_id` ASC) ,
  CONSTRAINT `fk_departments_faculties1`
    FOREIGN KEY (`faculties_faculty_id` )
    REFERENCES `university`.`faculties` (`faculty_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`professors`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`professors` (
  `professors_id` INT NOT NULL AUTO_INCREMENT ,
  `professor_name` VARCHAR(45) NULL ,
  `departments_department_id` INT NOT NULL ,
  `departments_faculties_faculty_id` INT NOT NULL ,
  PRIMARY KEY (`professors_id`, `departments_department_id`, `departments_faculties_faculty_id`) ,
  INDEX `fk_professors_departments1_idx` (`departments_department_id` ASC, `departments_faculties_faculty_id` ASC) ,
  CONSTRAINT `fk_professors_departments1`
    FOREIGN KEY (`departments_department_id` , `departments_faculties_faculty_id` )
    REFERENCES `university`.`departments` (`department_id` , `faculties_faculty_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`classes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`classes` (
  `class_id` INT NOT NULL AUTO_INCREMENT ,
  `class_proffessor` VARCHAR(45) NULL ,
  `class_students` VARCHAR(45) NULL ,
  `professors_professors_id` INT NOT NULL ,
  `professors_departments_department_id` INT NOT NULL ,
  `professors_departments_faculties_faculty_id` INT NOT NULL ,
  PRIMARY KEY (`class_id`, `professors_professors_id`, `professors_departments_department_id`, `professors_departments_faculties_faculty_id`) ,
  INDEX `fk_classes_professors1_idx` (`professors_professors_id` ASC, `professors_departments_department_id` ASC, `professors_departments_faculties_faculty_id` ASC) ,
  CONSTRAINT `fk_classes_professors1`
    FOREIGN KEY (`professors_professors_id` , `professors_departments_department_id` , `professors_departments_faculties_faculty_id` )
    REFERENCES `university`.`professors` (`professors_id` , `departments_department_id` , `departments_faculties_faculty_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT ,
  `student_name` VARCHAR(100) NULL ,
  `student_classes` VARCHAR(45) NULL ,
  PRIMARY KEY (`student_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`titles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`titles` (
  `title_id` INT NOT NULL AUTO_INCREMENT ,
  `title_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`title_id`) );


-- -----------------------------------------------------
-- Table `university`.`students_has_classes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`students_has_classes` (
  `students_student_id` INT NOT NULL ,
  `classes_class_id` INT NOT NULL ,
  PRIMARY KEY (`students_student_id`, `classes_class_id`) ,
  INDEX `fk_students_has_classes_classes1_idx` (`classes_class_id` ASC) ,
  INDEX `fk_students_has_classes_students_idx` (`students_student_id` ASC) ,
  CONSTRAINT `fk_students_has_classes_students`
    FOREIGN KEY (`students_student_id` )
    REFERENCES `university`.`students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_classes_classes1`
    FOREIGN KEY (`classes_class_id` )
    REFERENCES `university`.`classes` (`class_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`professors_has_titles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `university`.`professors_has_titles` (
  `professors_professors_id` INT NOT NULL ,
  `professors_departments_department_id` INT NOT NULL ,
  `professors_departments_faculties_faculty_id` INT NOT NULL ,
  `titles_title_id` INT NOT NULL ,
  PRIMARY KEY (`professors_professors_id`, `professors_departments_department_id`, `professors_departments_faculties_faculty_id`, `titles_title_id`) ,
  INDEX `fk_professors_has_titles_titles1_idx` (`titles_title_id` ASC) ,
  INDEX `fk_professors_has_titles_professors1_idx` (`professors_professors_id` ASC, `professors_departments_department_id` ASC, `professors_departments_faculties_faculty_id` ASC) ,
  CONSTRAINT `fk_professors_has_titles_professors1`
    FOREIGN KEY (`professors_professors_id` , `professors_departments_department_id` , `professors_departments_faculties_faculty_id` )
    REFERENCES `university`.`professors` (`professors_id` , `departments_department_id` , `departments_faculties_faculty_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professors_has_titles_titles1`
    FOREIGN KEY (`titles_title_id` )
    REFERENCES `university`.`titles` (`title_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
