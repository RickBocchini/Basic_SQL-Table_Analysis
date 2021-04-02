select * from cd.facilities;

select name,membercost from cd.facilities;

select name from cd.facilities
where membercost > 0;

select facid, name, membercost, monthlymaintenance from cd.facilities
where membercost < monthlymaintenance/50 and 
membercost > 0;

select name from cd.facilities
where name like('%Tennis%');

select * from cd.facilities
where facid in (1,5);

select memid, firstname, surname, joindate from cd.members
where joindate >= '2012-09-01';

select distinct(surname) from cd.members
order by surname asc
limit 10;

select joindate from cd.members
order by joindate desc
limit 1;

select count(*) from cd.facilities
where guestcost >= 10;

select facid,sum(slots) from cd.bookings
where starttime between '2012-09-01' and '2012-10-01'
group by facid
order by sum(slots) asc;

select facid, sum(slots) as total_slots from cd.bookings
group by facid
having sum(slots) > 1000
order by facid asc;

select cd.facilities.name as facility, cd.bookings.starttime as booking_time
from cd.facilities inner join cd.bookings
on cd.facilities.facid = cd.bookings.facid
where cd.facilities.name like ('%Tennis Court%') and
cd.bookings.starttime >= '2012-09-21' and
cd.bookings.starttime <= '2012-09-22'
order by cd.bookings.starttime asc;

select cd.bookings.starttime from cd.bookings
inner join cd.members
on cd.bookings.memid = cd.members.memid
where cd.members.firstname || ' ' || cd.members.surname = 'David Farrell'
order by cd.bookings.starttime asc