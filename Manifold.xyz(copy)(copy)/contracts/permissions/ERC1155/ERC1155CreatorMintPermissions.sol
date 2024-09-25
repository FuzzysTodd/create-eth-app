/*
    
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
  ██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████
  
  Find any smart contract, and build your project faster: https://www.cookbook.dev
  Twitter: https://twitter.com/cookbook_dev
  Discord: https://discord.gg/cookbookdev
  
  Find this contract on Cookbook: https://www.cookbook.dev/protocols/Manifold.xyz?utm=code
  */
  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: manifold.xyz

import "Manifold.xyz/@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "Manifold.xyz/@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import "Manifold.xyz/@manifoldxyz/libraries-solidity/contracts/access/AdminControl.sol";
import "../../core/IERC1155CreatorCore.sol";
import "./IERC1155CreatorMintPermissions.sol";

/**
 * @dev Basic implementation of a permission contract that works with a singular creator contract.
 * approveMint requires the sender to be the configured creator.
 */
abstract contract ERC1155CreatorMintPermissions is ERC165, AdminControl, IERC1155CreatorMintPermissions {
     address internal immutable _creator;

     constructor(address creator_) {
         require(ERC165Checker.supportsInterface(creator_, type(IERC1155CreatorCore).interfaceId), "Must implement IERC1155CreatorCore");
         _creator = creator_;
     }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165, AdminControl) returns (bool) {
        return interfaceId == type(IERC1155CreatorMintPermissions).interfaceId
            || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC1155CreatorMintPermissions-approveMint}.
     */
    function approveMint(address, address[] calldata, uint256[] calldata, uint256[] calldata)  public virtual override {
        require(msg.sender == _creator, "Can only be called by token creator");
    }
}