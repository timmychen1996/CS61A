.read fa16data.sql
.read sp17data.sql

CREATE TABLE obedience AS
  select seven, hilfinger from students; 

CREATE TABLE smallest_int AS
  select time,smallest from students where smallest>16 order by smallest limit 20;

CREATE TABLE greatstudents AS
  select a.date,a.color,a.pet,a.number,b.number from students as a, fa16students as b where a.date=b.date and a.color=b.color and a.pet=b.pet;

CREATE TABLE sevens AS
  select a.seven  from students as a, checkboxes as b where a.number=7 and b.'7'='True' and a.time=b.time;

CREATE TABLE matchmaker AS
  select a.pet, a.song , a.color,b.color from students as a, students as b where a.pet=b.pet and a.song=b.song and a.time<b.time ;
