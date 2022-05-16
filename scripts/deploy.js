const { ethers } = require("hardhat");

async function main() {
  const OzSuperMarioWorld = await ethers.getContractFactory(
    "OzSuperMarioWorld"
  );
  const oZsuperMarioWorld = await OzSuperMarioWorld.deploy(
    "OzSuperMarioWorld",
    "SPMW"
  );

  await oZsuperMarioWorld.deployed();

  console.log("Sucess! Contract was deployed to: ", oZsuperMarioWorld.address);

  await oZsuperMarioWorld.mint(
    "https://ipfs.io/ipfs/QmYoVjXNGbAVHKucFJ3xw8MMxWqFXHtyWPLzf4EB8aLW4f"
  );
  console.log("NFT succesfully minted! ");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
