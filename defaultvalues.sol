// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DefaultValuesOfDataTypes {
    bool public b; // Default -> false
    uint public u; // Default -> 0
    int public i; // Default -> 0
    address public a; // Default -> 00000 (40 Zeros)
    bytes32 public b32; // 0x0000 (64 Zeros)
}