pragma solidity ^0.8.0;

interface CurveInterface {
    // current price of the pool LP token
    function get_virtual_price() external view returns (uint256);

    // current swap fee of the pool
    function fee() external view returns (uint256);

    // calculate addition or reduction in token supply
    function calc_token_amount(uint256[3] memory, bool)
        external
        view
        returns (uint256);

    // deposit coins into the pool
    function add_liquidity(uint256[3] memory, uint256)
        external
        view
        returns (uint256);

    // withdraw coins from the pool
    function remove_liquidity(uint256, uint256[3] memory)
        external
        view
        returns (uint256[3]);
}
