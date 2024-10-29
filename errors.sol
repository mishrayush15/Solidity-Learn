// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Errors {
    /* When an error is generated or thrown -> 
    1. Gas is refunded back
    2. State Variable changes are reverted back to it's revious state
    */

    // Custom errors can also be generated to save more GAS

    // require -> Use require to check if something is true; if it's false, the function stops and returns an error message.
    // revert -> Use revert to stop a function and undo changes when something goes wrong, optionally providing an error message.
    // assert -> Use assert to test for conditions that should always be true; if they’re not, it indicates a serious problem in the contract.

    function testRequire(uint num1) public pure {
        require (num1 <= 10, "num > 10"); // Throws an error statement if num is <= 10
        // code below require will only run when require holds a TRUE value
    }

    function testRevert(uint num2) public pure {
        if (num2 > 10) {
            revert("i is greater than 10"); // better option for if - else
        }
    }

    uint public myNum = 123;
    function testAssert() public view {
        assert(myNum == 123); 
    } 

    // Custom Error -> **can only be used with revert at the moment

    error MyError(address caller, uint num); // defining what the custom error will show and the parameters it will receive

    function customError(uint num3) public view {
        if (num3 > 10) {
            revert MyError(msg.sender, num3); // generating custom error
        }
    }


}