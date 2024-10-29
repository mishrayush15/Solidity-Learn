// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


contract Funcions {

    // Functions starts with the keyword "function" with it's name 
    // that included parameters(optional) and the the access modifier 
    // after that the view type(pure, view etc...) with "returns" keyword and 
    // it's return type
    // pure -> does not read or modify any data in blockchain
    // view -> reads blockchain data but doesn't modify it
    // payable -> can receieve ether (ETH)
    // no keyword -> reads blockchain data and modifies it

    // public -> Anyone can access it, both inside and outside the contract.
    // private -> Only this contract can access it; no one else can see it, not even derived contracts.
    // internal -> Only this contract and contracts that inherit from it can access it.
    // external -> Can be accessed only from outside the contract, not from within the same contract directly.

    function addTwoNumbers(uint num1, uint num2) public pure returns (uint){
        return  num1 + num2;
    }

    function subTwoNumbers(uint num1, uint num2) public pure returns (uint){
        return num1 - num2;
    }
}