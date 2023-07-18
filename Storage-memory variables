// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract storage_memory_var {
    uint256 public strData;  // Storage variable - created outside function blocks

    function setData(uint256 val) external {
        strData = val;
    }

    function getData() external view returns (uint256) {
        uint256 tempData;  // Memory variable - created inside  function blocks

        tempData = strData + 5;
        return tempData;
    }
}
