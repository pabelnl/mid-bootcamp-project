# Select all the data from table credit_card_data to check if the data was imported correctly.
select * from credit_card_data;

# Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. 
alter table credit_card_data
drop column q4_balance;

# Select all the data from the table to verify if the command worked. Limit your returned results to 10.
select *
from credit_card_data
limit 10;

# Use sql query to find how many rows of data you have.
select count(*) as total_rows
from credit_card_data;

# Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column Offer_accepted?
select distinct(`Offer Accepted`)
from credit_card_data;
-- What are the unique values in the column Reward?
select distinct(Reward)
from credit_card_data;
-- What are the unique values in the column mailer_type?
select distinct(mailer_type)
from credit_card_data;
-- What are the unique values in the column credit_cards_held?
select distinct(credit_cards_held)
from credit_card_data;
-- What are the unique values in the column household_size?
select distinct(household_size)
from credit_card_data;

# Arrange the data in a decreasing order by the average_balance of the house. 
# Return only the customer_number of the top 10 customers with the highest average_balances in your data.
select `Customer Number`
from credit_card_data
order by average_balance desc
limit 10;

# What is the average balance of all the customers in your data?
select truncate(avg(average_balance), 2) as all_customer_avg_balance
from credit_card_data;

# In this exercise we will use group by to check the properties of some of the categorical variables in our data. 
# Note wherever average_balance is asked in the questions below, please take the average of the column average_balance:

-- What is the average balance of the customers grouped by Income Level? The returned result should have only two columns, 
-- income level and Average balance of the customers. Use an alias to change the name of the second column.
select income_level, truncate(avg(average_balance), 2) as customers_avg_balance
from credit_card_data
group by 1;

-- What is the average balance of the customers grouped by number_of_bank_accounts_open? The returned result should have only two columns, 
-- number_of_bank_accounts_open and Average balance of the customers. Use an alias to change the name of the second column.
select number_bank_accounts_open, truncate(avg(average_balance), 2) as customers_avg_balance
from credit_card_data
group by 1;

-- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, 
-- rating and average number of credit cards held. Use an alias to change the name of the second column.
select credit_rating, truncate(avg(credit_cards_held), 2) as avg_credit_cards_held
from credit_card_data
group by 1;

-- Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? 
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables. You might also have to check the number of customers in each category (ie number of credit cards held) to assess if that category is well represented in the dataset to include it in your analysis. For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis
select credit_cards_held, avg(number_bank_accounts_open) as avg_accounts
from credit_card_data
group by credit_cards_held
order by credit_cards_held;
# Little to no correlation

# Your managers are only interested in the customers with the following properties:
-- Credit rating medium or high
-- Credit cards held 2 or less
-- Owns their own home
-- Household size 3 or more
## For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them? 
## Can you filter the customers who accepted the offers here?
select *
from credit_card_data
where credit_rating in ("Medium","High")
and credit_cards_held <= 2
and own_your_home = "Yes"
and household_size >= 3
and `Offer Accepted` = "Yes";


# Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. 
# Write a query to show them the list of such customers. You might need to use a subquery for this problem.
select `Customer Number`, average_balance
from credit_card_data
where average_balance < (
select truncate(avg(average_balance), 2) as customers_avg_balance 
from credit_card_data
)
order by 2 desc;

# Since this is something that the senior management is regularly interested in, create a view called Customers__Balance_View1 of the same query.
create view Customers__Balance_View1 as 
select `Customer Number`, average_balance
from credit_card_data
where average_balance < (
select truncate(avg(average_balance), 2) as customers_avg_balance 
from credit_card_data
)
order by 2 desc;
select * from customers__balance_view1;

# What is the number of people who accepted the offer vs number of people who did not?
select `Offer Accepted`, count(`Customer Number`) as total_accepted
from credit_card_data
group by 1;

# Your managers are more interested in customers with a credit rating of high or medium. 
# What is the difference in average balances of the customers with high credit card rating and low credit card rating?
select credit_rating , truncate(avg(average_balance), 2)
from credit_card_data
where credit_rating in ("Medium","High")
group by 1;

# In the database, which all types of communication (mailer_type) were used and with how many customers? 17976
select mailer_type, count(*) as customers_count
from credit_card_data
group by 1;


# Provide the details of the customer that is the 11th least Q1_balance in your database.
select `Customer Number`, q1_balance
from credit_card_data
order by 2 asc
limit 10, 1



