# Mappings.sol

## Introduction

Mappings are a data type that is stored on the blockchain with key/value pairs. You can use it to write data on the blockchain. Link for reference of key-value pair example: [Key-VAlue Database](https://en.wikipedia.org/wiki/Key%E2%80%93value_database)

## Mapping

```solidity
contract Mappings {
    mapping(uint => string) public names; // State variable; blockchain is treated like a database
    }
```

## Constructor

You can assign values in the mapping by using the constructor function. 

```solidity
contract Mappings {
    mapping(uint => string) public names;

    constructor() {
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }
```

In this case, we are storing data of `uint` values with corresponding strings; it is simple data. Remember that it executes only once during deployment, making it suitable for tasks like initializing state variables or setting the initial state of the contract.

## Struct

You can add complex data and treat the blockchain like a traditional database by using a `struct`. A `struct` is a way to group related variables together, providing a convenient way to represent and manipulate structured data on the blockchain.

```solidity
contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Token) public tokens;

    struct Token {
        string name;
        string amount;
    }

    constructor() {
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }
```

In the above example, we've introduced a `struct` named `Token` which has two members: `name` and `amount`. This allows you to organize and manage more complex data structures within your smart contract.

## Add Token to the Mapping

You can add data to the mapping using a function, like `addToken`. This function takes parameters such as `_id` (for the unique identifier), `_name`, and `_amount` representing the data you want to store.

```solidity
contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Token) public tokens;

    struct Token {
        string name;
        string amount;
    }

    constructor() {
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }

    function addToken(uint _id, string memory _name, string memory _amount) public {
        // Create a new Token struct and assign it to the specified id in the mapping
        tokens[_id] = Token(_name, _amount);
    }
```

In this example, the `addToken` function allows you to add new tokens to the `tokens` mapping by providing the unique identifier `_id`, the token's name `_name`, and the token's amount `_amount`. This function demonstrates how you can update the state of the contract by adding new data to the blockchain. 

## Format Function

```solidity
contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Token) public tokens;

    struct Token {
        string name;
        string amount;
    }

    constructor() {
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }

    function addToken(
        uint _id,
        string memory _name,
        string memory _amount
    ) public {
        tokens[_id] = Token(_name, _amount);
    }
```

## Nesting Mappings

Nesting mappings is a common practice, especially in tokens and NFTs (Non-Fungible Tokens). 

```solidity
contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Token) public tokens;
    mapping(address => mapping(uint => Token)) public myTokens;

    struct Token {
        string name;
        string amount;
    }

    constructor() {
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }

    function addToken(uint _id, string memory _name, string memory _amount) public {
        tokens[_id] = Token(_name, _amount);
    }
```

In this example, the `myTokens` mapping is used to associate a user's address with a secondary mapping that links token IDs to the tokens they own. This allows for efficient management of ownership data for different users on the blockchain.

## Add MyToken to the Mapping

You can add user-specific tokens to the mapping using a function, like `myToken`. 

```solidity
contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Token) public tokens;
    mapping(address => mapping(uint => Token)) public myTokens;

    // Define a struct named Token
    struct Token {
        string name;
        string amount;
    }

    constructor() {
        // This is an example of initializing values in the mapping when the contract is deployed
        names[1] = "token0";
        names[2] = "token1";
        names[3] = "token2";
    }

    // Function to add a new token to the main mapping
    function addToken(uint _id, string memory _name, string memory _amount) public {
        // Create a new Token struct and assign it to the specified id in the main mapping
        tokens[_id] = Token(_name, _amount);
    }

    // Function to add a new token to the user-specific mapping
    function myToken(uint _id, string memory _name, string memory _amount) public {
        // Create a new Token struct and assign it to the specified id in the user-specific mapping
        myTokens[msg.sender][_id] = Token(_name, _amount);
    }
}
```

In this example, the `myToken` function allows users to add new tokens to their personal collection (`myTokens`) by providing the unique identifier `_id`, the token's name `_name`, and the token's amount `_amount`. 