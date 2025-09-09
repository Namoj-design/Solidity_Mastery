// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract RestrictedAccess {
    
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;
    
    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not authorized!");
        _;
    } 
    
    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time, "Function is called too early!");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough Ether provided");
        _;
    }
    
    function changeOwnerAddress(address _newAddress) public onlyBy(owner) {
        owner = _newAddress;
    }
    
    function disown() public onlyBy(owner) onlyAfter(creationTime + 5 weeks) {
        delete owner;
    } 
    
    function forceOwnerChange(address _newOwner) public payable costs(200 ether) {
        owner = _newOwner;
    }

    // Extra: Let the owner withdraw ETH collected in this contract
    function withdraw() public onlyBy(owner) {
        payable(owner).transfer(address(this).balance);
    }
}