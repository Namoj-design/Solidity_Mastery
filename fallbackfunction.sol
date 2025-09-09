// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FallBack {
    
    event Log(uint gas);
    event Received(uint amount);

    // Special receive function (for plain Ether transfers)
    receive() external payable {
        emit Received(msg.value);
    }

    // Fallback function (when no function matches or data is sent)
    fallback() external payable {
        emit Log(gasleft());
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}