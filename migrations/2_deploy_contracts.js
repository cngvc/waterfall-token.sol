const Waterfall = artifacts.require("Waterfall");

module.exports = function(deployer) {
  deployer.deploy(Waterfall);
};
