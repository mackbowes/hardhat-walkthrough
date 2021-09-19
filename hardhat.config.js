require("@nomiclabs/hardhat-waffle");
require('dotenv').config()

const ALCHEMY_API_KEY = process.env.ALCHEMY_API_KEY;
const ROPSTEN_KEY = process.env.ROPSTEN_KEY;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.7.3",
  networks: {
    ropsten: {
      url: `${ALCHEMY_API_KEY}`,
      accounts: [`0x${ROPSTEN_KEY}`],
    },
  }
};
