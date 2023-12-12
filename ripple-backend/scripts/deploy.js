// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const MembershipContract = await ethers.getContractFactory("MembershipContract");
  const membershipFee = ethers.parseEther("5"); // 5 XRP, assuming the XRP token has 18 decimals on the sidechain

  const contract = await MembershipContract.deploy(membershipFee);

  console.log("MembershipContract deployed to:", contract.target);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
      console.error(error);
      process.exit(1);
  });
