const { ethers } = require("hardhat");

async function main() {
  const SuperMarioWorldCullection = await ethers.getContractFactory(
    "SuperMarioWorldCullection"
  );

  const superMarioWorldCullection = await SuperMarioWorldCullection.deploy(
    "SuperMarioWorldCullection",
    "SPMWC",
    "https://ipfs.io/ipfs/Qmb6tWBDLd9j2oSnvSNhE314WFL7SRpQNtfwjFWsStXp5A/"
  );

  await superMarioWorldCullection.deployed();

  console.log(
    "Sucess! Contract was deployed to: ",
    superMarioWorldCullection.address
  );

  // await superMarioWorldCullection.mint(
  //   "https://ipfs.io/ipfs/QmYoVjXNGbAVHKucFJ3xw8MMxWqFXHtyWPLzf4EB8aLW4f"
  // );

  await superMarioWorldCullection.mint(10); // 1 Mario
  await superMarioWorldCullection.mint(10); // 2 Luigi
  await superMarioWorldCullection.mint(10);
  await superMarioWorldCullection.mint(10);
  await superMarioWorldCullection.mint(1); // 5 Mario Gold (rare)
  await superMarioWorldCullection.mint(1); // 6 Luigi Gold (rare)
  await superMarioWorldCullection.mint(1);
  await superMarioWorldCullection.mint(1);

  console.log("NFT successfully minted");
  console.log("superMarioWorldCullection succesfully minted! ");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
