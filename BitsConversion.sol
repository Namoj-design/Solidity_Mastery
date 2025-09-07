// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
contract learnConversions {
 uint number = 2;
uint32 a = 0x12345678;
uint16 b = uint16(a); 
uint16 c = 0x1234;
uint32 d = uint32(c);
bytes2 e = 0x1234;
bytes1 f = bytes1(e); 
bytes2 g = 0x1234;
bytes4 h = bytes4(g);  
}