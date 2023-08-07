-- -----------------------------------------------------
-- Table `mydb`.`Lab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab` (
  `Course name` VARCHAR(40) NOT NULL,
  `Credit` INT NULL,
  `Section` INT NOT NULL,
  UNIQUE INDEX `Course name_UNIQUE` (`Course name` ASC) VISIBLE,
  PRIMARY KEY (`Course name`))

-- -----------------------------------------------------
-- Table `mydb`.`Theory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Theory` (
  `Course name` VARCHAR(40) NOT NULL,
  `Credit` INT NOT NULL,
  `Section` INT NOT NULL,
  UNIQUE INDEX `Course name_UNIQUE` (`Course name` ASC) VISIBLE,
  PRIMARY KEY (`Course name`))


-- -----------------------------------------------------
-- Table `mydb`.`System`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`System` (
  `Labs_to_be_alloted` VARCHAR(45) NOT NULL,
  `Theories_to_be_alloted` VARCHAR(45) NOT NULL,
  `Labs_alloted` VARCHAR(45) NOT NULL,
  `Theories_alloted` VARCHAR(45) NOT NULL,
  `Lab_Course name` VARCHAR(40) NOT NULL,
  `Theory_Course name` VARCHAR(40) NOT NULL,
  UNIQUE INDEX `Subjects_to_allot_UNIQUE` (`Labs_to_be_alloted` ASC) VISIBLE,
  UNIQUE INDEX `Subjects_alloted_UNIQUE` (`Theories_to_be_alloted` ASC) VISIBLE,
  UNIQUE INDEX `Labs_alloted_UNIQUE` (`Labs_alloted` ASC) VISIBLE,
  UNIQUE INDEX `Theories_alloted_UNIQUE` (`Theories_alloted` ASC) VISIBLE,
  PRIMARY KEY (`Lab_Course name`, `Theory_Course name`),
  INDEX `fk_System_Theory1_idx` (`Theory_Course name` ASC) VISIBLE,
  CONSTRAINT `fk_System_Lab1`
    FOREIGN KEY (`Lab_Course name`)
    REFERENCES `mydb`.`Lab` (`Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_System_Theory1`
    FOREIGN KEY (`Theory_Course name`)
    REFERENCES `mydb`.`Theory` (`Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
-- -----------------------------------------------------
-- Table `mydb`.`Teaching Assistant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teaching Assistant` (
  `TA_ID` INT NOT NULL,
  `Preffered Subjects` VARCHAR(45) NOT NULL,
  `Email_ID` VARCHAR(40) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `System_Lab_Course name` VARCHAR(40) NOT NULL,
  `System_Theory_Course name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`TA_ID`, `System_Lab_Course name`, `System_Theory_Course name`),
  UNIQUE INDEX `TA_ID_UNIQUE` (`TA_ID` ASC) VISIBLE,
  UNIQUE INDEX `Email_ID_UNIQUE` (`Email_ID` ASC) VISIBLE,
  INDEX `fk_Teaching Assistant_System1_idx` (`System_Lab_Course name` ASC, `System_Theory_Course name` ASC) VISIBLE,
  CONSTRAINT `fk_Teaching Assistant_System1`
    FOREIGN KEY (`System_Lab_Course name` , `System_Theory_Course name`)
    REFERENCES `mydb`.`System` (`Lab_Course name` , `Theory_Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table `mydb`.`Proffessor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proffessor` (
  `Proffessor_ID` INT NOT NULL,
  `Preffered Subjects` VARCHAR(45) NOT NULL,
  `Email_ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Designation` VARCHAR(20) NULL,
  `System_Lab_Course name` VARCHAR(40) NOT NULL,
  `System_Theory_Course name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Proffessor_ID`, `System_Lab_Course name`, `System_Theory_Course name`),
  UNIQUE INDEX `Proffessor_ID_UNIQUE` (`Proffessor_ID` ASC) VISIBLE,
  UNIQUE INDEX `Email_ID_UNIQUE` (`Email_ID` ASC) VISIBLE,
  INDEX `fk_Proffessor_System1_idx` (`System_Lab_Course name` ASC, `System_Theory_Course name` ASC) VISIBLE,
  CONSTRAINT `fk_Proffessor_System1`
    FOREIGN KEY (`System_Lab_Course name` , `System_Theory_Course name`)
    REFERENCES `mydb`.`System` (`Lab_Course name` , `Theory_Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Subject` (
  `Course_Code` INT NOT NULL,
  `Semester` INT NOT NULL,
  `Branch` VARCHAR(10) NOT NULL,
  `Lab_Course name` VARCHAR(40) NOT NULL,
  `Theory_Course name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Course_Code`, `Lab_Course name`, `Theory_Course name`),
  UNIQUE INDEX `Course_Code_UNIQUE` (`Course_Code` ASC) VISIBLE,
  INDEX `fk_Subject_Lab_idx` (`Lab_Course name` ASC) VISIBLE,
  INDEX `fk_Subject_Theory1_idx` (`Theory_Course name` ASC) VISIBLE,
  CONSTRAINT `fk_Subject_Lab`
    FOREIGN KEY (`Lab_Course name`)
    REFERENCES `mydb`.`Lab` (`Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subject_Theory1`
    FOREIGN KEY (`Theory_Course name`)
    REFERENCES `mydb`.`Theory` (`Course name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

