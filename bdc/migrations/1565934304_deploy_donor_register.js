const donor = artifacts.require("DonorRegister");
module.exports = function(deployer) {
  // Use deployer to state migration tasks.
  deployer.deploy(donor);
};
