// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract PurchaseItem {
    address public seller;
    address public buyer;
    uint256 public price;
    uint256 public quant;
    uint256 public totCost;

    constructor(address S1, uint256 P1, uint256 Q1) {
        require(S1 != address(0), "Enter a valid sender address");
        require(P1 > 0, "Enter Price greater than zero");
        require(Q1 > 0, "Enter Quantity greater than zero");

        seller = S1;
        buyer = msg.sender;
        price = P1;
        quant = Q1;
        totCost = price * quant;
    }

    event PurchaseCompleted(address indexed buyer, uint256 quantity);

    function itemSold() external payable {
        uint256 amtPaid = msg.value;
        require(amtPaid == totCost, "Payment pending");

        emit PurchaseCompleted(msg.sender, quant);

        (bool Bill, ) = seller.call{value: amtPaid}("Bill is paid");
        require(Bill, "Transaction failed");
    }

    function CancelPurchase() external {
        require(msg.sender == buyer, "Customer shall cancel the purchase");

        (bool Bill, ) = payable(buyer).call{value: totCost}("Amount refunded");
        assert(Bill);

        selfdestruct(payable(buyer));
    }

    function Withdrawal(uint256 wamt) external {
        require(msg.sender == seller, "Owner shall withdraw amount");

        uint256 bal = address(this).balance;
        if(bal > wamt)
        {
            revert("Insufficient Balance");
        }

        (bool Bill, ) = payable(seller).call{value: wamt}("Amount Withdrew");
        require(Bill, "Withdrawal failed");
    }
}
