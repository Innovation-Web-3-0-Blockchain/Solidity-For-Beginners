# Arrays.sol

## Introduction

Arrays are a way to group a set of data in Solidity.

## Arrays with Numbers

```solidity
contract Arrays {
    uint[] public uintArray = [1, 2, 3]; // uint[] is a data type representing an array of unsigned integers
    }
```

In this case, the array is a list representing numbers. There are three different elements, and their order should not be changed. Arrays are used to keep related data together for use in smart contracts.

## Arrays with Strings

```solidity
contract Arrays {
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["USDT", "USDC", "DAI"];
    }
```

## Empty Array with Strings

```solidity
contract Arrays {
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["USDT", "USDC", "DAI"];
    string[] public values; // values is a state variable
    }
```

## Add Value to the Array

We can add values to arrays by creating a function.

```solidity
contract Arrays {
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["USDT", "USDC", "DAI", "BITCOIN"];
    string[] public values;

    function addValue(string memory _value) public {
        values.push(_value); // push adds a new item to the array at the last position (e.g., BITCOIN). It keeps the array in order. _value is a local variable.
    }
```

When calling this function, it updates the array, and every time the array gets updated, gas must be paid.

## Count Value in the Array

```solidity
contract Arrays {
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["USDT", "USDC", "DAI", "BITCOIN"];
    string[] public values;

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns(uint) {
        return values.length; // length returns the number of elements in the array. If updated by the `addValue` function, it will return +1.
    }
}
```

## Two-Dimensional Arrays

It is an array inside another array.

```solidity
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
```