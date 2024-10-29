// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DataTypes {
    // There are basically 2 types of Data types ->
    // 1. Values -> They are basic data type that stores values
    // 2. References -> They don't store value but stores where the value is stored

    bool public isMiner = true;
    uint public accETH = 10; // uint stores all positive numbers
    int public age = -1; // int stores both negative and positive numbers
    address public myAddr = 0x1a2b3C4d5e6F7A8B9c0D1e2f3A4B5c6d7e8F9A0B; // address of user account mainly
    string public userName = "ayush"; // sentences, characters, etc...
}