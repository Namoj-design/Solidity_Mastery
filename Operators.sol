// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract OperationsDemo {
    uint public a = 10;
    uint public b = 20;
    bool public flag = true;

    // Arithmetic operations
    function arithmeticOps() public view returns (uint add, uint sub, uint mul, uint div, uint mod) {
        add = a + b;
        sub = b - a;
        mul = a * b;
        div = b / a;
        mod = b % a;
    }

    // Comparison operations
    function comparisonOps() public view returns (bool, bool, bool, bool, bool, bool) {
        return (
            a == b,
            a != b,
            a < b,
            a > b,
            a <= b,
            a >= b
        );
    }

    // Logical operations
    function logicalOps(bool x, bool y) public pure returns (bool andOp, bool orOp, bool notOp) {
        andOp = x && y;
        orOp = x || y;
        notOp = !x;
    }

    // Decision making: if-else
    function checkEven(uint num) public pure returns (string memory) {
        if (num % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }

    // Decision making: ternary operator
    function checkPositive(int num) public pure returns (string memory) {
        return num >= 0 ? "Positive" : "Negative";
    }

    // Loops: for loop (sum of numbers from 1 to n)
    function sumNumbers(uint n) public pure returns (uint) {
        uint sum = 0;
        for (uint i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    }

    // While loop
    function factorial(uint n) public pure returns (uint) {
        uint result = 1;
        while (n > 0) {
            result *= n;
            n--;
        }
        return result;
    }

    // Do-while style (simulated, since Solidity has no do-while)
    function decrement(uint n) public pure returns (uint) {
        uint count = 0;
        do {
            count++;
            n--;
        } while (n > 0);
        return count;
    }
}