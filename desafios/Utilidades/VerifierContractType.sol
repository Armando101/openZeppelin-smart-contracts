// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract VerifierContractType {
    using ERC165Checker for address;
    
    function isERC20(address contractToVerify) public view returns(bool) {
        bytes4 id = type(IERC20).interfaceId;
        return contractToVerify.supportsInterface(id);
    }

    function isERC721(address contractToVerify) public view returns(bool) {
        bytes4 id = type(IERC721).interfaceId;
        return contractToVerify.supportsInterface(id);
    }
}