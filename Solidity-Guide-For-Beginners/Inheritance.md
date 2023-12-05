# Inheritance for Beginners

In this guide, we'll walk you through the intricacies of inheritance.

## Prerequisites

Before we get started, make sure you have the following:

1. **Ethereum Remix IDE**:
   - If you haven't already, visit the [Ethereum Remix IDE Website](https://remix.ethereum.org/) to get started.

2. **Import the Smart Contract**:
   - Import the smart contract named `Inheritance.sol` from the [Contract Repository](../contracts). You can do this by either uploading the file or copying and pasting the code into Remix.
   
   - **Note:** For a better understanding of the code within the `Inheritance.sol` contract, please refer to our [Contracts Explanation Documentation](../Contracts-Explanation/INHERITANCE_CONTRACT_EXPLANATION.md).

## Getting Started

1. **Compile the Smart Contract**:
   - After importing the contract, click the "Compile" button in Remix. This step allows the Ethereum Virtual Machine (EVM) to understand the code. Compilation ensures that your contract's code is free of errors and is ready to be deployed.

2. **Deploy the Contract**:
   - Click the "Deploy" button in Remix. This action will create an instance of your contract on the Ethereum blockchain.
   - You'll need an Ethereum virtual machine (VM) environment account with 100 ethers to cover gas fees.

3. In the deploy tab, input a secret (i.e 'My Secret"), then click deploy.

4. Click on the `getSecret` function; it should return your secret.

5. Change the account and try to get the secret by clicking the `getSecret` function; it should revert.

### Conclusion

In this lesson, you've explored how a contract can inherit from another one. The first, `Ownable`, establishes ownership through a modifier, allowing only the owner to execute certain functions. The second, `SecretVault`, stores a secret and enforces ownership for access. The third contract, `Inheritance`, inherits from `Ownable` and creates an instance of `SecretVault` during initialization. It introduces a function, `getSecretFromVault`, allowing the contract owner to retrieve the stored secret. As we wrap up this foundational tutorial, take a moment to reflect on your impressive journey. The last lesson will guide you on how to use the Hardhat framework on your local computer to test your contracts for your development. Explore the final lesson available at the following link: [Testing Contracts](TestingContracts.md).