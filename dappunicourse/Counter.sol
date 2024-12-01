// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint count;

    constructor() public {
        count = 0;
    }
    
    function getCount() public view returns(uint){
        return count;
    }

    function incCount() public {
        count++;
    }
}