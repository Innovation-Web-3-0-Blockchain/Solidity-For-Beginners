# Solidity Conditionals and Loops for Beginners

In this guide, we'll walk you through the basics of conditionals and loops in Solidity.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `ConditionalsAndLoops.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.
   
   - **Note:** For a better understanding of the code within the `ConditionalsAndLoops.sol` contract, please refer to our [Contracts Explanation Documentation](../Contracts-Explanation/CONDITIONALS_AND_LOOPS_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Ignore Warnings**:
   - During compilation, you might encounter warnings or messages. For this basic tutorial, you can ignore them.

3. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees.

4. **Interacting with Conditionals and Loops**
   - Click `countEvenNumbers` function it should return a total of 5 because of the items/numbers in the array.

   - Click on `isEvenNumber` function, then input 1 it should return false. Input 2, and it should return true.

   - In the "numbers" tab, you can read the number from the array by inputting the ID.

5. **Interacting with Simplified Conditional**
   - Click the `isOwner` function it should return true because the account associated is the one that deployed this contract.

   - Change to a different account, then click `isOwner` function it should return false.


### Conclusion

In this lesson, you've successfully interacted with basic Solidity conditionals and loops. You've explored functions such as `countEvenNumbers` and `isEvenNumber`, understanding how they contribute to the logical flow of your smart contract. In the upcoming lesson, you will have the opportunity to integrate all the individual aspects you've learned into a comprehensive smart contract. Feel free to navigate to the next lesson: [Full Contract](HotelRoom.md)




