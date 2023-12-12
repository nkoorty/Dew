// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    const LoyaltyContract = await ethers.getContractFactory("LoyaltyContract");
    const requiredPurchases = 10; // The number of purchases required for loyalty

    const contract = await LoyaltyContract.deploy(requiredPurchases);

    console.log("LoyaltyContract deployed to:", contract.target);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
