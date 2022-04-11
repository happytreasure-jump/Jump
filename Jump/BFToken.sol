//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./Member.sol";
import "./ERC20/ERC20.sol";

contract BFToken is ERC20,Member {

    uint8 private _decimals = 18;
    uint256 private initSupply = 2050000;

	constructor() ERC20("JGB Token","JGB") {
		_setupDecimals(_decimals);
	    _mint(msg.sender, initSupply * 10 ** _decimals);
	}
	
	function mint(address _to, uint256 _amount) external {
        require(manager.members("gov") == msg.sender, 'only gov');
		_mint(_to, _amount);
	}
}