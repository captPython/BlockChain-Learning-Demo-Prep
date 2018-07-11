
// Get an instance of the contract 
var DemoContract = artifacts.require("./DemoContract.sol");

module.exports = function(deployer) {
  // Deploy the instance of the contract 
  deployer.deploy(DemoContract);
};
