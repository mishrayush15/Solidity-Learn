// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Payable {

    // The 'payable' keyword is used to allow a function or an address to 
    // recieve ETH (ether)

    address payable public owner; // Creating this variable in such a way that any address in this variable can receive ETH

    constructor() {
        owner = payable(msg.sender); // As the msg.sender is a address wehreas owner is a payable address hence we need to case the msg.send to a payable address
    }
     
    function depositETH() external payable {
        // This function transfers the ETH to the contract's balance
    }

    function getBalance() external view returns(uint) {
        return address(this).balance; // This 'this' keyword is used to refer the current contract & the .balance method is used to get the balance of any address
        // Here we are referring to the balance of the contract
    }

    function getOwnersBalance() external view returns (uint) {
        return address(owner).balance;
    }
}

/*

Whenever a user calls the functions depositETH, the ETH sent is first stored in the balance of the contract.
After which we use different function to withdraw that ETH to the user's address. Hence in the above code no 
ETH was transferred to the owner's address and the withdraw function is targetting the balance of contract.

User calls depositETH() with ETH value
            |
            |
            |
ETH is deposited to the contract's address
            |
            |
            |
Withdraw function is used to withdraw ETH



Example of withdraw function -->

** 
function withdraw() external {
    require(msg.sender == owner, "Not owner"); // Only the owner can withdraw
    owner.transfer(address(this).balance); // Send the entire contract balance to the owner
} 
**

*/