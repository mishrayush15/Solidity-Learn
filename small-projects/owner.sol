// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Ownable {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not the owner!");
        _;
    }
    
    function setNewOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    // Add more function with multiple check
}