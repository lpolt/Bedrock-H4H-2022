// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Tripool.sol";
import "./CurveInterface.sol";

contract Bedrock is ERC20 {
    using SafeERC20 for IERC20;

    address immutable Curve3Pool;

    event successfulDeposit(
        uint256 indexed daiAmount,
        address indexed sender,
        uint256 indexed lpAmount
    );

    event successfulWithdraw(
        uint256 indexed lpAmount,
        address indexed sender,
        uint256 indexed daiAmount
    );

    /**
     * @notice Instantiate Bedrock
     * @param _curve3Pool Curve 3Pool contract
     */
    constructor(address _curve3Pool) {
        Curve3Pool = _curve3Pool;
    }

    // deposit daiAmount and return amount of LP tokens received
    function deposit(uint256 daiAmount) external returns (uint256 lpAmount) {
        address[3] memory stablecoins = Tripool.getStableCoins();
        uint256[3] memory amounts = [daiAmount, 0, 0];

        for (uint256 i = 0; i < coins.length; i++) {
            IERC20(stablecoins[i]).safeTransferFrom(
                msg.sender,
                address(this),
                amounts[i]
            );
            IERC20(stablecoins[i]).safeApprove(Curve3Pool, amounts[i]);
        }

        uint256 memory lpTokenAmount = CurveInterface(Curve3Pool).add_liquidity(
            amounts,
            0
        );
        emit successfulDeposit(daiAmount, msg.sender, lpAmount);
        return lpAmount;
    }

    function withdraw(uint256 lpAmount) external returns (uint256 daiAmount) {
        require(
            balanceOf(msg.sender) >= lpAmount,
            "Insufficient LP Token balance."
        );
        address[3] memory stablecoins = Tripool.getStableCoins();

        uint256[3] memory minAmounts = [0, 0, 0];
        uint256[3] amounts = CurveInterface(Curve3Pool).remove_liquidity(
            lpAmount,
            minAmounts
        );

        for (uint256 i = 0; i < coins.length; i++) {
            IERC20(stablecoins[i]).safeTransferFrom(
                address(this),
                msg.sender,
                amounts[i]
            );
            IERC20(stablecoins[i]).safeApprove(Curve3Pool, amounts[i]);
        }

        emit successfulWithdraw(lpAmount, msg.sender, amounts[0]);
        return amounts[0];
    }
}
