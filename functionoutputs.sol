// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FunctionOutputs {

    // Functions can return multiple outputs
    function returnMany() public pure returns (uint, bool, int){
        return (10, true, -10);
    }

    // Functions can return named output that is if name is given to the return
    // then without writing the return statement we can directly assign values to
    // that return names

    // This also saves GAS
    function namedOutput() public pure returns(uint u, bool b){
        u = 10;
        b = false;
    }   

    // Destructuirng Assignment ->
    // This is more like accepting multiple return from a function in another function 
    // and storing those values inside mulitple variables in sinlge line
    function destrutruingAssignment() public pure {
        (uint u, bool b, int i) = returnMany();
        (, , int _i) = returnMany(); // If you dont want to capture certain values, then remove names
                                   // and data types of those values but keep the commas.
    }
}