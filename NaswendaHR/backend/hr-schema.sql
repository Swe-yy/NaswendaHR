SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

Drop schema if exists `naswendaHR`;
create schema if not exists `naswendaHR` default character set latin1;
use `naswendaHR`;

create table if not exists `naswendaHR`.`Personal_Details`(
    `ID` varchar(13) PRIMARY KEY not null,
    `emp_num` char(8) not null,
    `first_name` varchar(15) not null,
    `last_name` varchar(20) not null,
    `initials` varchar(5) not null,
    `title` enum('Prof','Dr','Adv','Mrs','Mr','Ms') not null,
    `home_lang` varchar(20) not null,
    `pref_lang` varchar(20) not null,
    `ethnic_group` enum('African','Indian','Colourd','White') not null,
    `marital_status` enum('single','married','divorced','window/widower'),
    `prev_surname` varchar(20) not null,
    `gender` enum('Male','Female','Non-Binary','Other') not null,
    `start_date` date not null,
    `nationality` varchar(15) not null,
    `highest_qualifications` enum('HighSchool',"Bachelor's",'Diploma','Honours','Masters','PhD', 'Doctorate') not null,
    `email` varchar(40) not null,

    Constraint `fk_personal_worker`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Passport`(
    `passport_num` char(8) primary key not null,
    `country_of_issue` varchar(30) not null,
    `date_issued` date not null,
    `date_expiring` date not null
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Work_Permit`(
    `permit_num` char(13) Primary Key Not Null,
    `emp_num` char(8) not null,
    `date_issued` date not null,
    `date_expiring` date not null,

   Constraint `fk_permit_worker`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Qualifications`(
    `Qualification` varchar(40) not null,
    `institution` varchar(40) not null,
    `major` varchar(40) not null,
    `date_obtained` date not null,
    `graduated` tinyint not null Default 1,

    Primary Key(`Qualification`,`institution`)
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Leave_Request`(
    `L_ID` int auto_increment Primary Key not null,
    `leave_days`int not null ,
    `description` enum('Annual Leave', 'Sick Leave', 'Maternity Leave', 'Parental Leave', 'Bereavement Leave', 'Unpaid Leave', 'Family Leave', 'Medical Leave') not null,
    `emp`char(8) not null,
    `start_date` date not null,
    `end_date` date not null,

Constraint `fk_leave_worker`
        foreign key (`emp`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Membership`(
    `society_id`INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `society_name` varchar(20) not null,
    `post_help` varchar(20) not null,
    `membership_type` varchar(20) not null,
    `date_joined` date not null
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Next_of_Kin`(
    `first_name` varchar(20) not null,
    `last_name` varchar(30) not null,
    `relation` enum('guardian','sibling','aunt','uncle','cousin','child','spouse') not null,
    `street` varchar(30) not null,
    `city` varchar(30) not null,
    `postcode` int(4) not null,

    Primary Key(`first_name`,`last_name`),

    Constraint `fk_kin_addr`
        foreign key (`street`,`city`,`postcode`)
        references `naswendaHR`.`Address`(`street`,`city`,`postcode`)
        on delete no action
        on update no action
)
    Engine = InnoDB
    Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Bank_Details`(
    `acc_num` int Primary Key not null,
    `emp_num`char(8) not null,
    `bank_name` varchar(20) not null,
    `branch_name` int not null,
    `acc_type` enum('check','savings','credit') not null,
    `branch_code` int not null,
    `acc_holder` varchar(20) not null,
    
    Constraint `fk_bank_worker`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Worker`(
    `emp_num` char(8) primary key not null,
    `department` varchar(30) not null,
    `position` varchar(20) not null,
    `supervisor` char(8) not null,
    `responsibilities` varchar(50) not null
)
Engine = InnoDB
Default Character Set = utf8mb4;




create table if not exists `naswendaHR`.`Address`(
    `street` varchar(30) not null,
    `city` varchar(30) not null,
    `postcode` int(4) not null,
    `po_box` varchar(100) not null,
    `private_bag` varchar(100) not null,
    `province`varchar(100) not null,
    `suburb` varchar(100) not null,
    `type` enum('Postal','Residential','Permanent'),

    Primary Key (`street`,`city`,`postcode`)
)
Engine = InnoDB
Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Worker_Addr`(
    `street` varchar(30) not null,
    `city` varchar(30) not null,
    `postcode` int(4) not null,
    `emp_num` char(8)  not null,

    Primary Key (`street`,`city`,`postcode`,`emp_num`),


    Constraint `fk_worker_addr`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action,


    Constraint `fk_addr_worker`
        foreign key (`street`,`city`,`postcode`)
        references `naswendaHR`.`Address`(`street`,`city`,`postcode`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Worker_Qualifications`(
    `emp_num` char(8)  not null,
    `Qualification` varchar(40) not null,
    `institution` varchar(40) not null,

    Primary Key (`emp_num`,`Qualification`,`institution`),


    Constraint `fk_worker_qual`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action,

    Constraint `fk_worker_Qualification`
        foreign key (`Qualification`,`institution`)
        references `naswendaHR`.`Qualifications`(`Qualification`,`institution`)
        on delete no action
        on update no action

   
)
Engine = InnoDB
Default Character Set = utf8mb4;



create table if not exists `naswendaHR`.`Worker_Leave`(
    `L_ID` int not null,
    `emp_num` char(8)  not null,
    `leave_taken` int not null,
    `leave_available` int not null,

    Primary Key (`L_ID`,`emp_num`),

     Constraint `fk_worker_leave`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action,

    Constraint `fk_lid`
        foreign key (`L_ID`)
        references `naswendaHR`.`Leave_Request`(`L_ID`)
        on delete no action
        on update no action

)
Engine = InnoDB
Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Worker_Membership`(
    `society_id`int not null,
    `emp_num` char(8)  not null,

    Primary Key (`emp_num`, `society_id`),

    Constraint `fk_worker_member`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action,

    Constraint `fk_membership`
        foreign key (`society_id`)
        references `naswendaHR`.`Membership`(`society_id`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;

create table if not exists `naswendaHR`.`Worker_Kin`(
    `first_name` varchar(20) not null,
    `last_name` varchar(30) not null,
    `emp_num` char(8)  not null,
    `primary` tinyint not null default 0,

    Primary Key (`first_name`,`last_name`,`emp_num`),

    Constraint `fk_worker_kin`
        foreign key (`emp_num`)
        references `naswendaHR`.`Worker`(`emp_num`)
        on delete no action
        on update no action,

     Constraint `fk_kin_names`
        foreign key (`first_name`,`last_name`)
        references `naswendaHR`.`Next_of_Kin`(`first_name`,`last_name`)
        on delete no action
        on update no action


)
Engine = InnoDB
Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Phone_num`(
    `ID` varchar(13) not null,
    `phone_num` char(10) not null,

    Primary Key (`ID`,`phone_num`),

    Constraint `fk_phone_id`
        foreign key (`ID`)
        references `naswendaHR`.`Personal_Details`(`ID`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;


create table if not exists `naswendaHR`.`Kin_Addr`(
    `street` varchar(30) not null,
    `city` varchar(30) not null,
    `postcode` int(4) not null,
    `first_name` varchar(20) not null,
    `last_name` varchar(30) not null,

    Primary Key(`street`,`city`,`postcode`,`first_name`,`last_name`),

    Constraint `fk_kinAddr_addr`
        foreign key (`street`,`city`,`postcode`)
        references `naswendaHR`.`Address`(`street`,`city`,`postcode`)
        on delete no action
        on update no action,

    
    Constraint `fk_kinAddr_kin`
        foreign key (`first_name`,`last_name`)
        references `naswendaHR`.`Next_of_Kin`(`first_name`,`last_name`)
        on delete no action
        on update no action
)
Engine = InnoDB
Default Character Set = utf8mb4;
