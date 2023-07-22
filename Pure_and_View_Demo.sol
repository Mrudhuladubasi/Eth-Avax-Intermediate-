// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract SimpleFunctions {
    function add(uint256 a, uint256 b) public pure returns (uint256)
    {
        return a + b;
    }

    function getAddress() public view returns (address) {
        return address(this);
    }
}
