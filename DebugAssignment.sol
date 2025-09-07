// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract LearnFunctions {
    uint public a = 45;

    function remoteControlOpen(bool closedDoor, bool openDoor) public pure returns (bool) {
        return (closedDoor && openDoor);
    }

    function addValues() public view returns (uint) {
        uint b = 3;
        uint result = a + b;
        return result;
    }

    function addNewValues() public pure returns (uint) {
        uint aTemp = 45;
        uint b = 5;
        uint result = aTemp + b;
        return result;
    }

    function multiplyCalculatorByFour(uint x) public pure returns (uint) {
        return x * 4;
    }

    function divideCalculatorByFour(uint x) public pure returns (uint) {
        return x / 4;
    }
}