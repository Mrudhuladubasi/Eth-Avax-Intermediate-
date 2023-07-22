// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

// Abstract contract
abstract contract Animal {
    string public species;
    uint256 public age;

    function Sound() external virtual returns (string memory);
}

// Interface
interface Flying {
    function fly() external;
}

//Implementing abstract contract and interface
contract Bird is Animal, Flying {
    string public name;
    bool public isFlying;

    constructor(string memory _species, uint256 _age, string memory _name) {
        species = _species;
        age = _age;
        name = _name;
    }

    function Sound() external override pure returns (string memory) {
        return "Chirp chirp!";
    }

    function fly() external override {
        isFlying = true;
    }

    function stopFlying() external {
        isFlying = false;
    }
}
