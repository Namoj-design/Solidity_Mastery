// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract LearnFunctions {
    uint a = 45;
    uint b = 4;

    function remoteControlOpen(bool closedDoor, bool openDoor) public pure returns (bool) {
        return (closedDoor && openDoor);
    }

    function addValues() public view returns (uint) {
        uint localB = 3;
        uint result = a + localB;
        return result;
    }

    function addNewValues() public view returns (uint) {
        uint localB = 5;
        uint result = a + localB;
        return result;
    }

    function multiplyCalculatorByFour(uint x) public view returns (uint) {
        uint result = x * b;
        return result;
    }

    function divideCalculatorByFour(uint x) public view returns (uint) {
        uint result = x / b;
        return result;
    }
}