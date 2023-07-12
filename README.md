# Degen Token

Degen Token is an ERC20 token contract provides basic token functionality such as minting, transferring, burning, and redeeming tokens. The token can be used in the context of Degen Gaming, where players can earn tokens as rewards and redeem them for in-game items.

## Features

The Degen Token contract includes the following features:

1. Minting New Tokens: The platform owner can create and distribute new tokens to players as rewards.

2. Transferring Tokens: Players can transfer their tokens to other addresses.

3. Burning Tokens: Anyone can burn their own tokens if they are no longer needed.

4. Redeeming Tokens: Players can redeem their tokens for in-game items by providing the item ID and the required token balance.

5. Checking Token Balance: Players can check their token balance at any time.

## Usage

To use the Degen Token contract, follow these guidelines:

1. Minting Tokens: Only the owner can mint new tokens. Use the `mint` function and provide the recipient's address and the amount of tokens to be minted.

2. Transferring Tokens: Players can transfer their tokens to other addresses using the `transfer` function. Specify the recipient's address and the amount of tokens to be transferred.

3. Burning Tokens: Anyone can burn their own tokens using the `burn` function. Provide the amount of tokens to be burned.

4. Redeeming Tokens: Players can redeem their tokens for in-game items using the `redeemItem` function. Specify the item ID and the required token balance. The tokens will be deducted automatically.

5. Checking Token Balance: Players can check their token balance using the `balanceOf` function.

## Contributing

Contributions to the Degen Token project are welcome. If you find any issues or have suggestions for improvements, please submit a pull request or open an issue on GitHub.

## License

The Degen Token project is licensed under the MIT License. See the `LICENSE` file for more information.
