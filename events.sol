// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Events help to write data in blockchian but these data can't be accessed by any contract
// Events main purpose is to log somehting happened

contract Events {

    // Syntax of event -> event eventName(datatypes varNames) -> these var names are the data that you want to show as logs
    event Log(string message, uint value);

    // indexed is used to index the logs as per data so that frontend can retrieve logs of certain data/index
    event IndexedLogs(address indexed sender, uint value);

    function eventLog() public { // As we are storing the event's data on the blockchain hence we dont use view, pure etc...
        emit Log("Hello World", 315); // emit is used to trigger an Event
        emit IndexedLogs(msg.sender, 100);
    }

    event Message(address indexed _from, address _to, string message);

    function sendMessage(address _to, string calldata _message) public {
        emit Message(msg.sender ,_to, _message);
    }
}