# Solidity Variables and Data Types for Beginners

In this guide, we'll walk you through the basics of working with variables and data types in Solidity.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `VariablesAndDataTypes.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.

   - **Note:** For a better understanding of the code within the `VariablesAndDataTypes.sol` contract, please see our [Contracts Explanation Documentation](../Contracts-Explanation/VARIABLES_AND_DATA_TYPES_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees. 
   
3. **Transaction Confirmation**:
   - If the deployment is successful, you will receive a transaction hash as confirmation. This transaction hash is a unique identifier for the deployment transaction.
   - Your account balance will be reduced by a small amount (less than 1 ether) due to gas fees, which are necessary to process your contract deployment.

4. **Interact with the Contract**:
   - Under the "Deployed Contracts" section in Remix, you should see your deployed contract. It will have several tabs representing the state variables and functions you defined in your contract.
   - You can click on these tabs to interact with your contract. For example, you can read the values of the state variables like `myInt256`, `myUint256`, `myString`, and `myBytes32`. You can also call the `getValue` function to see how it works.

5. **Exploring the myStruct**:
   - Click on the `myStruct` tab to see how the compiler handles the struct. This will allow you to inspect the values stored within the struct, which in this case includes a `uint` and a `string`.
   - Experiment with reading and updating the values within the `myStruct` using the Remix interface.

## Conclusion

In this lesson, you have gained an understanding of two distinct types of variables: local variables and state variables, while also gaining familiarity with various data types. To continue your learning, you can navigate to the next lesson by clicking on the following link: [Arrays](Arrays.md)