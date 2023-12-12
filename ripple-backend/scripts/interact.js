// scripts/interact.js
const { ethers } = require("hardhat");

async function main() {
    const contractAddress = '0xACd5aC34c71F5037e20351787f13c63a1efC3661';
    const Contract = await ethers.getContractFactory("MembershipContract");
    const contract = await Contract.attach(contractAddress);

    const membershipFee = await contract.membershipFee();

    const txJoin = await contract.joinSociety({ value: membershipFee });
    await txJoin.wait();
    console.log(`Transaction confirmed: ${txJoin.hash}`);

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
