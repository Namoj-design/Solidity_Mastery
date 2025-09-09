// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Vendor {
    address public seller;

    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can perform this action!");
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint amount) public payable onlySeller {
        if (msg.value < amount) {
            revert("Not enough Ether provided to complete the purchase!");
        }
    }
}