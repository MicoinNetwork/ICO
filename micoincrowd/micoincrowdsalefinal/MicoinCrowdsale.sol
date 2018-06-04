pragma solidity 0.4.23;

import "./Crowdsale.sol";
import "./IncreasingPriceCrowdsale.sol";

contract owned {
    address public owner;

    function owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
}

contract MicoinCrowdsale is IncreasingPriceCrowdsale, owned {

    constructor (
    uint256 _closingTime,       
    uint256 _rate,
    uint256 _initialRate,
	uint256 _finalRate,
    address _wallet,
    TokenERC20 _token
  )
    public
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_closingTime) 
	IncreasingPriceCrowdsale(_initialRate,_finalRate)
  {
  }

      function allocateRemainingTokens() public onlyOwner {
        require(hasClosed());
        uint256 remaining = token.balanceOf(this);
        token.transfer(owner, remaining);
}

}

