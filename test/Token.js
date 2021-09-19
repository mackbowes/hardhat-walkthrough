const { expect } = require("chai");

// A test for the token contract
describe("Token contract", function () {
    it("Should assign the total supply of tokens to the owner on deployment", async function () {

    // Whatever a signer is according to ethers gets deconstructed into a variable called
    // owner. I think this line assumes there will only be one signer for this contract,
    // which in this case is true but doesn't have to be. 

    const [owner] = await ethers.getSigners();
  
    // Not sure what getContractFactory does, will have to look at docs later
    // Strikes me as odd that I can just declare a string to run that function instead of an import

    const Token = await ethers.getContractFactory("Token");
  
    // The above line must construct the contract I wrote in src/contracts/Token.sol
    // because the below line takes the result of a deploy function from that object and stores it

    const hardhatToken = await Token.deploy();
  
    // store the balance in a variable for the test

    const ownerBalance = await hardhatToken.balanceOf(owner.address);

    // This is the actual test, making sure the values are equal
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);

    });

  });