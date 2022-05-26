require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.2",
  networks: {
    matic: {
      // url: process.env.MUMBAI_RPC,
      // accounts: [process.env.PRIVATE_KEY],
      url: `https://matic-mumbai.chainstacklabs.com`,
      // accounts: [
      //mac
      //   `63f7c35a541128d7877571780dd749613214afefb892af9377831b746aaafcfb`,
      // ],
      // minted at 0x42eaF1F211Ae14b8Aa5E7578b7EDa66B374a7cc9
      accounts: [
        "edd7f4be23e4d132e3721c6127e167c508664c238065836bbd9c1667777385dd",
      ],
    },
    ropsten: {
      // url: process.env.ROPSTEN_URL,
      // account: [process.env.PRIVATE_KEY_ROPSTEN],
      url: `https://ropsten.infura.io/v3/f5022f29843448fa888b9c147656f66a`,
      accounts: [
        `63f7c35a541128d7877571780dd749613214afefb892af9377831b746aaafcfb`,
      ],
    },
  },
};
