-- https://www.kaggle.com/datasets/whenamancodes/violence-against-women-girls

select * from dbo.Violence 
delete from dbo.Violence where value is null

--1. How many women and men participated in the survey?
select v.gender ,count(v.gender) count  from dbo.Violence v
group by v.gender

--2. Number of countries that participated in the survey
select count(distinct v.Country)
from dbo.Violence v

--3. In each country, what is the strongest action that justifies violence (According to the results)
with ranked as
(select v.country ,v.question,sum(v.value) value ,rank () over (partition by  v.country order by sum(v.value)desc) as rank
from dbo.Violence v 
group by v.country,v.question)

select r.country,r.question,r.value from ranked r  where r.rank=1
order by r.value desc
--Because all the countries were ranked top 1 Cause "... for at least one specific reason" i choose rank=2

with ranked as
(select v.country ,v.question,sum(v.value) value ,rank () over (partition by  v.country order by sum(v.value)desc) as rank
from dbo.Violence v 
group by v.country,v.question)

select r.country,r.Question,r.value from ranked r  where r.rank=2
order by r.value desc


--4. According to the survey participants, what is the most common action of a woman that justifies violence towards her?
with ranked as
(select v.country ,v.question,sum(v.value) value ,rank () over (partition by  v.country order by sum(v.value)desc) as rank
from dbo.Violence v 
group by v.country,v.question)

,questions as(select r.country,r.question,r.value from ranked r  where r.rank=2)

select q.question,count(q.question) 
as number_of_countries_that_reported_this_reason_as_the_strongest_reason_for_beating_a_woman
from questions q
group by q.question
order by 2 desc

--5 What is the age range that most justifies violence?
with age as
(select v.[Demographics Question],v.[Demographics Response],
sum(v.value) over (partition by v.[Demographics Question]) Qvalue_ans,
sum(v.value) over (partition by v.[Demographics Response]) Justified_violence_rate
from dbo.Violence v 
where v.[Demographics Question]= 'Age')

select distinct [Demographics Response] age_range ,Justified_violence_rate
from age
order by Justified_violence_rate desc

--6. Display Justified violence rate by Education status
with Education as
(select v.[Demographics Question],v.[Demographics Response],
sum(v.value) over (partition by v.[Demographics Question]) Qvalue_ans,
sum(v.value) over (partition by v.[Demographics Response]) Justified_violence_rate
from dbo.Violence v 
where v.[Demographics Question]= 'Education')

select distinct [Demographics Response] as level_of_Education,Justified_violence_rate
from Education
order by Justified_violence_rate desc

--7 Display Justified violence rate by Employment status
with Employment as
(select v.[Demographics Question],v.[Demographics Response],
sum(v.value) over (partition by v.[Demographics Question]) Qvalue_ans,
sum(v.value) over (partition by v.[Demographics Response]) Justified_violence_rate
from dbo.Violence v 
where v.[Demographics Question]= 'Employment')

select distinct [Demographics Response] as Type_of_Employment,Justified_violence_rate
from Employment
order by Justified_violence_rate desc

--8 Display Justified violence rate by Marital status
with Marital_status as
(select v.[Demographics Question],v.[Demographics Response],
sum(v.value) over (partition by v.[Demographics Question]) Qvalue_ans,
sum(v.value) over (partition by v.[Demographics Response]) Justified_violence_rate
from dbo.Violence v 
where v.[Demographics Question]= 'Marital status')

select distinct [Demographics Response] as Marital_status,Justified_violence_rate
from Marital_status
order by Justified_violence_rate desc

--9. Display Justified violence rate by residential area
with Residence as
(select v.[Demographics Question],v.[Demographics Response],
sum(v.value) over (partition by v.[Demographics Question]) Qvalue_ans,
sum(v.value) over (partition by v.[Demographics Response]) Justified_violence_rate
from dbo.Violence v 
where v.[Demographics Question]= 'Residence')

select distinct [Demographics Response] as residential,Justified_violence_rate
from Residence
order by Justified_violence_rate desc

--10. What are the Top 5 countries with the highest justification rate for violence against women for any reason?
select Top 5 v.country,sum(v.value) justified_violence from dbo.Violence v 
group by v.country
order by sum(v.value) desc

--11. Each year, presents the percentage of justification for violence against women, divided by gender and by action
with data as(select year(v.[Survey Year]) as year,v.question,v.gender,
sum(v.value) over (partition by v.Question) justified_violence_rate_by_gender_and_question,
sum(v.value) over (partition by v.gender) justified_violence_rate
from dbo.Violence v )

select distinct d.year,d.question action ,d.gender,round(d.justified_violence_rate_by_gender_and_question,2) as justified_violence_rate
from data d
order by d.year, d.gender



