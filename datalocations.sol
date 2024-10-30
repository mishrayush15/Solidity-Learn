// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// When we use a dynamic data type as a variable, we need to declare it's data location
// Data location -> storage, memeory, calldata
// storage -> permanent area where state variable are stored
// memory -> temorary place to hold data during execution of a function
// calldata -> read-only area where function inputs are stored when you call an external function

contract DataLocations {
    
    struct MyStruct {
        uint data;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example() public {
        myStructs[msg.sender] = MyStruct({data : 315, text : "hello"});

        // When we need to update a struct we use storage
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "world"; // This change will save after the execution of the funciton as it is in storage

        // When we need to view/ready the data from a struct we use memory
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.data = 123; // This change will not be saved after execution of the function as it is in memory

    }
}