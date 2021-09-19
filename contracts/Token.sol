/*
Here is the logic for this contract:
- There is a fixed total supply of tokens that can't be changed.
- The entire supply is assigned to the address that deploys the contract.
- Anyone can receive tokens.
- Anyone with at least one token can transfer tokens.
- The token is non-divisible. You can transfer 1, 2, 3 or 37 tokens but not 2.5.
*/

/* 
Declaring solidity version of at least 0.7,
hardhat.config.js declares version 0.7.3,
VSCode is indicating the compiler version is out of date.
*/
pragma solidity ^0.7.0;

contract Token {

    // Not literally copypasting the tutorial to try to introduce and fix bugs lol
    // The tutorial called for "My Hardhat Token" and "MHT" respectively
    string public name = "Customized Hardhat Token"; 
    string public symbol = "CHT";

    // Declaring how many tokens there are in total
    // This fulfills the logic of introducing a fixed supply of tokens that can not be changed
    // Tutorial called for 1000000
    uint256 public totalSupply = 2718281; // e x 10^6 because why not

    // Not changing this one, everything seems to be a key word here
    address public owner;

    // Each address gets a number of tokens, cumulatively comprising a variable called balances?
    mapping(address => uint256) balances;


    // This initializes the contract
    // It satisfies the logic requirement of 'the entire supply is assigned to the address that deploys the contract'
    constructor() {

        // I did not change these, I don't know yet what msg.sender means. Might be me
        // when deploying the contract. 

        // The totalSupply is assigned to transaction sender, which is the account
        // that is deploying the contract.
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    /**
        This function transfers tokens
        It satisfies the logic requirement of 'anyone can transfer tokens'
        The keyword 'external' modifies the function so it's ONLY callable from outside the contract
     */
    function transfer(address to, uint256 amount) external {

        // Cancel the transaction and return an error message if the
        // Sender doesn't own enough tokens to transfer
        require(balances[msg.sender] >= amount, 'Insufficient Tokens');

        // Otherwise, send the stuff
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    /**
        This function is read-only and returns the amount of tokens the account owns
     */
     function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

}