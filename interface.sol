// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint public count;
    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }
    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns (uint reserveA, uint reserveB, uint32 blockTimestampLast);
}

contract UniswapExercise {
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;    
    address private constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;   
    address private constant factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    function getTokenReserves() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(DAI, WETH9);
        (uint reserveA, uint reserveB, ) = UniswapV2Pair(pair).getReserves();
        return (reserveA, reserveB);
    }
}