// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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

    function getSecretFromVault() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
    }
}
