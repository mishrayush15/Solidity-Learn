// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Loops {

    // continue -> skips current iteration if a condition is met
    // break -> get's out of the loop and stops it if a condition is met

    function loops() public pure {
        for (uint i = 0; i < 10; i++){
            //code 
        }

        while (/*Condition Here, eg -> */ true) {
            //code
        }
    }
}