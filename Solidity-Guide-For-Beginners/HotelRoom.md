# Full Contract for Beginners

In this guide, we'll walk you through a basic full contract that includes all the components we covered in the other lessons, plus a few more new elements.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `HotelRoom.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.
   
   - **Note:** For a better understanding of the code within the `HotelRoom.sol` contract, please refer to our [Contracts Explanation Documentation](../Contracts-Explanation/HOTEL_ROOM_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Ignore Warnings**:
   - During compilation, you might encounter warnings or messages. For this basic tutorial, you can ignore them.

3. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees.

4. **Check Statuses**:
   - If you click on the `currentStatus` tab, you'll get 0, which is the first status (vacant), and 1, which is occupied.

5. **Check the owner**:
   - If you click on the `owner` tab, you should see the address to which this smart contract belongs. It should be the account that you use for the VM environment.

6. **Change Address**:
   - Use a different address to book a room.

7. **Booking a Room**:
   - If you click "book," the transaction will fail because you didn't send any ether to the contract to use the booking function.
   - Go back to the VM account; you should see a "value" tab with a dropdown. Change wei to ether.
   - Input the amount in the "value" field to book the room (which is 0.3 ethers). If you input a balance lower than the required amount, the transaction will be reverted.
   - You can now click "book," and it should be successful.

## Conclusion

Congratulations on successfully creating your first complex smart contract. As we wrap up this foundational tutorial, take a moment to reflect on your impressive journey. Before diving into more advanced projects, explore the final lesson available at the following link: [Update in progress]. This last module will provide valuable insights for your ongoing growth in blockchain development.