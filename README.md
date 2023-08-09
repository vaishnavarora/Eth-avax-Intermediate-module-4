# Eth-avax-Intermediate-module-4

## DegenToken

DegenToken is an ERC-20 token smart contract developed for Degen Gaming on the Avalanche blockchain. The token allows players to earn rewards in the game and exchange them for in-game store items. The contract follows the ERC-20 standard and includes additional functionalities to support the reward program and item redemption.

## Functionality

The DegenToken contract provides the following functionalities:

1. The contract owner has the ability to create new tokens and allocate them to particular addresses.
2. Burning tokens: If a token holder no longer needs their tokens, they may burn them.
3. Token transfers: Players have the option of sending their tokens to different addresses.
4. Item redemption: Players can use their tokens to buy stuff from the in-game shop.
5. Players have the option to check their token balance at any moment.
6. Adding new things: New items may be added to the in-game store by the contract owner.
7. Seeing the items: Players can see the products that are offered and their specifications.

## Getting Started

To deploy and interact with the DegenToken contract, follow these steps:

1. Using Remix or another development environment of your choice, deploy the contract on the Avalanche blockchain.
2. During contract deployment, specify the token's name and symbol.
3. Using the `mint` function, mint initial tokens and send them to the desired addresses.
4. Use the `insertItem` function to add things to the game's in-game store.
5. Tokens can be exchanged, burned, and transferred as needed.
6. The `showItems` method allows players to view the things that are available as well as their specifications.
7. The `redeemItem` function allows players to redeem items by their ID.

## Authors
Vaishnav Arora

## License

This contract is licensed under the MIT License. SPDX-License-Identifier: MIT.
