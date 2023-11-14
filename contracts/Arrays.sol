// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
    uint[] public uintArray = [1, 2, 3]; 
    string[] public stringArray = ["USDT", "USDC", "DAI", "BITCOIN"];
    string[] public values; 
    uint256[][] public array2d = [[4, 5, 6], [7, 8, 9]];

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint) {
        return values.length; 
    }
}
