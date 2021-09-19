// This deploys the contract

async function main() {

    // First signer is named the deployer
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
    
    // Tutorial called these results 'Token' and 'token' which is... less than clear
    const TokenFactory = await ethers.getContractFactory("Token");
    const token = await TokenFactory.deploy();
  
    console.log("Token address:", token.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });