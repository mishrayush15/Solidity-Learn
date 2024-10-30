// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    string public text;

    function setTest(string calldata _text) public {
        text = _text;
    }

    function getText() public view returns (string memory) {
        return text;
    }
}