// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract Beta {
    uint public uid;
    address public class;
    uint public fee;

    function setData(uint uid1) public payable {
        uid = uid1;
        class = msg.sender;
        fee = msg.value;
    }
}

contract Alpha {
    uint public uid;
    address public class;
    uint public fee;

    function setData(address proxy_contract, uint uid1) public payable returns (bool)
    {
        (bool success,) = proxy_contract.delegatecall(abi.encodeWithSignature("setData(uint256)", uid1));
        return success;
    }
}
