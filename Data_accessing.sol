// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract admin {
    address public _admin;
    uint public data;

    function Data() public {
        _admin = msg.sender;
    }

    modifier onlyAdmin {
        require(msg.sender == _admin);
        _;
    }

    function setData(uint _data) public  onlyAdmin {
        data = _data;
    }
}
