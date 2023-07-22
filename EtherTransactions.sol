// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleFallbackContract {
    address public owner;
    uint256 public totBal;


    receive() external payable {
        totBal += msg.value;
    }

    function deposit() external payable {
        totBal += msg.value;
    }

    fallback() external payable {
        totBal += msg.value;
    }
}
