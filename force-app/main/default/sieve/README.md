# Sieve

Use the Sieve of Eratosthenes to find all the primes from 2 up to a given
number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
prime numbers up to any given limit. It does so by iteratively marking as
composite (i.e. not prime) the multiples of each prime, starting with the
multiples of 2. It does not use any division or remainder operation.

Create a list starting at two and continuing up to and including the given limit.
The algorithm then consists of repeating the following steps over and over:

- Take the next available unmarked number in your list (it is prime).
- Mark all the multiples of that number (they are not prime).

Repeat until you have processed each number in your list.

When the algorithm terminates, all the numbers in the list that have not
been marked are prime.

The Wikipedia article has a useful graphic that explains the algorithm:
[http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes](http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)

Notice that this is a very specific algorithm, and the tests don't check
that you've implemented the algorithm, only that you've come up with the
correct list of primes. A good first test is to check that you do not
write any code that checks whether a number is a prime or not.

