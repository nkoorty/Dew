require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    xrplsidechain: {
      url: "https://rpc-evm-sidechain.xrpl.org",
      chainId: 1440002,
      accounts: ['580894b3e853583391b8b49be21e4737f8ab81c82bba3d1ee8e6b7630be1b3f3'], // Uncomment and add your private key here
    }
  }
};
