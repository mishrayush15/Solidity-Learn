// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Arrays {
    
    // Dynamic Array -> Size of the array can change 
    uint[] public myDynamicArray;

    // Fixed size array -> Size of the array can't change
    uint[3] public myFixedArray;

    // Initializing an array -> Storing a pre-defined data in array
    uint[] public dynamicArrayInitialize = [10, 20, 30, 40, 50, 60, 70];
    uint[3] public fixedArrayInitialize = [10, 20, 30];

    // Operations on array -> Insert (push), get, update, delete, pop, length
    function arrayOperations() public {
        dynamicArrayInitialize.push(3); //[10, 20, 30, 40, 50, 60, 70, 3]
        dynamicArrayInitialize[1]; // Get's the element on index 1
        dynamicArrayInitialize[2] = 315; // Updating the value at index 2 to 315
        delete dynamicArrayInitialize[4]; // Deletes the value at index 4 **sets to the default value of array datatype**
                                          // --> [10, 20, 30, 40, 0, 60, 70, 3] **length remains same**
        dynamicArrayInitialize.pop(); // Removes the last elemt and also shrinks the size                                  
        dynamicArrayInitialize.length; // Gets the length of the array


        // Creating array in memory -> Memory is basically temporary storage in EVM
        uint[] memory memoryArray = new uint[](5); // 5 is the size of the array **only fixed size array can be stored in memory -> hence can't call push pop etc... -> only supports update & get**
    }

    // Functions that can return an array
    function returnsArray() public view returns (uint[] memory){
        return dynamicArrayInitialize;
    } 
    // Not recommended to return an array as it uses a lot of GAS


    /* If we want to remove an element from an array using the delete keyword
    we know that it wont remove, it just changes the element to 0, hence to remove
    and to shrink the array at the same time using the delete keyword, what we can do
    is to shift all the elements to the left side and the element we want to delete to the right side and then use pop, as pop removes the last element */
    // [1, 2, 3, 4] } remove 1st index element -> [1, 3, 4, 4] } copy the element after index 1 to it's index-1 position -> pop() -> removes the last -> [1,3,4]
    // [1, 2, 3, 4, 5, 6] } remove 2nd index -> [1, 2, 4, 5, 6, 6] -> pop() -> [1, 2, 4, 5, 6]
    uint[] public arr = [1, 2, 3, 4, 5, 6, 7];
    function removeElemetnAndShrinkArray(uint _index) public {
        require(_index < arr.length, "Index out of bound");
        
        for (uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }

        arr.pop();

    }
}