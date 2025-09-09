// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Auction {
    address payable public beneficiary;
    uint public auctionEndTime;

    // current state of the auction
    address public highestBidder;
    uint public highestBid;
    bool public ended;

    mapping(address => uint) public pendingReturns;

    event HighestBidIncreased(address indexed bidder, uint amount);
    event AuctionEnded(address indexed winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary) {
        require(_biddingTime > 0, "Bidding time must be > 0");
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() external payable {
        require(block.timestamp <= auctionEndTime, "The auction has ended");
        require(msg.value > highestBid, "There already is a higher or equal bid");

        if (highestBid != 0) {
            // previous highest bidder can withdraw their previous bid
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    // Withdraw bids that were overbid. Returns true if successful.
    function withdraw() external returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount == 0) {
            return true;
        }

        // Effects
        pendingReturns[msg.sender] = 0;

        // Interaction (forward all available gas, check result)
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        if (!success) {
            // Revert state on failure
            pendingReturns[msg.sender] = amount;
            return false;
        }
        return true;
    }

    // End the auction and send the highest bid to the beneficiary
    function auctionEnd() external {
        require(block.timestamp >= auctionEndTime, "The auction is not yet ended");
        require(!ended, "auctionEnd has already been called");

        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        if (highestBid > 0) {
            (bool sent, ) = beneficiary.call{value: highestBid}("");
            require(sent, "Failed to send funds to beneficiary");
        }
    }

    // Convenience: return contract balance
    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }
}