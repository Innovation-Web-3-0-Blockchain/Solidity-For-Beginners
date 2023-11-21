# HotelRoom.sol

## Introduction

This contract will be a review of all the components we saw in the other lessons, plus a few more new elements. This contract is created to book rooms in a hotel.

## Set the Owner

We'll explore how to set the owner during contract deployment to managed access control and ownership within the smart contract.

```solidity
contract HotelRoom {
    // State variable for the owner of the hotel room
    address public owner;

    // Constructor is executed only once during contract deployment
    constructor() {
        owner = msg.sender; // The account that deploys the contract becomes the owner
    }
```

In this section, the constructor initializes the `owner` variable, which is a state variable representing the account that owns the hotel room. 

## Booking Function

We'll explore the `booking` function. This function is a placeholder for the logic that handles the booking process.

```solidity
contract HotelRoom {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function for booking the hotel room
    function booking() public {
        // Placeholder: Implementation for booking the room will be added here
        // This is where you'd put the logic to handle the booking process.
    }
}
```

In this section, the `booking` function is declared with the public keyword indicating its accessibility.

## Booking Function with Payment Handling

We'll explore the `booking` function, which now includes payment handling.

```solidity
contract HotelRoom {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function booking() public payable {

        // Transfer the payment to the owner of the hotel room
        owner.transfer(msg.value);
    }
}
```

In this section, the `booking` function is enhanced to include payment handling. The payable keyword allows the function to receive Ether, and users booking the room are expected to send Ether along with the transaction. The `owner.transfer(msg.value)` line transfers the received Ether to the owner of the hotel room, enabling payment processing within the contract.

## Enums for Contract Status

We'll explore the use of `enum` to represent different states or statuses.

```solidity
contract HotelRoom {
    // Enum to represent different states of the hotel room
    enum Statuses { Vacant, Occupied }

    Statuses public currentStatus;

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        // Set the initial status 
        currentStatus = Statuses.Vacant;
    }

    function booking() public payable {
        // Ensure that the room is vacant before allowing booking
        require(currentStatus == Statuses.Vacant, "Room is already occupied");
        
        // Handling the booking
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); 
    }
}
```

In this section, the use of `enum` is illustrated to represent different states in the smart contract. The `currentStatus` variable tracks the current state, and the require statement ensures that the room is vacant before allowing a booking. The state transition `(currentStatus = Statuses.Occupied)` reflects the change in the state of the contract after a successful booking. This makes it easier to manage and represent the various states the smart contract can be in.

## Checks with Require Statements

We'll explore the use of `require` statements for checking the price and the status of the hotel room before allowing a booking.

```solidity
contract HotelRoom {
    enum Statuses { Vacant, Occupied }

    Statuses public currentStatus;

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    function booking() public payable {
        // Check if enough ethers are provided for booking
        require(msg.value >= 0.3 ether, "Not enough ethers provided");

        // Check if the room is currently vacant before allowing booking
        require(currentStatus == Statuses.Vacant, "Currently Occupied");
        
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); 

    }
}
```

In this section, `require` statements are utilized for checking the price and the status of the hotel room before allowing a booking. The first `require` statement ensures that the caller has provided at least 0.3 ethers for the booking, and the second `require` statement checks if the room is currently vacant. The state transition `(currentStatus = Statuses.Occupied)` reflects the change in the state of the contract after a successful booking.

## Modifiers for Function Conditions

We'll explore the use of modifiers to encapsulate reusable conditions and checks for the `booking` function.

```solidity
contract HotelRoom {

    enum Statuses { Vacant, Occupied }

    Statuses public currentStatus;

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // Modifier: Check if the room is currently vacant
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied"); 
        _; // Continue with the function code if the condition is met
    }

    // Modifier: Check if enough ether is provided for booking
    modifier cost(uint _amount) { 
        require(msg.value >= _amount, "Not enough ether provided"); 
        _; // Continue with the function code if the condition is met
    }

    // Function for booking the hotel room with payment and modifiers
    function booking() public payable onlyWhileVacant cost(0.3 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); 
    }
}
```

In this section, modifiers `(onlyWhileVacant and cost)` are introduced to encapsulate reusable conditions and checks for the `booking` function. Modifiers enhance code readability and maintainability by providing a way to reuse common conditions across multiple functions. The `booking` function now utilizes these modifiers to enforce conditions for room availability and the required payment amount.

## Emitting an Event

We'll explore how to emit an event in the `booking` function to notify external parties about a room booking.

```solidity
contract HotelRoom {
    enum Statuses { Vacant, Occupied }

    // Event to notify when a room is occupied
    event Occupy(address _occupant, uint _value);

    Statuses public currentStatus;

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

    function booking() public payable onlyWhileVacant cost(0.3 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); 

        // Emit an event to notify external parties about the room booking
        emit Occupy(msg.sender, msg.value);

    }
}
```

In this section, the `Occupy` event is introduced to notify external parties when a room is occupied. The emit `Occupy(msg.sender, msg.value)` line triggers the emission of the event, including relevant parameters such as the occupant's address and the value sent. This allows external applications or scripts to react to room booking activities on the blockchain.

## Changing transfert to call

```solidity
contract HotelRoom {
    enum Statuses { Vacant, Occupied }

    Statuses public currentStatus;

    // Event to notify when a room is occupied
    event Occupy(address _occupant, uint _value);

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

    function booking() public payable onlyWhileVacant cost(0.3 ether) {
        currentStatus = Statuses.Occupied;

        // Use 'call' to transfer Ether to the owner
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        
        // Check if the transfer was successful
        require(sent, "Failed to send Ether to the owner");

        emit Occupy(msg.sender, msg.value);

    }
}
```

In this section, the `transfer` method is replaced with the `call` method for Ether transfer to the `owner`. This approach provides more control and transparency, allowing you to check the success of the operation. The result of the `call` is checked, and the function reverts with an error message if the transfer fails. This gives you the flexibility to handle the Ether transfer outcome appropriately in your smart contract logic.

### Refactoring (optionnal)


```solidity
contract HotelRoom {
    // Refactoring
    enum Statuses { 
        Vacant, 
        Occupied 
    }

    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() internal {
        require(currentStatus == Statuses.Vacant, "Currently occupied"); 
        _; 
    }

    modifier cost(uint _amount) internal { 
        require(msg.value >= _amount, "Not enough ether provided"); 
        _; 
    }

    function booking() public payable onlyWhileVacant cost(0.3 ether) {
        currentStatus = Statuses.Occupied;

        owner.transfer(msg.value); 

        emit Occupy(msg.sender, msg.value);
    }
}
```