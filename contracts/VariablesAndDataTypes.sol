// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableAndDataTypes {
    int256 public myInt256 = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    string public myString = "Welcome to the Solidity for beginners repository!";
    bytes32 public myBytes32 = "Welcome to the Solidity for beginners repository!";

    address public myAddress = 0x5fbdb2315678afecb367f032d93f642f64180aa3;

    struct MyStruct {
        uint myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Welcome to the Solidity for beginners repository!");

    function getValue() public pure returns (uint) {
        uint value = 1;
        return value;
    }
}
