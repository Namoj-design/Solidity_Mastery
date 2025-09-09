// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract A {
        uint public innerVal = 100; // make it public so it can be accessed by derived contracts
    
    // constant 
    function innerAddTen(uint val) public pure returns (uint) {
        return val + 10;
    } 
}
contract B is A {
    function outerAddTen(uint val) public pure returns (uint) {
        // directly call the inherited function
        return innerAddTen(val);
    }
    
    function getInnerVal() public view returns(uint) {
        // directly return inherited variable
        return innerVal;
    } 
}