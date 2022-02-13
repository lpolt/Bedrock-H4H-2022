// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Tripool.sol";
import "./CurveInterface.sol";

contract Bedrock is ERC20 {
	address immutable Curve3Pool;

	event successfulDeposit(
		uint256 indexed daiAmount,
		address indexed sender,
		uint256 indexed lpAmount
	);

	event successfulWithdraw(
		uint256 indexed daiAmount,
		address indexed sender,
		uint256 indexed lpAmount
	);

	/**
	 * @notice Instantiate Bedrock
	 * @param _curve3Pool Curve 3Pool contract
	 */
	constructor (address _curve3Pool) {
		Curve3Pool = _curve3Pool;
	}

	// deposit daiAmount and return amount of LP tokens received
	function deposit(uint256 daiAmount) external returns(uint256 lpAmount) {
		address[3] memory stablecoins = Tripool.getStableCoins();
		uint256[3] memory amounts = [daiAmount, 0, 0];

		for (uint256 i = 0; i < coins.length; i++) {
			IERC20(stablecoins[i]).safeTransferFrom(msg.sender, address (this), amounts[i]);
			IERC20(stablecoins[i]).safeApprove(Curve3Pool, amounts[i]);
		}

		uint256 memory lpTokenAmount = CurveInterface(Curve3Pool).add_liquidity(amounts, 0);
		emit successfulDeposit(daiAmount, msg.sender, lpAmount);
		return lpAmount;
	}

	function withdraw(uint256 daiAmount) external returns(uint256 lpAmount) {

	}
}