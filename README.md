# The issue

> Write a program in Ruby that takes one command line argument (referred to going forward as n).
> If n is not a perfect square print an appropriate error message and exit. If n is a perfect
> square then create a sequence from 1 to  n and build a matrix from the sequence by walking
> in counter-clockwise spiral order. Examples below illustrate this for n=1,4,9,16 but your
> solution should work for any n that is a perfect square. Once you have built the matrix print
> it, ensuring even column widths as in examples below and then exit.
> 
>       Input:  1
>       Output: 1
> 
>       Input:  4
>       Output: 4 3
>                 1 2
> 
>       Input:  9
>       Output: 5 4 3
>               6 1 2
>               7 8 9
> 
>       Input:  16
>       Output: 16 15 14 13
>               5  4  3  12
>               6  1  2  11
>               7  8  9  10
  
# Output

    > echo 1 | ./test.rb
    What is you square?
    Input:  1
    Output: 1

    > echo 2 | ./test.rb
    What is you square?
    ./test.rb:30:in `initialize': 2 (RuntimeError)
     is not perfect square
            from ./test.rb:101:in `new'
            from ./test.rb:101:in `<main>'

    > echo 4 | ./test.rb
    What is you square?
    Input:  4
    Output: 4 3
            1 2

    > echo 9 | ./test.rb
    What is you square?
    Input:  9
    Output: 5 4 3
            6 1 2
            7 8 9

    > echo 16 | ./test.rb
    What is you square?
    Input:  16
    Output: 16 15 14 13
            5  4  3  12
            6  1  2  11
            7  8  9  10

    > echo 25 | ./test.rb
    What is you square?
    Input:  25
    Output: 17 16 15 14 13
            18 5  4  3  12
            19 6  1  2  11
            20 7  8  9  10
            21 22 23 24 25
