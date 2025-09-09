// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library Search {
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for (uint i = 0; i < self.length; i++) if (self[i] == value) return i;
        revert("Value not found");
    }
}

contract Test {
    uint[] data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }
    function isValuePresent(uint val) external view returns(uint) {
        return Search.indexOf(data, val);
    }
}

library Search2 {
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for (uint i = 0; i < self.length; i++) if (self[i] == value) return i;
        revert("Value not found");
    }
}

contract Test2 {
    using Search2 for uint[];
    uint[] data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }
    function isValuePresent() external view returns(uint) {
        return data.indexOf(4);
    }
}