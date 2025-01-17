# Digital Property Smart Contract - RWA

## Overview

The **Digital Property Smart Contract** is a blockchain-based solution designed for registering and managing ownership of digital or real-world assets. Built with Solidity, this contract ensures transparency, security, and immutability in asset ownership and transfers.

This project was developed and tested using **Remix IDE**, making it easy to deploy and interact with the smart contract directly in a web browser.

---

## Features

- **Asset Registration**: Allows users to register properties with a unique ID and description.
- **Ownership Transfer**: Owners can transfer properties to other users securely.
- **Ownership Verification**: Anyone can verify the current owner of a property.
- **Event Logging**: All important actions, such as registration and transfer, trigger blockchain events for transparency.

---

## Smart Contract Details

### Functions

1. **`registerProperty(uint256 id, string memory description)`**
   - Registers a property with a unique identifier and description.
   - Emits the `PropertyRegistered` event.

2. **`transferOwnership(uint256 id, address newOwner)`**
   - Transfers ownership of a registered property to another user.
   - Emits the `OwnershipTransferred` event.

3. **`getProperty(uint256 id)`**
   - Retrieves details of a registered property, including its ID, description, and current owner.

### Events

- **`PropertyRegistered(uint256 id, string description, address owner)`**
- **`OwnershipTransferred(uint256 id, address previousOwner, address newOwner)`**

### Additional Functions for Flexibility
- **`fallback()`**: Handles unexpected or undefined function calls.
- **`receive()`**: Allows the contract to receive ether directly.

---

## How to Use

### Prerequisites

- **Remix IDE**: Accessible via [https://remix.ethereum.org](https://remix.ethereum.org).

### Steps to Deploy and Test in Remix IDE

1. **Open Remix IDE**
   - Go to [Remix IDE](https://remix.ethereum.org).

2. **Create the Smart Contract File**
   - In the File Explorer, create a new file (e.g., `PropertyRegistry.sol`).
   - Copy and paste the smart contract code into the file.

3. **Compile the Contract**
   - Navigate to the **Solidity Compiler** tab.
   - Select a compiler version compatible with the code (e.g., `0.8.x`), in my case i used 0.8.24 .
   - Click **Compile PropertyRegistry.sol**.

4. **Deploy the Contract**
   - Go to the **Deploy & Run Transactions** tab.
   - Select the environment:
     - **Remix VM (Cancun)** for local testing.
   - Click **Deploy** to deploy the contract.

5. **Interact with the Contract**
   - Use the deployed contract interface to call functions like `registerProperty` and `transferOwnership`.

---

## Testing the Contract

### Functional Tests

1. **Basic Registration**
   - Call `registerProperty` with:
     - `id = 1`
     - `description = "House in Marbella"`
   - Use `getProperty(1)` to confirm that the property is correctly stored.

2. **Ownership Transfer**
   - Call `transferOwnership` on a registered property to transfer ownership to another address.
   - Verify that the ownership has changed using `getProperty`.

3. **Duplicate IDs**
   - Try registering another property with the same ID. The contract should reject the transaction.

---

### Security Tests

1. **Unauthorized Access**
   - Attempt to transfer ownership of a property from a non-owner account. The transaction should fail.

2. **Invalid Addresses**
   - Test transferring a property to the `0x0` address. The contract should reject the transaction.

---

### Edge Case Tests

1. **High and Low IDs**
   - Register properties with extremely high or low ID values (e.g., `0`, `2**256 - 1`).

2. **Long Descriptions**
   - Register a property with a very long description to check if the contract handles large strings.

---

## Example Code Snippets

### Registering a Property
```solidity
registerProperty(1, "Apartment in Barcelona");
```

### Transferring Ownership
```solidity
transferOwnership(1, 0x123456789abcdef123456789abcdef123456789a);
```

### Checking Property Details
```solidity
getProperty(1);
```

---
