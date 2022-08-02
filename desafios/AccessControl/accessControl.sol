// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
import "@openzeppelin/contracts/access/AccessControl.sol";


contract Storage is AccessControl {

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_WRITER = keccak256("ROL_WRITER");

    uint256 number;

    modifier isOwner() {
        require(hasRole(ROL_ADMIN, msg.sender), "This function can be used only by the admin");
        _;
    }

    modifier isWritter() {
        require(hasRole(ROL_WRITER, msg.sender), "This function can be used only by the writer");
        _;
    }

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
    }

    function addRole(bytes32 role, address account) public isOwner {
       _grantRole(role, account); 
    }

    function deleteRole(bytes32 role, address account) public isOwner {
       _revokeRole(role, account); 
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public isWritter {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}