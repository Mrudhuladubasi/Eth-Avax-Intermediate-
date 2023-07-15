// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract functions_
{
    uint public value;


    function setValue(uint _value) internal  {
        value = _value;
    }

    function getValue() internal view returns (uint) {
        return value;
    }

    function add(uint _a, uint _b) internal pure returns (uint) {
        return _a + _b;
    }

    function withdraw() public payable
    {
        // Withdraw Ether from the contract
        
    }
}


contract Xyzz is functions_ {
    // Inherited contracts can access the view, pure, and payable functions
    function Abccc() public pure returns (uint)
    {
        return add(10, 20);
    }
}
