// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    enum Statuses {
        Vacant,
        Occupied
    }

    Statuses public currentStatus;
    event Occupy(address occupant, uint value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied");
        _;
    }

    modifier cost(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided");
        _;
    }

    function bookRoom() public payable onlyWhileVacant cost(0.3 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether to owner");

        emit Occupy(msg.sender, msg.value);
    }
}
