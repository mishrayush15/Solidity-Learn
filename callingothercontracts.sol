// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract CallTestContract {

    // Way 1 ->
    // We are trying to connect with other contract by passing the address so to reduce the confilicts that can happend if there are two similar kinds of functions in 2 diff contracts.
    function setXWay1(address addrOfTestContract, uint valueOf_x) external {
        // Syntax -> OtherContractName(addressOfOtherContract).functionNameOfOtherContract(valueYouWantToPass);
        TestContract(addrOfTestContract).setX(valueOf_x);
    }


    // Way 2 ->
    function setXWay2(TestContract addrOfTestContract, uint valueOf_x) external {
        // No need of initialising the contract, we can directly do that in the parameters of the function
        addrOfTestContract.setX(valueOf_x);
    }


    function getX(TestContract addrOfTestContract) external view returns(uint){
        return addrOfTestContract.getX();
    }

    function setXandReceiveETH(TestContract addrOfTestContract, uint _x) external payable {
        addrOfTestContract.setXandReceiveEther{value: msg.value}(_x); // We are passing all the ETH passed on to this function (setXandReceiveETH) of main contract to this function (setXandReceiveEther) of another contract
    }

    function getXandValueAnother(TestContract addrOfTestContract) external view returns(uint, uint){
        return (x, value) = TestContract.getXandValue();
    }

}


contract TestContract {

    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns(uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint){
        return (x, value);
    }
}