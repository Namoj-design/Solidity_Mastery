// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Fundraiser {
    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Investors deposit Ether
    function contribute() external payable {
        balances[msg.sender] += msg.value;
    }

    // Instead of owner refunding, each investor withdraws their own funds
    function withdraw() external returns (bool success) {
        uint amount = balances[msg.sender];
        require(amount > 0, "No funds to withdraw");

        balances[msg.sender] = 0; // Effects
        (bool sent, ) = payable(msg.sender).call{value: amount}(""); // Interaction
        require(sent, "Withdrawal failed");
        return true;
    }

    // Check contract balance
    function getContractBalance() external view returns(uint) {
        return address(this).balance;
    }
}