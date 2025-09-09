// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract RefundVault {
    address public owner;
    mapping(address => uint) public balance;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Allow users to deposit funds (simulating investment)
    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    // Example of owner trying to refund Tatiana
    function sendRefund(address payable tatiana, uint amount) external onlyOwner returns(bool success) {
        // using send (returns bool, doesn't revert automatically)
        if(!tatiana.send(amount)) {
            // handle failure: re-credit balance
            balance[tatiana] += amount;
            return false;
        }
        return true;
    }

    // Investors claim refund themselves (withdrawal pattern)
    function claimRefund() external {
        uint refundAmount = balance[msg.sender];
        require(refundAmount > 0, "No balance to withdraw");

        balance[msg.sender] = 0; // optimistic accounting
        payable(msg.sender).transfer(refundAmount);
    }

    // Withdraw specific amount (safe pattern)
    function withdrawFunds(uint amount) external returns(bool success) {
        require(balance[msg.sender] >= amount, "Insufficient balance");

        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        return true;
    }
}