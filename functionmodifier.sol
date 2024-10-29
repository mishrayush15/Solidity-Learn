// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FunctionModifier {

    /* Funciton Modifier -> There are functions that runs before a function
    to check if the condtion are met or if programmer seed to run something before 
    a function run, we use function modifier.
    */
    bool public paused; // Default -> false
    uint public count; // Default -> 0

    function setPause(bool _value) public {
        paused = _value;
    }

    // Below functions can only be called when the require condition hold true value

    function inc() public {
        require(!paused, "paused");
        count++;
    }

    function dec() public {
        require(!paused, "paused");
        count--;
    }

    // Doing the same with Function Modifier 

    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // The _ acts as a trigger that only trigger if the require holds true
    }

    function increase() public whenNotPaused {
        count++;
    }

    function decrease() public whenNotPaused {
        count--;
    }

    /* We can alo use modifier with parameters all we have to do is to create
     a modifier with parameters and make sure to pass those parameters as arguments
     while calling the function modifier. 

     We can also attach multiple function modifier in a single functin, just like
     we attach mutiple middlewares in express app.
    */

    // Sandwich Function Modifier -> Executes the modifier then the function and then again the modifier

    // Below modifier worlflow ->
    // Modifier -> Function -> Modifier
    modifier sandwich() {
        count += 10;
        _;
        count +=2;
    }

    function sandwichFunc() public sandwich {
        count ++;
    }
}