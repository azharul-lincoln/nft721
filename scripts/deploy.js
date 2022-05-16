const { ethers } = require("hardhat");


async function main() {
  const SuperMarioWorld = await ethers.getContractFactory("SuperMarioWorld");
  const superMarioWorld = await SuperMarioWorld.deploy("SuperMarioWorld", "SPMW");

  await superMarioWorld.deployed();
  
  console.log("Sucess! Contract was deployed to: ", superMarioWorld.address);

  await superMarioWorld.mint(
    "https://ipfs.io/ipfs/QmeX9DWdk4nt46CHR5AsezRywjg6AX8km8aic5aqNikA5e"
  );
  console.log("NFT succesfully minted! ");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
