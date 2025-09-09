// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Owner {
    address owner;
    
    constructor() {
        owner = msg.sender; 
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }
    
    modifier costs(uint price) {
        require(msg.value >= price, "Insufficient funds");
        _;
    }
}

contract Register is Owner {
   mapping (address => bool) registeredAddresses;
   uint price;
   
   constructor(uint initialPrice) {
       price = initialPrice; 
   }
   
   function register() public payable costs(price) {
      registeredAddresses[msg.sender] = true;
   }
   
   function changePrice(uint _price) public onlyOwner {
      price = _price;
   }
}