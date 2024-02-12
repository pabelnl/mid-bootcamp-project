## Note: For the import, ask the students to create a csv file from the excel version , 
## and remove the headers from the excel file before attempting to import the data in the table created !!
create database if not exists credit_card_classification;
use credit_card_classification;
drop table if exists credit_card_data;
CREATE TABLE credit_card_data (
  `Customer Number` varchar(11) UNIQUE NOT NULL,
  `Offer Accepted` varchar(4) DEFAULT NULL,
  `Reward` varchar(20) DEFAULT NULL,
  `mailer_type` varchar(20) DEFAULT NULL,
  `income_level` varchar(20) DEFAULT NULL,
  `number_bank_accounts_open` int(5) DEFAULT NULL,
  `Overdraft_protection` varchar(11) DEFAULT NULL,
  `credit_rating` varchar(11) DEFAULT NULL,
  `credit_cards_held` int(11) DEFAULT NULL,
  `homes_owned` int(11) DEFAULT NULL,
  `household_size` int(11) DEFAULT NULL,
  `own_your_home` varchar(4) DEFAULT NULL,
  `average_balance` float DEFAULT NULL,
  `q1_balance` int(11) DEFAULT NULL,
  `q2_balance` int(11) DEFAULT NULL,
  `q3_balance` int(11) DEFAULT NULL,
  `q4_balance` int(11) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (`Customer Number`)  -- constraint keyword is optional but its a good practice
);
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
load data local infile '/Users/pabelnl/Development/IronHack/mid-bootcamp-project/sql/creditcardmarketing.csv'
into table credit_card_data
fields terminated BY ',';
select * from credit_card_data;