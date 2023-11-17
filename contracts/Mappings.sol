// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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

    function addToken(
        uint _id,
        string memory _name,
        string memory _amount
    ) public {
        tokens[_id] = Token(_name, _amount);
    }

    function myToken(
        uint _id,
        string memory _name,
        string memory _amount
    ) public {
        myTokens[msg.sender][_id] = Token(_name, _amount);
    }
}