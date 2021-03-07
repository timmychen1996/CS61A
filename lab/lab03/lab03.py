from utils import *

# Q1
from math import sqrt
def distance(city1, city2):
    """
    >>> city1 = make_city('city1', 0, 1)
    >>> city2 = make_city('city2', 0, 2)
    >>> distance(city1, city2)
    1.0
    >>> city3 = make_city('city3', 6.5, 12)
    >>> city4 = make_city('city4', 2.5, 15)
    >>> distance(city3, city4)
    5.0
    """
    x1,y1=get_lat(city1),get_lon(city1)
    x2,y2=get_lat(city2),get_lon(city2)
    distance_between_two_city=sqrt((x1-x2)**2+(y1-y2)**2)
    return distance_between_two_city

# Q2
def closer_city(lat, lon, city1, city2):
    """
    Returns the name of either city1 or city2, whichever is closest to
    coordinate (lat, lon).

    >>> berkeley = make_city('Berkeley', 37.87, 112.26)
    >>> stanford = make_city('Stanford', 34.05, 118.25)
    >>> closer_city(38.33, 121.44, berkeley, stanford)
    'Stanford'
    >>> bucharest = make_city('Bucharest', 44.43, 26.10)
    >>> vienna = make_city('Vienna', 48.20, 16.37)
    >>> closer_city(41.29, 174.78, bucharest, vienna)
    'Bucharest'
    """
    x1,y1=get_lat(city1),get_lon(city1)
    x2,y2=get_lat(city2),get_lon(city2)
    city1_distance=sqrt((x1-lat)**2+(y1-lon)**2)
    city2_distance=sqrt((x2-lat)**2+(y2-lon)**2)
    if (city1_distance<city2_distance):
        return get_name(city1)
    else:
        return get_name(city2)

# Q3
def ab_plus_c(a, b, c):
    """Computes a * b + c.

    >>> ab_plus_c(2, 4, 3)  # 2 * 4 + 3
    11
    >>> ab_plus_c(0, 3, 2)  # 0 * 3 + 2
    2
    >>> ab_plus_c(3, 0, 2)  # 3 * 0 + 2
    2
    """
    def a_plus_b(a,b):
        if a==0:
            return 0
        if a==1:
            return b
        if a>0:
            return b+a_plus_b(a-1,b)

    if a==0:
        return c
    if a>0:
        return a_plus_b(a,b)+c

# Q4
def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """ 
    k=2
    def new_function(k):
        if n==k:
            return True
        if n%k==0:
            return False   
        return new_function(k+1)
    if n==2:
        return True
    if new_function(k)==True:
        return True 
    else:
        return False

    






         
    

