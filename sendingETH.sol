// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// There are 3 ways to send ETH from a contract
/*

--> 'transfer' - It is used when we want to revert back the transaction if failed (uses 2300 gas)
--> 'send' -  This is a bool that tells if the transaction went successful or failed, and it wont revert the transaction if failed, 
we need to use certain functions to handle failed transaction. Not considered safe (uses 2300 gas)
--> 'call' - This is used when we want to send ETH and call a function at the same time. No fixed gas amt like above, we can fix gas amount. 
It also checks if the transaction went successfull or failed using a bool (similar to send)

*/


// To be able to send ETH from a contract, the same contract must be able to receive ETH.
contract SendEther {

    constructor() payable {} // We can use this to make the contract receive ETH
    fallback() external payable {} // We can also use this to make the contract receive ETH
    receive() external payable {} // We can also use this to make the contract receive ETH

    // To make an address receive ETH we need to make sure to mark that address with 'payable' keyword, after this it's the addresses headache that it would receive the ETH or not.

    function sendViaTransfer(address payable _addr) external payable {
        // Syntax -> address.transfer(ETH Value)
        _addr.transfer(123); 
    }

    function sendViaSend(address payable _addr) external  payable {
        // Syntax -> bool varName = address.send(ETH Value)
        bool isSuccessful = _addr.send(123);
        require(isSuccessful, "Transaction failed!");
    }

    function senViaCall(address payable _addr) external payable {
        // Syntax -> (bool succesful, bytes memory data) = address.call{value: ETH Value, gas: gasleft(Gas Value)}("data to send along")
        (bool success, ) = _addr.call{value: 123}(""); // Note that we have ignored the data & gas, refer syntax
        require(success, "Transaction Failed!");
    }
}