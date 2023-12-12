// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoyaltyContract {
    address public owner;
    mapping(address => uint) public purchaseCounts;

    uint public requiredPurchases;
    
    event PurchaseRecorded(address indexed customer, uint count);

    constructor(uint _requiredPurchases) {
        owner = msg.sender;
        requiredPurchases = _requiredPurchases;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function recordPurchase(address customer) public onlyOwner {
        purchaseCounts[customer]++;
        emit PurchaseRecorded(customer, purchaseCounts[customer]);
    }

    function hasReachedLoyalty(address customer) public view returns (bool) {
        return purchaseCounts[customer] >= requiredPurchases;
    }
}
