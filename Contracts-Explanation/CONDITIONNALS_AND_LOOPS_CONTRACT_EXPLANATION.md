# ConditionnalsAndLoops.sol

## Introduction

Conditional is a control flow structure. It is a logic gate inside a programming IF some condition THEN do this action or ELSE do another action. Loop is something that iterates over an intuitive data structure like an array. You can test each item in the array.

## Conditionals 

You can control the flow of your program by setting conditional statement.

```solidity
contract ConditionnalsAndLoops {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function isEvenNumber(uint _number) public view returns(bool) {
        // Conditional Statement
        if (_number % 2 == 0) {
            // The condition checks if the number is divisible by 2 without a remainder (using the modulus operator '%').
            // If the remainder is 1, it means the number is odd, and the function returns 'false'.
            // If the remainder is 0, it means the number is even, and the function returns 'true'.
            return true;
        } else {
            return false;
        }
    }
}
```

In this example, the if statement acts as a decision-maker, executing different actions based on a condition. The modulus operator % determines whether a number is even or odd. The function returns a boolean value (true for even, false for odd).

## Loops 

Loops allow you to perform repetitive tasks with ease.

```solidity
contract ConditionnalsAndLoops {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function countEvenNumbers() public view returns(uint) {
        uint count = 0;

        // A 'for' loop has three components: initialization (uint i = 0), condition (i < numbers.length), and iteration (i++).
        // It iterates through each element in the 'numbers' array.
        for(uint i = 0; i < numbers.length; i++) {
            // Within the loop, the function checks if the current number is even using the 'isEvenNumber' function.
            // If true, the 'count' variable is incremented.
            if(isEvenNumber(numbers[i])) {
                count++;
            }
        }

        // After the loop, the total count of even numbers is returned.
        return count;
    }

    function isEvenNumber(uint _number) public view returns(bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
}
```

In this example, the for loop is a powerful construct for iterating through arrays. Understanding its three parts—Initialization, Condition, and Iteration—helps control its execution. The if statement inside the loop allows performing actions based on a condition during each iteration. The function `isEvenNumber` checks if a number is even, and `countEvenNumbers` returns the total count of even numbers in the array.

## Simplified Condition (Owner)

You can simplified condition using a one-liner to check if the caller of a function is the owner of the contract.

```solidity
contract ConditionnalsAndLoops {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // State variable for the entire contract
    address public owner; 

    constructor() {
        owner = msg.sender; // Account that deployed the contract to the network. 'owner' is the assigned variable.
    }

    function countEvenNumbers() public view returns(uint) {
        uint count = 0;

        for(uint i = 0; i < numbers.length; i++) {
            if(isEvenNumber(numbers[i])) {
                count++;
            }
        }

        return count;
    }

    function isEvenNumber(uint _number) public view returns(bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function isOwner() public view returns (bool) {
        // Simplified condition: Check if the caller of the function is the owner
        return (msg.sender == owner);
    }
}
```

In this example, the constructor sets the owner variable to the account that deployed the contract. The `isOwner` function simplifies the condition to check if the caller is the owner, emphasizing the importance of ownership in controlling access to contract features.