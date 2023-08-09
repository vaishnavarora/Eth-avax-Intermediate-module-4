// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Struct to represent an item
    struct Item {
        string name;
        uint256 price;
    }

    // Mapping to store items by their ID
    mapping(uint256 => Item) private items;
    // Counter to keep track of the number of items

    uint256 private itemCount;

    // Constructor to initialize the token with name "Degen" and symbol "DGN"
        constructor() ERC20("Degen", "DGN") {
        // _mint(msg.sender, 2000 );
    
    }

    // Function to mint new tokens and assign them to an address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the sender's address
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Override of the transfer function to include a check for the sender's balance
    function transfer(address to, uint256 amount) public override returns (bool) {
        return super.transfer(to, amount);
    }

    // Function to insert a new item into the mapping
    function insertItem(string memory name, uint256 price) public onlyOwner {
        itemCount++;
        items[itemCount] = Item(name, price);
    }

    // Function to retrieve the details of an item by its ID
    function getItem(uint256 itemId) public view returns (string memory, uint256) {
        require(itemId <= itemCount, "Invalid item ID");
        Item memory item = items[itemId];
        return (item.name, item.price);
    }

    // Function to get the total number of items
    function getItemCount() public view returns (uint256) {
        return itemCount;
    }

    // Function to display all the items with their details
    function showItems() public view returns (string memory) {
        string memory allItems;
        
        for (uint256 i = 1; i <= itemCount; i++) {
            (string memory itemName, uint256 itemPrice) = getItem(i);
            allItems = string(abi.encodePacked(allItems, uintToString(i), ": ", itemName, " - Price: ", uintToString(itemPrice), "\n"));
        }
        
        return allItems;
    }

    // Function to redeem an item by its ID
    function redeemItem(uint256 itemId) public {
        require(itemId <= itemCount, "Invalid item ID");
        Item memory item = items[itemId];
        require(item.price <= balanceOf(msg.sender), "Insufficient balance");

        _burn(msg.sender, item.price);
        // Perform item redemption logic here
    }

    // Utility function to convert a uint to a string
    function uintToString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        
        uint256 temp = value;
        uint256 digits;
        
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        
        bytes memory buffer = new bytes(digits);
        
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        
        return string(buffer);
    }
}
