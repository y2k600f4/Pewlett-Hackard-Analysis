#Pewlett Hackard Analysis

##Overview

Pewlett Hackard is a large company with several thousand employees, and it's been around for a long time. As baby boomers begin to retire at a rapid rate, Pewlett Hackard is looking toward the future in two ways. First, it's offering a retirement package for those who meet certain criteria. Second, it's starting to think about which positions will need to be filled in the near future.

Using SQL the task was to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. By building an
employee database with SQL and applying data modeling, engineering, and analysis skills to peform employee research it can be determine who will be retiring in the next few years and how many positions will Pewlett Hackard need to fill.

###Employee Database ERD (Entity Relationship Diagram)

The provided data files include: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv

An ERD was developed using Quick Database Diagrams (https://www.quickdatabasediagrams.com/) to show the flow from the above files, highlighting Primary Keys,Foreign Keys and Data Types for each column for each of the (6) csv files provided. The flow is then referenced when utilizing SQL to perform the analyis tasks. Below is the ERD generated for this project:

![EmployeeDB](https://github.com/y2k600f4/Pewlett-Hackard-Analysis/blob/main/EmployeeDB.png)

##Results

-The employees.csv shows 300,024 total number of employees at Pewlett Hackard. A Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955 was generated (retirement_titles.csv). Due to some employees having multiple titles due to promotions to new postions a new table was generated to only include the most recent title for each employee in the targeted retirement range of birth dates between 1952 to 1955. This table (unique_titles.csv) shows that 72,458 employees are likely to soon retire or 24.2% number of total employees.

-The retiring_titles table was generated to show the number of employees by their most recent job title who are about to retire. Below shows a breakdown of the 72,458 employees that are expected to retire soon. The largest majority are Senior engineers (35.8%) followed by Senor Staff (34.4%). These top two titles account for over 70% of the likely upcoming retireees. The total number of potential retirees per job title can be seen below.


![retiring_titles_table](https://github.com/y2k600f4/Pewlett-Hackard-Analysis/blob/main/retiring_titles_table.png)

-Additional analysis on the above table shows only 2 managers are potentially retiring. This represents a very small portion of the 300,024 total employees. 

-A mentorship elegibilty table was generated targeting birth dates between January 1, 1965 and December 31, 1965. The result was a total of 1,549 employees that are eligible to participate in this program. 


##Summary

###How many roles will need to be filled as the "silver tsunami" begins to make an impact?

It is expected that 72,458 employees will possibly soon retire. The number of roles that will need to be filled will be dependent on how many employees actually retire (accept retirement package) or decide to remain employeed and retire in the upcoming years. This most likely will be distributed across several years, necessitating a hiring plan to backfill these empty positions over these years.


###Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Based on 72,458 employees that are soon to be retire that are the companies mentors and 1,549 of the employees are elegible for mentorship (~.02%) or ~1/50 mentor to mentee ratio. The availabilty of potentially 50 mentors for each mentee should be sufficient to train up the next group of employees to replace the expertise of those about to retire.


###Two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

-One additional table to provide more insight to the upcoming "silver tsunami" is to incorporate the departent_no/department_name from the departments.csv when generating both the retirement_titles and unique_titles tables to provide more insight on the department breakdowns of the upcoming retirees.

-One additional query that can provide more insight is to vary the target birth date range (currently 1952 to 1955) to target specific age ranges to better give insight on potential retirees for each specific year.









