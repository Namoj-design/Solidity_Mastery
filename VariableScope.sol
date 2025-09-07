// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0<0.9.0;
contract C {
    
    uint public data = 10; 
    
    function x() external pure returns (uint) {
        uint newData = 25;
        return newData;
    }
    
    function l() public view returns(uint) {
        uint newData = data - 3;
        return newData;
    }
    
    
    function y() public view returns (uint) {
        return data;
    }
    
}

contract D {
    C c = new C();
    
    function f() public view returns (uint) {
        return c.l();
    }
    
}