# Counter.sol

At the top of a Solidity file, we typically include the license and specify the version of the programming language for the compiler to understand.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
```

## Introduction

Solidity is an object-oriented language used for writing smart contracts on the Ethereum blockchain. Contracts can be thought of as objects, supporting inheritance and the ability to call other smart contracts. The contract variable is the basic unit that you can reuse in Solidity.

```solidity
contract Counter {
    // Code goes here [...]

    }
```

## State Variable

In this basic contract, we illustrate how data is stored on the blockchain. We introduce a state variable called `count`, which must have a declared data type.

```solidity
contract Counter {
    uint count; // `uint` represents an unsigned integer, e.g., [1, 2, 3]; it cannot be negative.

    // Constructor
    constructor() public {
        count = 0; // Set the default value of `count`.
    }

    // Read Function
    // The `getCount` function is a read function with `public` visibility. 
    // It returns the current value of `count` when called.
    
    function getCount() public view returns (uint) {  
        return count;
    }

    // Write Function
    // The `incrementCount` function is a write function that modifies the value of `count` when called.

    function incrementCount() public {
        count = count + 1; // Changing the state of the blockchain incurs gas costs.
    }
}
```

## Simplified Contract

In a more concise version, Solidity allows you to initialize state variables for free. Here's a simplified version of the contract:

```solidity
contract Counter {
    uint public count = 0; // Solidity allows default state values to be stored for free.

    function incrementCount() public {
        count++; // Increment `count` by 1.
    }  
}
```

This simplified version eliminates the need for a constructor and makes state variable initialization more straightforward.