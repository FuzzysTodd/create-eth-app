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

import "../../../interfaces/LinkTokenInterface.sol";
import "../../interfaces/IVRFCoordinatorV2Plus.sol";
import "../../VRFConsumerBaseV2Upgradeable.sol";
import "ChainLink/@openzeppelin/contracts-upgradeable-4.7.3/proxy/utils/Initializable.sol";

contract VRFConsumerV2PlusUpgradeableExample is Initializable, VRFConsumerBaseV2Upgradeable {
  uint256[] public s_randomWords;
  uint256 public s_requestId;
  IVRFCoordinatorV2Plus public COORDINATOR;
  LinkTokenInterface public LINKTOKEN;
  uint256 public s_subId;
  uint256 public s_gasAvailable;

  function initialize(address _vrfCoordinator, address _link) public initializer {
    __VRFConsumerBaseV2_init(_vrfCoordinator);
    COORDINATOR = IVRFCoordinatorV2Plus(_vrfCoordinator);
    LINKTOKEN = LinkTokenInterface(_link);
  }

  function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
    require(requestId == s_requestId, "request ID is incorrect");

    s_gasAvailable = gasleft();
    s_randomWords = randomWords;
  }

  function createSubscriptionAndFund(uint96 amount) external {
    if (s_subId == 0) {
      s_subId = COORDINATOR.createSubscription();
      COORDINATOR.addConsumer(s_subId, address(this));
    }
    // Approve the link transfer.
    LINKTOKEN.transferAndCall(address(COORDINATOR), amount, abi.encode(s_subId));
  }

  function topUpSubscription(uint96 amount) external {
    require(s_subId != 0, "sub not set");
    // Approve the link transfer.
    LINKTOKEN.transferAndCall(address(COORDINATOR), amount, abi.encode(s_subId));
  }

  function updateSubscription(address[] memory consumers) external {
    require(s_subId != 0, "subID not set");
    for (uint256 i = 0; i < consumers.length; i++) {
      COORDINATOR.addConsumer(s_subId, consumers[i]);
    }
  }

  function requestRandomness(
    bytes32 keyHash,
    uint256 subId,
    uint16 minReqConfs,
    uint32 callbackGasLimit,
    uint32 numWords
  ) external returns (uint256) {
    VRFV2PlusClient.RandomWordsRequest memory req = VRFV2PlusClient.RandomWordsRequest({
      keyHash: keyHash,
      subId: subId,
      requestConfirmations: minReqConfs,
      callbackGasLimit: callbackGasLimit,
      numWords: numWords,
      extraArgs: "" // empty extraArgs defaults to link payment
    });
    s_requestId = COORDINATOR.requestRandomWords(req);
    return s_requestId;
  }
}
