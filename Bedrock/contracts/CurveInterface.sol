// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import {SafeMath} from "@openzeppelin/contracts/math/SafeMath.sol";
import {StrategyLib} from "./StrategyLib.sol";

contract ICurveFi_DepositY { 

    function add_liquidity(uint256[4] calldata uamounts, uint256 min_mint_amount) external;
    function remove_liquidity(uint256 _amount, uint256[4] calldata min_uamounts) external;
    function remove_liquidity_imbalance(uint256[4] calldata uamounts, uint256 max_burn_amount) external;

    function coins(int128 i) external view returns (address);
    function underlying_coins(int128 i) external view returns (address);
    function underlying_coins() external view returns (address[4] memory);
    function curve() external view returns (address);
    function token() external view returns (address);
    }

contract Bedrock_1 {




    function Bdeposit(uint256 amount) public {

        uint256 crvAlloc = (amount*.96);

        

    }

}

contract Btoken is ERC20 {

constructor() public {

}

}