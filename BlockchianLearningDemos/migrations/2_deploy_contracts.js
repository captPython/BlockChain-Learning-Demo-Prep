
// Get an instance of the contract 
var MultiNumberBettingV1 = artifacts.require("./MultiNumberBettingV1.sol");

module.exports = function(deployer) {
  // Deploy the instance of the contract 
  // Number passed to constructor 1,3,9
  deployer.deploy(MultiNumberBettingV1,1,3,9);
};
