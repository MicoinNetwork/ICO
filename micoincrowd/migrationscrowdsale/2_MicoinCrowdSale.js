var MicoinCrowdsale = artifacts.require('MicoinCrowdsale');

module.exports = function(deployer) {

    const openingTime = web3.eth.getBlock(web3.eth.blockNumber).timestamp + 10; // 10 secs in the future
    const closingTime = openingTime + 86400 * 20; // 20 days
  
    const wallet = "0x06d47C750a2d6e0275107ae986eBE6284f29d06A";
    const MicoinNetworkToken = "0x2850b137d2e551A268cbbfC9531a9Ba064970E9a";


    return deployer
        .then(() => {
            return deployer.deploy(
                MicoinCrowdsale,
                openingTime,
                closingTime,
                100000, //rate, 1 ETH = 100000 MIC; then 1 wei = 100000 MICbits with decimals
                100000, //initialRate
                50000, //finalRate
                wallet,
                MicoinNetworkToken
            );
        });
};
