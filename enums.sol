// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Enums {
    // Enums are a way to define a list of fixed options or states a variable can have.

    enum Status {
        None,
        Pending,
        Shipped,
        InTransit,
        Rejected,
        Delivered
    }

    Status public statusOfProduct; // defining that statusOfProduct will have any of the status value

    struct Order {
        address buyer;
        Status status; // We can also use enum inside a struct
    }

    Order[] public orders;

    // Getting the value of the status in statusOfProduct
    function getStatus() public view returns (Status){
        return statusOfProduct;
    }

    // Pass the enum's index number as the input in this function
    function setStatus(Status _status) public {
        statusOfProduct = _status;
    }

    // Setting the value to a particular status
    function setStatusToShipped() public {
        statusOfProduct = Status.Shipped;
    }

    // Sets the value of statusOfProduct to the default value
    function resetStatus() public {
        delete statusOfProduct; 
        // Default value of Enums -> 1st value of enum that is defines (in this case -> None)
    }

}