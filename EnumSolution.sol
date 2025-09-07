// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0; 
contract enumsLearn {
    enum frenchFriesSize {LARGE, MEDIUM, SMALL}
    frenchFriesSize friesSize;
    function setSmall() public {
        friesSize = frenchFriesSize.SMALL;
    }
    
    enum shirtColor {RED, WHITE, BLUE}
    shirtColor choice;
    shirtColor constant defaultChoice = shirtColor.BLUE;
    
    function setWhite() public {
        choice = shirtColor.WHITE;
    }
    
    function getChoice() public view returns(shirtColor) {
        return choice;
    }
    
        function getDefaultChoice() public pure returns(uint) {
        return uint(defaultChoice);
    }
}