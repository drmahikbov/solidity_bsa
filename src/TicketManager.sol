// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "solmate/auth/Owned.sol";

contract TicketManager {
    // Store the price
    uint256 price;
    address owner;
    // Create an associative array with a bool which defaults to false
    mapping(address => bool) tickets;

    // Initialize the price from the constructor
    constructor(uint256 _price, address _owner) {
        price = _price;
        owner = _owner;
    }

    // Setter method
    function setPrice(uint256 newPrice) public onlyOwner {
        price = newPrice;
    }

    // Modifiers are code that can be run before and / or after a function call.
    // Create modifier so the only person who can call the contract is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You're not authorized bro");
        _;
    }

    // Anyone can send money and the function has to be accessible by everyone
    function buyTicket() public payable {
        // The msg object is publicly accessible in order to retrieve information about the caller
        // Check if there is enough money and go through with the transaction if it does
        require(price == msg.value, "The price is not right");
        tickets[msg.sender] = true;
    }

    // Check if the person
    function hasTicket(address person) public view returns (bool) {
        return tickets[person];
    }
}
