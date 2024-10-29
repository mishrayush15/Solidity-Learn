// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GlobalVariable {
    /* Global Variables are built-in variables that provide information 
    about the current state of the blockchain, the transaction, or the contract.
    */

    // msg.sender -> Stores the value of user's account address who calls the function
    // block.timestamp -> Stores the UNIX timestamp when the fucntion is called
    // block.number -> Stores the current block number
    // msg.value -> Stores the ETH value of a transaction sent by a user

    function gloabalVariable() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blocknumber = block.number;
        return (sender, timestamp, blocknumber);
    }
}