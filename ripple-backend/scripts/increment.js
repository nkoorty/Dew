const { ethers } = require("hardhat");

async function incrementPurchase(contractAddress, customerAddress) {
    const [signer] = await ethers.getSigners();

    const LoyaltyContract = await ethers.getContractFactory("LoyaltyContract");
    const contract = LoyaltyContract.attach(contractAddress);

    const transaction = await contract.recordPurchase(customerAddress, { from: signer.address });

    await transaction.wait();

    console.log(`Transaction confirmed: ${transaction.hash}`);
}

async function main() {
    const contractAddress = "0x68e0556b9A3dAEF5b78Ef66c7686980fdf39FA87";
    const customerAddress = "0xBdd509667c30c04bBA844819373fa028A0ED3294"; 

    await incrementPurchase(contractAddress, customerAddress);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
