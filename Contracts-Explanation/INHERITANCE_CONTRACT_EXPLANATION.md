# Inheritance.sol

## Introduction

So far, you've seen only a basic smart contract that doesn't interact with other smart contracts. Inheritance is a fundamental concept in object-oriented programming; it allows a contract to inherit properties and functionalities from another contract, promoting code reuse and logical organization.

## Storing a State Variable

We'll explore how to store a state variable in the `Inheritance` smart contract.

```solidity
contract Inheritance {
    // State variable to store a secret
    string public secret;

    // Constructor is executed only once during contract deployment
    constructor(string memory _secret) public {
        secret = _secret;
    }
```

In this section, the state variable `string public secret` is used to store a persistent value known as the `secret`. This variable is designated as `public`, enabling external read access. The constructor (`constructor(string memory _secret) public`) is executed solely during the contract's deployment, serving the purpose of initializing the `secret` state variable with the value provided as an argument. This ensures that the `secret` is set only once at the inception of the contract on the blockchain.

## Storing an Owner

We'll explore how to store an owner's address as a state variable in the `Inheritance` smart contract.

```solidity
contract Inheritance {
    // State variable to store the contract owner's address
    address public owner;
    string public secret;

    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender; // Set the contract owner to the address that deployed the contract
    }
```

In this section, the state variable `address public owner` is utilized to store the address of the contract owner. Designated as `public`, this variable facilitates external read access. The constructor (`constructor(string memory _secret) public`) is executed singularly during contract deployment. Within the constructor, the `secret` state variable is initialized with the provided argument value, and concurrently, the `owner` is set to the address responsible for deploying the contract (`msg.sender`). This ensures that the `owner` is uniquely associated with the deploying address at the contract's initiation on the blockchain.

## Function to Get the Secret

We'll explore the `getSecret` function that allows retrieving the secret stored in the contract.

```solidity
contract Inheritance {
    address public owner;

    string public secret;

    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender; 
    }

    // Function to get the secret value
    function getSecret() public view returns (string memory) {
        return secret;
    }
}
```

In this section, the `getSecret` function is a public method designed for external invocation. Declared as `view` to signify that it does not alter the contract's state, the function (`function getSecret() public view returns (string memory)`) enables anyone to retrieve information without modifying the contract. The return type (`returns (string memory)`) specifies that the function provides a value of type `string memory`, which corresponds to the stored `secret` variable.

## Modifier for Owner Access

We'll explore the `onlyOwner` modifier to restrict access to the `getSecret` function to the contract owner.

```solidity
contract Inheritance {
    address public owner;

    string public secret;

    // Modifier: Check if the caller is the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; // Continue with the function code if the condition is met
    }

    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender; 
    }

    // Function to get the secret value, accessible only by the owner
    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
```

In this section, the `onlyOwner` modifier is established to restrict access to functions by verifying that the caller (`msg.sender`) is the designated owner of the contract. When applied to the `getSecret` function (`function getSecret() public view onlyOwner returns (string memory)`), this modifier ensures that only the contract owner can invoke the function, providing exclusive access to retrieve the stored secret. The implementation of the modifier (`_;`) designates the point where the actual function code is executed if the ownership check passes.

## Inheritance with Ownable Contract

We'll explore how the `Inheritance` contract inherits from the `Ownable` contract, providing the functionality of the `onlyOwner` modifier.

```solidity
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; 
    }
}

contract Inheritance is Ownable {
    string public secret;

    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
```

In this section, the `Inheritance` contract inherits from the `Ownable` contract, incorporating its state variables and functions, including the `onlyOwner` modifier. The `address public owner` state variable in the `Ownable` contract is designated as `public` for external accessibility. The `onlyOwner` modifier is applied to the `getSecret` function in the `Inheritance` contract (`function getSecret() public view onlyOwner returns (string memory)`), ensuring that only the contract owner can invoke this function, thereby bolstering security. The constructor of the `Inheritance` contract (`constructor(string memory _secret) public`) initializes the `secret` state variable and sets the contract owner to the deploying address (`msg.sender`). Implicitly, the constructor of the `Ownable` contract is called during deployment, contributing to the establishment of ownership dynamics within the `Inheritance` contract on the blockchain.

## Using super in Inheritance

We'll explore the use of `super` in the `Inheritance` contract to invoke the constructor of the `Ownable` contract.

```solidity
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; 
    }

    constructor() {
        owner = msg.sender;
    }
}

contract Inheritance is Ownable {
    string public secret;

    constructor(string memory _secret) Ownable() {
        secret = _secret;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
```

In this section, the constructor inheritance is implemented through the statement `constructor(string memory _secret) Ownable()`, explicitly calling the constructor of the `Ownable` contract. This deliberate invocation ensures the execution of the `Ownable` constructor logic before proceeding with the specific initialization in the `Inheritance` constructor. Notably, the `super` keyword, commonly used for invoking base contract functions in more intricate inheritance structures, is not required in this case. This pattern proves advantageous when managing multiple constructors within an inheritance hierarchy, streamlining the sequential execution of constructor logic from the base to the derived contract.

## Interacting with other contracts

We'll explore how the `Inheritance` contract interacts with the `SecretVault` contract by creating an instance

 of it.

```solidity
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; 
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string public secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    // Function to get the secret value, accessible only by the owner
    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}

contract Inheritance is Ownable {
    constructor(string memory _secret) {
        // Create a new instance of the SecretVault contract
        SecretVault _secretVault = new SecretVault(_secret);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
```

In this section, a notable interaction occurs with the `SecretVault` contract through the instantiation of a new instance: `SecretVault _secretVault = new SecretVault(_secret);` within its constructor. This interaction initializes a separate instance of the `SecretVault` contract with the provided secret. The `onlyOwner` modifier is crucial in the `getSecret` function, restricting access to only the contract owner. This ensures that sensitive operations, such as retrieving the stored secret, can only be executed by the authorized entity.

## Save the SecretVault address for reuse

We'll explore how to save the `SecretVault` contract address for reuse within the `Inheritance` contract.

```solidity
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; /
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string public secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}

contract Inheritance is Ownable {
    // State variable to store the address of the deployed SecretVault contract
    address public secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        // Save the address of the deployed SecretVault contract
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}
```

In this section, the `address public secretVault` state variable is introduced to store the address of the deployed `SecretVault` contract. The deployment of the `SecretVault` contract is initiated within the `Inheritance` constructor through the line `SecretVault _secretVault = new SecretVault(_secret);`. Subsequently, the address of the newly deployed `SecretVault` contract is stored in the `secretVault` state variable using `secretVault = address(_secretVault);`. This enables the `Inheritance` contract to maintain a reference to the deployed `SecretVault` contract for future interactions or retrievals. The use of this state variable enhances the functionality and flexibility of the `Inheritance` contract by facilitating communication with the deployed `SecretVault` instance.

## Get the secret inside the SecretVault

We'll explore how to get the secret inside the `SecretVault` contract from the `Inheritance` contract.

```solidity
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _; 
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string public secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}

contract Inheritance is Ownable {
    address public secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    // Function to get the secret value from the SecretVault contract
    function getSecretFromVault() public view onlyOwner returns (string memory) {
        // Call the getSecret function of the SecretVault contract using the saved address
        return SecretVault(secretVault).getSecret();
    }
}
```

In this section, there is an interaction with the introduction of the `getSecretFromVault` function. This function utilizes the saved address (`secretVault`) to call the `getSecret` function from the `SecretVault` contract. The syntax `SecretVault(secretVault).getSecret()` exemplifies how to invoke functions of another contract, specifying both the contract type (`SecretVault`) and the address (`secretVault`). This approach showcases how the `Inheritance` contract can interact with the deployed `SecretVault` contract to retrieve and utilize the stored secret.
```