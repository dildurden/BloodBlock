const donor = artifacts.require("Request");
module.exports = function(deployer) {
  // Use deployer to state migration tasks.
  deployer.deploy(donor);
};
