/* This is an example data based on CS410_Database.gsheet */

CREATE DATABASE IF NOT EXISTS `phonecenter`;

/* Tell the workbench we will 'USE' this database for the rest */
USE `phonecenter`;
/* From now all operationss such as querying, creating, and storing will
** be performed on the database stated above */


/* Add a new employee table, delete the existing one if same name */
DROP TABLE IF EXISTS `employee`;

/* Create employee table */
CREATE TABLE `employee` (
  /* Attribute list */
  `ssn`       int(9)        NOT NULL,
  `name`      varchar(50)   NOT NULL,
  `userName`  varchar(20)   NOT NULL,
  `password`  varchar(20)   NOT NULL,
  /* Primary Key, No foreign key on this table */
  PRIMARY KEY(ssn)
) ENGINE=InnoDB;

/* insert data for "employee" table */
insert into `employee`
  (`ssn`,     `name`,             `userName`, `password`) values

  (123456789, 'John Smith',       'jsmith',   'smith6789'),
  (333445555, 'Franklin Wong',    'fwong',    'wong5555'),
  (999887777, 'Alicia Zelaya',    'azelaya',  'zelaya7777'),
  (987654321, 'Jennifer Wallace', 'jwallace', 'wallace4321'),
  (453453453, 'Joyce English',    'jenglish', 'english3453');
  /* End of insertion for employee table */

/* Add a phonecall table, delete existing one if same name */
DROP TABLE IF EXISTS `phonecall`;

/* create a phonecall table */
CREATE TABLE `phonecall` (
  /* Attribute list */
  `ssn`        int(9)    NOT NULL,
  `date`       date      NOT NULL,
  `startTime`  time      NOT NULL,
  `endTime`   time       NOT NULL,
  /* Primary key is "ssn", "date", and "startTime" */
  PRIMARY KEY (`ssn`, `date`, `startTime`),
  /* There's only one foreign key */
  CONSTRAINT `phonecall_conts_1` FOREIGN KEY (`ssn`)
  REFERENCES `employee` (`ssn`)
) ENGINE=InnoDB;

/* Data for "phonecall" table */
insert into `phonecall`
  (`ssn`,     `date`,       `startTime`, `endTime`) values
  (123456789, '2016-09-14', '09:32:36',  '10:16:07'),
  (123456789, '2016-09-14', '14:01:56',  '17:32:02'),
  (333445555, '2016-10-01', '17:02:27',  '18:22:48'),
  (333445555, '2016-10-02', '08:02:28',  '10:42:32'),
  (333445555, '2016-10-03', '09:10:23',  '11:00:33'),
  (453453453, '2016-10-03', '09:10:12',  '09:13:26'),
  (987654321, '2016-09-11', '12:31:44',  '12:36:11'),
  (123456789, '2016-09-14', '16:05:08',  '16:09:23'),
  (453453453, '2016-09-14', '16:05:08',  '16:08:22');

/* End of insertion for table "phonecall" */

/* delete table if KPI already existed in database */
DROP TABLE IF EXISTS `kpi`;

/*  Create table kpi */
CREATE TABLE `kpi` (
  /* Attribute list */
  `ssn`         int(9)  NOT NULL,
  `multiplier`  int(3)  NOT NULL,
  /* Primary Key */
  PRIMARY KEY (`ssn`),
  /* Foreign key */
  CONSTRAINT `kpi_conts_1` FOREIGN KEY (`ssn`) REFERENCES
  `employee` (`ssn`)
) ENGINE=InnoDB;

/* data for the table 'kpi' */
insert into `kpi`
  (`ssn`,     `multiplier`) values
  (123456789, 98),
  (333445555, 85),
  (999887777, 70),
  (987654321, 100),
  (453453453, 75);

/* end of insertion on table "kpi" */
