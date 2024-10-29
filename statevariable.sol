// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StateVariable {

    // Data stored inside a state variable will be stored in blockchain permanently

    uint public myStateVariable = 1503; // the data inside "myStateVAriable" will be stored permanently on the blockchain

    function statevar() external pure {
        uint notStateVariable = 100; // this is a local variable that is not permanently stored in blockchain
                                    // this variable only exists when the funciton is called.
    }

    // State Variable -> Stores data in blockchain permanently & written outside a function
    // Local Variable -> Doesn't stores data in blockchain permanently & is written inside a function

    // If a function is updating a state variable then after the funstion stops execution then the value
    // set by the funciton will be stored as the new value of the state variable. But if the function consists
    // of local varibale then the value of each local variable will be set to it's oroginal value.
}