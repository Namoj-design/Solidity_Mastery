// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract LearnAssembly {

    // Example: simple add using assembly
    function addToEVM(uint x, uint y) external pure returns (uint) {
        uint z;
        assembly {
            z := add(x, y)
        }
        return z;
    } 

    // Example: check if an address is a contract or not
    function addToEVM2(address addr) public view returns(bool success) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }
    
    // Exercise: convert bytes -> bytes32 using mload
    function addToEVM3() external pure returns (bytes32) {
        bytes memory data = new bytes(10);
        bytes32 dataB32;
        assembly {
            dataB32 := mload(add(data, 32))
        }
        return dataB32;
    }
}