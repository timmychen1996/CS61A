create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
  select name, size from dogs,sizes where height>min and height<=max;

-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  select distinct b.child from dogs as a, parents as b where a.name=b.parent order by -a.height;

-- Sentences about siblings that are the same size
create table sentences as
  with sib(first,second) as (
        select a.child, b.child from parents as a ,parents as b where a.parent = b.parent and a.child < b.child  
      )

  select  first || ' and ' || second || ' are ' || a.size || ' siblings' from sib, size_of_dogs as a, size_of_dogs as b where a.size=b.size and first=b.name and second=a.name;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
  with current_dog(dogname,number,previous_height,total_height) as (
      select name,
             1,
             height,
             height 
             from dogs union 
      select dogname|| ', '|| name,
             number+1,
             height,
             total_height+height
             from dogs,current_dog
        where number<4 and
              dogs.name != current_dog.dogname and
              dogs.height > current_dog.previous_height
  )
  select dogname,total_height from current_dog where number=4 and total_height>170 order by total_height;

-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
create table non_parents as
  select "REPLACE THIS LINE WITH YOUR SOLUTION";

create table ints as
    with i(n) as (
        select 1 union
        select n+1 from i limit 100
    )
    select n from i;

create table divisors as
    select num.n as n , count(*) as counts from ints as num ,ints as divisor where num.n % divisor.n =0 group by num.n;

create table primes as
    select n from divisors where counts=2;
