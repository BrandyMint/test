danil@office:~/code/test$ echo 1 | ./test.rb
What is you square?
Input:  1
Output: 1

danil@office:~/code/test$ echo 2 | ./test.rb
What is you square?
./test.rb:30:in `initialize': 2 (RuntimeError)
 is not perfect square
        from ./test.rb:101:in `new'
        from ./test.rb:101:in `<main>'

danil@office:~/code/test$ echo 4 | ./test.rb
What is you square?
Input:  4
Output: 4 3
        1 2

danil@office:~/code/test$ echo 9 | ./test.rb
What is you square?
Input:  9
Output: 5 4 3
        6 1 2
        7 8 9

danil@office:~/code/test$ echo 16 | ./test.rb
What is you square?
Input:  16
Output: 16 15 14 13
        5  4  3  12
        6  1  2  11
        7  8  9  10

danil@office:~/code/test$ echo 25 | ./test.rb
What is you square?
Input:  25
Output: 17 16 15 14 13
        18 5  4  3  12
        19 6  1  2  11
        20 7  8  9  10
        21 22 23 24 25
