// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Contructors {
    // Constructors are called only once when the Contract is deployed
    // Mainly used to initialize state variables

    address public owner;
    uint public x;
    constructor(uint _x) { // The value of _x will be entered at the time of deployment
        owner = msg.sender;
        x = _x;
    } 
}