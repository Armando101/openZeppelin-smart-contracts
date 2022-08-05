// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract extentionsChallenge is ERC20Burnable, Pausable, Ownable {

    constructor() ERC20Burnable() ERC20("Extenions Challenge", "EC") {
        _mint(msg.sender, 1000);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function burnTokens(uint256 amount) public onlyOwner {
        require(!paused(), "You can not burn tokens if the contract is paused");
        burn(amount);
    }

}