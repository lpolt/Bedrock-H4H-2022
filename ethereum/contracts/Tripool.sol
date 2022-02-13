// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Tripool {
    // Deployments
    address constant StableSwap3Pool =
        0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7;

    //	address constant CurveContractV2 = 0x6c3F90f043a72FA612cbac8115EE7e52BDe6E490;
    //	address constant LiquidityGauge = 0xbFcF63294aD7105dEa65aA58F8AE5BE2D9d0952A;

    // StableCoins
    address constant DAI = 0x6b175474e89094c44da98b954eedeac495271d0f;
    address constant USDC = 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48;
    address constant USDT = 0xdac17f958d2ee523a2206206994597c13d831ec7;

    function getStableCoins() internal view returns (address[3] memory) {
        address[3] memory coins = [DAI, USDC, USDT];
        return coins;
    }
}
