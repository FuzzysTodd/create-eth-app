/*
    
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
  ██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
  ██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
   ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████
  
  Find any smart contract, and build your project faster: https://www.cookbook.dev
  Twitter: https://twitter.com/cookbook_dev
  Discord: https://discord.gg/cookbookdev
  
  Find this contract on Cookbook: https://www.cookbook.dev/protocols/ChainLink?utm=code
  */
  
  // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../automation/UpkeepFormat.sol";

interface MigratableKeeperRegistryInterfaceV2 {
  /**
   * @notice Migrates upkeeps from one registry to another, including LINK and upkeep params.
   * Only callable by the upkeep admin. All upkeeps must have the same admin. Can only migrate active upkeeps.
   * @param upkeepIDs ids of upkeeps to migrate
   * @param destination the address of the registry to migrate to
   */
  function migrateUpkeeps(uint256[] calldata upkeepIDs, address destination) external;

  /**
   * @notice Called by other registries when migrating upkeeps. Only callable by other registries.
   * @param encodedUpkeeps abi encoding of upkeeps to import - decoded by the transcoder
   */
  function receiveUpkeeps(bytes calldata encodedUpkeeps) external;

  /**
   * @notice Specifies the version of upkeep data that this registry requires in order to import
   */
  function upkeepVersion() external view returns (uint8 version);
}
