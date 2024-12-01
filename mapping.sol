// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Mappings {
    // Mapping is like dictionary or object in JS which have key : value pair

    /*
    Mapping can store multiple data but it only provides to access individual
    enteries in place of iterating over all the enteries.
    */
    mapping (address => uint) public balances; // address (key) => uint (value)
    mapping (address => mapping (address => bool)) public isFriendOfOtherAddress; // Nested mapping

    // Setting up key and value in mapping is only allowed in function
    function mappingExamples() public {

        // Syntex -> mappingName[key] = value;
        // Setting the value
        balances[msg.sender] = 123;
        // Gettin the value
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // Default value -> 0 as we have not yet set valye of address(1)

        // Updating the value
        balances[msg.sender] = 315; // Updates the value of address that corresponds too the msg.sender address

        // Clear value stored in a mapping for a key
        delete balances[msg.sender]; // Deletes the value stored in msg.sender
    }
}