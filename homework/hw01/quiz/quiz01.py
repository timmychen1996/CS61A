def multiple(a, b):
    """Return the smallest number n that is a multiple of both a and b.

    >>> multiple(3, 4)
    12
    >>> multiple(14, 21)
    42
    """
    "*** YOUR CODE HERE ***"
    z = a
    while True:
        if z % a == 0 and z % b == 0:
            f = z
            break
        z += 1
    print(f)

def unique_digits(n):
    """Return the number of unique digits in positive integer n

    >>> unique_digits(8675309) # All are unique
    7
    >>> unique_digits(1313131) # 1 and 3
    2
    >>> unique_digits(13173131) # 1, 3, and 7
    3
    >>> unique_digits(10000) # 0 and 1
    2
    >>> unique_digits(101) # 0 and 1
    2
    >>> unique_digits(10) # 0 and 1
    2
    """
    "*** YOUR CODE HERE ***"

    def has_digit(n, k):
        
        while (n >= 1):
            if int(n % 10) == k:
                return 1
                break
            n = n // 10

    count = 0
    for i in range(0, 10):
        if has_digit(n, i) == 1:
            count += 1
    print(count)
