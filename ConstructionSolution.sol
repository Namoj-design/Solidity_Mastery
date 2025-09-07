// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Member {
    string internal name;
    uint internal age;
    
    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}

contract Teacher is Member {
    constructor(string memory n, uint a) Member(n, a) {}

    function getName() public view returns (string memory) {
        return name;
    }

    function getAge() public view returns (uint) {
        return age;
    }
}

contract Base {
    uint internal data;

    constructor(uint _data) {
        data = _data;   
    }
}

contract Derived is Base {
    constructor() Base(5) {}

    function getData() public view returns (uint) {
        return data;
    }
}