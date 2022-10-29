// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract TicketManager {
    // Store the price
    uint256 price;
    // Create an associative array with a bool which defaults to false
    mapping(address => bool) tickets;

    // Initialize the price from the constructor
    constructor(uint256 _price) {
        price = _price;
    }

    // Anyone can send money and the function has to be accessible by everyone
    function buyTicket() public payable {
        // The msg object is publicly accessible in order to retrieve information about the caller 
        require(price == msg.value, "The price is not right");
        tickets[msg.sender] = true;
    }

    // Check if the person 
    function hasTicket(address person) public view returns (bool) {
        return tickets[person];
    }
}
