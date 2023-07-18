// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract eventsTriggering
{
    mapping(address => uint) private balances;

    event Deposit(address indexed owner, uint amount);
    event Withdraw(address indexed owner, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);

    function deposit(address _account, uint _number) public payable {
        balances[_account] += _number;
        emit Deposit(_account, _number);
    }

    function withdraw(address _account, uint _number) public payable {
        require(balances[_account] > 0, "No Balance left");
        balances[_account] -= _number;
        emit Withdraw(_account, _number);
    }

    function transfer(address _from, address _to, uint _number) public payable {
        require(balances[_from] >= _number, "No sufficient funds for this transaction");
        balances[_from] -= _number;
        balances[_to] += _number;
        emit Transfer(_from, _to, _number);
    }

    function getBalance(address _address) public view returns(uint) {
        return balances[_address];
    }
}


//capturing the event using JS:

const contract = new web3.eth.contract(abi);
contract.on("Deposit", (event) => {
  console.log("Deposit event emitted:", event);
});
contract.on("Withdraw", (event) => {
  console.log("Withdraw event emitted:", event);
});
contract.on("Transfer", (event) => {
  console.log("Transfer event emitted:", event);
});
