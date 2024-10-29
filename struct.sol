// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Structs {
    
    // Similar to interfaces in TS. It let's you group similar kind of data
    // and provide structure to different stuff

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car; // State variable of a pre-defined structure (struct)
    Car[] public cars; // Array of Car type, hence every data should meet the structure of Car struct
    mapping(address => Car[]) public carsByOwner; // Every address will have a Array of cars that will store n number of cars for each address

    function exmapleStruct() public {
        // Syntax -> StructName (Declaring) varName = StructName(Initialising) (Values)
        Car memory toyota =  Car("Toyota", 1990, msg.sender); // Memory is used for complex data structures like Array, Structs etc... **passing the value to toyota variable that follows Car struct**
        Car memory audi = Car({
            model: "Audi A1",
            year: 1980,
            owner: msg.sender
        
        }); // Passing value in a more safer way to the variable that follows Car struct
        
        Car memory tesla; // This will hold all the default value of the datatypes given in struct
        tesla.model = "Tesla T1x3";
        tesla.owner = msg.sender;
        tesla.year = 2024;

        cars.push(toyota);
        cars.push(audi);
        cars.push(tesla);

        cars.push(Car({model: "Suzuki", owner: msg.sender, year: 1970})); // Storing values directly into array

        // Accessing values from the array cars
        Car memory _car1 = cars[0]; // Accessing by index from the array
        _car1.model;
        _car1.owner;
        _car1.year; // Accessing particular data of a given entry

        // Before modifing any data in the array of a array which is made on struct, make sure to change the memory to storage as in memory the changes will revert basck when the function stops executing.
        Car storage _car2 = cars[1];
        _car2.year = 1010;
        delete _car2.owner; // This will reset the value to it's original default value
        delete cars[1]; // This will delete all the data of the struc stored on index 2 in cars array to it's default value
        
    
    }
}