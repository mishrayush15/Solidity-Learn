// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// We will use one contract (termed as Factory Contract) that can automatically
// deploy multiple other contracts.


contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Not Owner");
        owner = _owner;
    }
}



contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    // Payable allows a contructor or a function to receive ETH
    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}



contract DeployMultipleContracts {

    function factory(bytes memory _contractCode) public payable returns (address addr) {
        // To deploy any contract we use the keyword "assembly"
        // Assembly -> create(v, p, n)
        // v -> amount of ETH to send to the contract we are deploying
        // p -> pointer in memory to start of the contractCode
        // n -> size of contractCode

        // --> inside the _contractCode, the actual code start after first 32 bytes
        // --> inside the _contractCode, the first 32 byte stores the size 

        // We can also use let (only restricted to Assembly) and we use := in place of =

        assembly {
            let v = callvalue();
            let p = add(_contractCode, 0x20);
            let n = mload(_contractCode);
            addr := create(v, p, n);
        }

        // callvalue() -> retrieves the amount of ETH sent with the current call.
        // add -> This uses the 'add' function to calculate the memory address of the actual contract code.
        // mload -> mload loads 32 bytes from the memory location specified by _contractCode, which tells the create function how much code to deploy.

        // Checking if the 'addr' hold a 0 address as it reflects that there was an error creating the requested contract
        require(addr != address(0), "Deployement Failed!"); // address(0) indicates a 0 address

        // Emit is used to emit msgs or logs with the name given after it having the values that is to be shown inside bracets;
        emit Deploy(addr)
    }
}