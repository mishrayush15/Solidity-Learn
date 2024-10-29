// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract IfElseStatement {
    // Similar to JavaScript

    function ifElse(uint num) public pure returns (uint) {
        if(num > 10 && num < 20) {
            return 1;
        } else if (num > 20 && num <30) {
            return 2;
        } else { 
            return 3;
        }
    }

    function ternaryOperator(uint x) public pure returns (uint) {
        return x < 10 ? 1 : 2; // Ternary Operator -> Used when only one if - else is there
    }
}