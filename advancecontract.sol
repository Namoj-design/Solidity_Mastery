// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract C {
    // private state variable
    uint private data;
    
    // public state variable
    uint public info;

    // constructor initializes info
    constructor() {
        info = 10;
    }

    // private function: only usable inside C
    function increment(uint a) private pure returns(uint) { 
        return a + 1; 
    }
    
    // public functions
    function updateData(uint a) public { 
        data = a; 
    }

    function getData() public view returns(uint) { 
        return data; 
    }

    // internal function: usable inside C or derived contracts
    function compute(uint a, uint b) internal pure returns (uint) { 
        return a + b; 
    }
}

// External contract D
contract D {
    C c = new C();

    // public read-only function to get info from C
    function readInfo() public view returns(uint) {
        return c.info();
    }
}

// Contract E inherits from C
contract E is C {
    uint private result;   // can only be used internally (not even by derived contracts)
    C private c;           // private instance of C

    // constructor initializes c
    constructor() {
        c = new C();
    }  

    // public function: compute 23 + 5 and store in result
    function getComputedResult() public {      
        result = compute(23, 5); 
    }

    // public getter for result
    function getResult() public view returns(uint) { 
        return result; 
    }

    // public read-only function to return info from C
    function getNewData() public view returns(uint) { 
        return c.info(); 
    }
}