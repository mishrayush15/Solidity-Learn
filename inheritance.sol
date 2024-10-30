// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Parent {

    // Virtual is used to mark any function as it can be modified in the contract inherited
    function example1() public pure virtual returns(string memory){
        return "A";
    }

    function exmaple2() public pure virtual returns(string memory){
        return "B";
    }

    // Though this function is not in child contract, but as the child inherits parents, hence it can also be accessed by the child contract
    function example3() public pure returns(string memory){
        return "Hello";
    }
}

// 'is' is a keyword used to declare that a contract inherits another contract
contract Child is Parent  {

    // 'override' is used to indicate that we are modifing or overriding a function from parent class
    function example1() public pure override returns(string memory){
        return "C";
    }

    function exmaple2() public pure override returns(string memory){
        return "D";
    }
}

// Order of inheritance --> most parent to most child

/*
    x (parent)
    |
    |- - - - - -
    |          |
    y (child)  | } y only inherits x whereas z inherits both x & y
    |          |
    |- - - - - - 
    |
    z (sub child)

*/


contract A {
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract B {
    string public text;

    constructor(string memory _text){
        text = _text;
    }
}

// Calling a contructor of parent contract have 2 ways --> 
// Way 1 -> When we knw what kind of inputs are the constructor of parent receiveing

contract C is A("helow"), B("worldw") {

}

// Way 2 -> When we are not aware of what inputs to pass as the input will be defined inside the contract

contract D is A, B {

    constructor(string memory _name, string memory _text) A(_name) B(_text){
        // Initialising code
    }
}

// Calling of parent constructor can be combintation of both ways
contract E is A("helow"), B {

    constructor(string memory _text) B(_text){ // Here B will receive a dynamic input whereas A will receive a static input
        // Initialising code
    }
}


/* Order of aprent constructor is defined by the order of inhertence
   that is taking the exmaple of E, we have inherited the parent as A, B 
   hence the constructor order will be also A, B and if the inherit was B, A
   then the order of constructor will be B, A
*/


// Calling Parent Function have 2 ways ->
// Way 1 -> Directly
// Way 2 -> Using 'super' keyword

/*

    F
  /   \ 
G       H
  \   /
    I

*/

contract F {
    event Log(string message);
    function eg1() public virtual {
        emit Log("EG-1 of F ");
    }

    function eg2() public virtual {
        emit Log("EG-2 of F");
    }
}

contract G is F {

    function eg1() public virtual override {
        emit Log("EG-2 of G");
        F.eg1(); // Calling the parent function after emitting the event
    }

    function eg2() public virtual override {
        emit Log("EG-2 of G");
        super.eg2(); // 'super' points to the parent contract
    }

} 