# Solidity Arrays for Beginners

In this guide, we'll walk you through the basics of working with arrays in Solidity.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `Arrays.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.

   - **Note:** For a better understanding of the code within the `Arrays.sol` contract, please see our [Contracts Explanation Documentation](../Contracts-Explanation/ARRAYS_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees.

3. **Interacting with Arrays**:
   - In the smart contract, you will find functions that operate on arrays. For example, start with the value count set to 0.

   - Use the `addValue` function by typing a string you want to add, and then click "Add Value."

   - After adding a value, check the `valueCount` variable. It should now be 1.

   - To read values from the array, use the `returnValue` function. It won't return the entire array but provides a function to read each item individually in the array by order.

   - **Note:** Solidity arrays are zero-based indexed, meaning the first item in the array is at index 0.

   - To test this, put 0 in the values tab, and it should return the string you put in the `addValue` function.

   - In the case of a string array, you can get the item you want. For example, 1 corresponds to the second item, 2 corresponds to the third item, and so on.

   - In a 2D array, you provide two indices to access an item. For example, if you put 0 in the first index and 0 in the second index, you should get the first value. Likewise, putting 0 and 1 should give you the second value.

   - Experiment with different combinations of indices to access elements in the 2D array.

### Conclusion

In this lesson, you've successfully navigated through the basics of working with arrays in Solidity. You explored essential functions like `addValue` to dynamically add elements to an array and `valueCount` to retrieve the count of elements. Solidity arrays follow a zero-based index, and this lesson demonstrated how to manipulate and retrieve values from one-dimensional and two-dimensional arrays. By experimenting with different index combinations, you gained hands-on experience in accessing specific elements within arrays. To further expand your knowledge, feel free to move on to the next lesson: [Mappings](Mappings.md)


