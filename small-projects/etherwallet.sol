// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EtherWallet {

    address public owner;

    constructor() {
        owner = (msg.sender);
    }

    fallback() external payable { }
    receive() external payable { }


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setETHviaCall(address payable _addr, uint ETH) external {
        require(owner == msg.sender, "Invalid User");
        (bool isSuccess,) = _addr.call{value: ETH}("");
        require(isSuccess, "Transaction failed! on main side");
    }
}

contract SendETH {

    constructor() payable {}
    fallback() external payable { }
    receive() external payable { }

    function sendETH(address payable _addr, uint ETH) external {
        (bool success, ) = _addr.call{value: ETH}("");
        require(success, "Transaction failed! on sender side");
    }

    function getBalanceOfSender() external view returns(uint){
        return address(this).balance;
    }
}



/*
Note --> As in deployemnt none of the contract has balance of ETH hence we need to provide balance if we want to send some ether from that contract.
Also to make sure that the contract is able to receive eth while deployement we need to make it payable by using a payable constructor as constructors are the one
that always run when a contract is deployed. Also it's upto the programmer to make a contract recieve eth by using ETH, during the developement or when anyone send ETH 
by using any of the three -> payable construtor, fallback and receive.

*/