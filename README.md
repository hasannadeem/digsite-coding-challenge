# Digsite - Coding Exercises

Implemented coding exercises in ruby alongwith testcases using minitest.

## Coding Exercise 1 (Bonus)

Provided two solutions. First one with using array manipulations. Second one with using hash. Results from benchmark-ips shows that the solution with hash was more time efficient, but it involves the usage of hash(extra space). On the other side, array manipulations solution involves the shortlisting of positive elements + sorting + uniq and it involves more time consumption.

## Built With

- Ruby v-2.6.0
- Minitest
- Benchmark-ips

## How to Run Test Suite

Test cases are written using `minitest`
Anyone who want to run it locally can use following process:

1. Extract the zip file.
2. Go to the `tests` directory i.e `cd DigsiteChallenge/tests`
3. To run all the test cases use this:
   - `bash driver.sh`
4. For running individual test cases for coding exercises, use this:
   - `ruby code1_test.rb`
