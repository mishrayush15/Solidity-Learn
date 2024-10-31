// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FallBack {

    // Fallback functions are those functions that executes when 
    // 1. The requried function doesn't exist inside the contract
    // 2. To directly receive ETH without without specifing a payable function


    event Log(string mode, address addr, uint value, bytes data); // creating a sample event to log which function is used




    fallback() external payable { 
        // When a user tries to call a function that doesn't exist then this fallback function will run
        // Mainly used to receive ETH (if added keyword 'payable')
        // **ONLY ONE FALLBACK FUCNTION IS ALLOWED PER CONTRACT

        emit Log("fallback", msg.sender, msg.value, msg.data); // sending data as fallback works when dat ais sent along the ETH
    }

    receive() external payable { 

        emit Log("receive", msg.sender, msg.value, ""); // sending empty data as receive works when no data is passed
    }
}


/*

      ETH is sent to contract
               |
        is msg.data empty?
             /   \
           yes   No
           /       \
receive() exists?  fallback()
         /    \
       yes    No
       /        \
   receive()   fallback()

*/ 

// fallback() --> can be used for both ETH receiving and fucntioning as a backup function **(data included)**
// receive() --> can only be used to receive ETH **(data not included)**