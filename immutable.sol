// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ImmutableVariable {

    // 'immutable' keyword is used to initialise a variable such that the variable can 
    // only be set once and then the data inside the variable will never change.

    address public immutable owner = msg.sender; // uses less gas 

    // Constants -> The value must be set at the time of declaration and cannot be changed after that. 
    // It’s for values that are fixed and known at compile-time.
}