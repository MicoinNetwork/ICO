var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "lunch shock suit file goddess hybrid sauce enlist custom estate airport today";

module.exports = {
    networks: {
        //ganache: {
        //    host: "127.0.0.1",
        //    port: 7545,
        //    network_id: "5777" 
        //},
        ropsten: {
            provider: function() {
              return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/6VW0RjCturZoOgccFgpj")
            },
            network_id: 3
          }   
    }
};
