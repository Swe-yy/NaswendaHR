SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

Drop schema if exists 'naswendaHR';
create schema if not exists 'naswendaHR' default character set latin1;
use 'naswendaHR';

create table if not exists 'naswendaHR'.'Personal_Details'();

create table if not exists 'naswendaHR'.'Citizenship'();

create table if not exists 'naswendaHR'.'Work_Permit'();

create table if not exists 'naswendaHR'.'Qualifications'();

create table if not exists 'naswendaHR'.'Leave'();

create table if not exists 'naswendaHR'.'Memebership'();

create table if not exists 'naswendaHR'.'Next_of_Kin'();

create table if not exists 'naswendaHR'.'Bank_Details'();

create table if not exists 'naswendaHR'.'Worker'();
