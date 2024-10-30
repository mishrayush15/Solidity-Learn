// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TodoList {

    struct ToDo {
        string todo;
        bool isCompleted;
    }

    ToDo[] public todos;

    function addToDo(string calldata _todo) public {
        todos.push(ToDo({
            todo : _todo,
            isCompleted : false
        }));
    }

    function getToDo() public view returns (ToDo[] memory) {
        return todos;
    }

    function completeToDo(uint _index) public {
        todos[_index].isCompleted = true;
    }

}