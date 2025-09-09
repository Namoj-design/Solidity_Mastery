// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Example abstract + derived

abstract contract Member {
    string name;
    uint age = 3;
    
    // Abstract function: no body, marked virtual
    function setName() public virtual returns (string memory);
    
    function returnAge() public view returns(uint) {
        return age;
    } 
}

contract Teacher is Member {
    function setName() public pure override returns (string memory) {
        return "Francesca";
    }
}

abstract contract Calculator {
    // Abstract function (no implementation here)
    function getResult() public view virtual returns(uint);
}

contract Test is Calculator {
    // Override and implement
    function getResult() public pure override returns(uint) {
        uint a = 1;
        uint b = 2;
        return a + b;
    }
}