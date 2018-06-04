pragma solidity 0.4.23;

import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/price/IncreasingPriceCrowdsale.sol";


contract MicoinCrowdsale is IncreasingPriceCrowdsale {

    constructor (
    uint256 _openingTime,
    uint256 _closingTime,       
    uint256 _rate,
    uint256 _initialRate,
	  uint256 _finalRate,
    address _wallet,
    TokenERC20 _token
  )
    public
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_openingTime, _closingTime) 
	IncreasingPriceCrowdsale(_initialRate,_finalRate)
  {
  }

}
