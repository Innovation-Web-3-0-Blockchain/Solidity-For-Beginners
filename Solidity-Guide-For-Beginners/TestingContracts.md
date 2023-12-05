# Solidity Testing Contracts for Beginners

In this guide, we'll walk you through testing your smart contracts using the Hardhat framework. Testing ensures that your contract behaves as expected before deploying it to a testnet or mainnet.

## Getting Started

1. **Create Project Repository**:

   - To create a new repository, use the command:

     ```bash
     mkdir My_Solidity_Project
     ```

2. **Install Node.js**:

   - To ensure Node.js is installed, use the command:

     ```bash
     node -v
     ```

     If you don't get any version back, install from [Node Source](https://github.com/nodesource/distributions).

3. **Initiate npm**:

   - To initiate npm, use the command:

     ```bash
     npm init
     ```

     Press Enter for all default settings.

4. **Install Hardhat**:

   - To install Hardhat, use the command:

     ```bash
     npm install --save-dev hardhat
     ```

5. **Create a New Project**:

   - To create a new project, use the command:

     ```bash
     npx hardhat
     ```

     Press Enter for all default settings.

6. **Open Project**:

   - Open your project directory in a text editor ([VS Code](https://code.visualstudio.com/), [Sublime Text](https://www.sublimetext.com/), [Notepad++](https://notepad-plus-plus.org), etc.).

7. **Testing Example**:

   - Test the contract's functionality using:

     ```bash
     npx hardhat test
     ```

8. **Import the Counter.sol Contract**:

   - In the `contracts` repository, delete the `Lock.sol` contract and import the [Counter.sol](../contracts/Counter.sol) contract.

9. **Delete Test File**:

   - In the `test` repository, delete the `lock.js` test file.

10. **Create Test File**:

    - Create a new file named `Counter.js` in the `test` repository.

11. **Update package.json**:

    - Update `package.json` with the following:

      ```json
      {
        "name": "My_Solidity_Project",
        "version": "1.0.0",
        "description": "",
        "main": "index.js",
        "scripts": {
          "test": "echo \"Error: no test specified\" && exit 1"
        },
        "author": "blockchaindev@innovationweb3.io",
        "license": "MIT",
        "devDependencies": {
          "@nomicfoundation/hardhat-toolbox": "^1.0.2",
          "hardhat": "^2.10.1"
        }
      }
      ```

12. **Code for Testing Counter.sol Contract**:

    - Paste the following code in `Counter.js` file. For an in-depth explanation, refer to [Test File Explanation](./Test-Explanation/CounterTest.md).

      ```javascript
      {
        "name": "My_Solidity_Project",
        "version": "1.0.0",
        "description": "",
        "main": "index.js",
        "scripts": {
          "test": "echo \"Error: no test specified\" && exit 1"
        },
        "author": "blockchaindev@innovationweb3.io",
        "license": "MIT",
        "devDependencies": {
          "@nomicfoundation/hardhat-toolbox": "^1.0.2",
          "hardhat": "^2.10.1"
        },
        "dependencies": {
          "@openzeppelin/contracts": "^4.7.2"
        }
      }
      ```

## Conclusion

In this lesson, you've learned to set up a project, install dependencies, and conduct tests to ensure proper contract behavior before deployment. You have now completed this beginner's guide. If you're eager to get deeper into blockchain development, navigate back to the [Blockchain Hub](https://github.com/Innovation-Web-3-0-Blockchain) page for more advanced topics and resources.

Your journey into blockchain development has just begun!
