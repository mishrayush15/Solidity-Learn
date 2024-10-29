// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    // Public will make the State Variable accesssible by everyone
    uint public count;

    function increment() external {
        count++;
    }

    function decrement() external {
        count--;
    }
}