# Solidity Mapping for Beginners

In this guide, we'll walk you through the basics of mapping in Solidity.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `Mappings.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.
   - **Note:** For a better understanding of the code within the `Mappings.sol` contract, please see our [Contracts Explanation Documentation](../Contracts-Explanation/MAPPINGS_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees.

3. **Using Mapping:**

   - Start by getting the named back by typing 1 in the "Names" tab; it should return token0.

   - Utilize the `addToken` function by entering the ID (e.g., 1), the token name (e.g., ETH), the amount (e.g., 1), and click "Transact" to complete the transaction, paying the associated gas fees.

   - Navigate to the "Tokens" tab, retrieve information about the added token by entering the corresponding ID (e.g., 1); you should receive ETH in return.

   - Use the `myToken` function by following the same steps used with the `addToken` function.

   - To retrieve the added token, input the address of the account used for the VM environment in the "Address" tab. Then, enter the token ID and proceed, you hsould receive ETH back.

### Conclusion

In this lesson, you've successfully navigated through the fundamental concepts of mapping in Solidity. You engaged with practical exercises, inputting ID in the "Names" tab to witness the corresponding result.The `addToken` function exposed you to the process of adding tokens, involving the specification of ID, name, and amount. The "Tokens" tab provided you with a tangible experience in reading data from the mapping, allowing you to retrieve information about added tokens. In the `myToken` function, you discovered the additional step of account address in the "Address" tab to retrieve the added token, Feel free to advance to the next lesson and continue your journey into the intricacies of Solidity: [Update in progress...]