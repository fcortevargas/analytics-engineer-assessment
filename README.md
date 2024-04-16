# analytics engineer assessment

## Data

For the first two questions you are provided with some data from our platform. This data is in the data folder in this repo. To answer the sql questions you can either load the data into a local mysql database using the python notebook called `load_data.ipynb` or you can just write the sql without testing it based on inspecting the data using a csv viewer. Either is fine.

## Assignment

You are tasked with the following assignment:

1. Looking at these three tables from our database. How would you propose modelling this for analytics purposes?
2. Write sql statements to answer the following questions about the data:
    - What is the percentage of ads from a Hungarian event location?
    - What is the average original price of events in the Netherlands?
    - What was the number of sold listings for Pixies concerts?
3. Rewrite the following sql query:
```
select 
	a.id,

    adt.id,
	ev.event_end,
	adt.counter,
	sum(case when ev.is_expired then 1 else False end)
from website.ad a
LEFT JOIN (select *   from website.event ev where is_verified order by created_at) ev on a.event_id = ev.id
left inner join (select ad_id, count(*) as counter from website.ad_ticket group by 1) adt on a.id = adt.ad_id
where a.source not in ('web-mobile', 'web', NULL)
group by 1,2,3,4,5
```
4. The Product Manager for the buy flow team wants to introduce a new ‘one click checkout’ where a buyer can buy a ticket in one click if they have already saved their payment details. How would you help the Product Manager to launch this feature & how would you measure success?

## Submission

Please create sql files for the answers to questions 2 and 3. For the answer to question 1 and 4 a text file will suffice.
After finishing the assignment please submit your files to a fork of this repository and commit them. You can then send the link to the forked repository to ginger@ticketswap.com and tobias.cadee@ticketswap.com

## Contact Information

If you have any questions or need further clarification regarding the assignment, please feel free to contact us at tobias.cadee@ticketswap.com and ginger@ticketswap.com
