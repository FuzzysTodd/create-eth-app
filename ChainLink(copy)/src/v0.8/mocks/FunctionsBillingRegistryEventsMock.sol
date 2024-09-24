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
// Warning: this is an autogenerated file! DO NOT EDIT.

pragma solidity ^0.8.6;

contract FunctionsBillingRegistryEventsMock {
    struct Commitment {uint64 subscriptionId;address client;uint32 gasLimit;uint256 gasPrice;address don;uint96 donFee;uint96 registryFee;uint96 estimatedCost;uint256 timestamp; }
    event AuthorizedSendersChanged(address[] senders,address changedBy);
    event BillingEnd(bytes32 indexed requestId,uint64 subscriptionId,uint96 signerPayment,uint96 transmitterPayment,uint96 totalCost,bool success);
    event BillingStart(bytes32 indexed requestId,Commitment commitment);
    event ConfigSet(uint32 maxGasLimit,uint32 stalenessSeconds,uint256 gasAfterPaymentCalculation,int256 fallbackWeiPerUnitLink,uint32 gasOverhead);
    event FundsRecovered(address to,uint256 amount);
    event Initialized(uint8 version);
    event OwnershipTransferRequested(address indexed from,address indexed to);
    event OwnershipTransferred(address indexed from,address indexed to);
    event Paused(address account);
    event RequestTimedOut(bytes32 indexed requestId);
    event SubscriptionCanceled(uint64 indexed subscriptionId,address to,uint256 amount);
    event SubscriptionConsumerAdded(uint64 indexed subscriptionId,address consumer);
    event SubscriptionConsumerRemoved(uint64 indexed subscriptionId,address consumer);
    event SubscriptionCreated(uint64 indexed subscriptionId,address owner);
    event SubscriptionFunded(uint64 indexed subscriptionId,uint256 oldBalance,uint256 newBalance);
    event SubscriptionOwnerTransferRequested(uint64 indexed subscriptionId,address from,address to);
    event SubscriptionOwnerTransferred(uint64 indexed subscriptionId,address from,address to);
    event Unpaused(address account);
    function emitAuthorizedSendersChanged(address[] memory senders,address changedBy) public {
        emit AuthorizedSendersChanged(senders,changedBy);
    }
    function emitBillingEnd(bytes32 requestId,uint64 subscriptionId,uint96 signerPayment,uint96 transmitterPayment,uint96 totalCost,bool success) public {
        emit BillingEnd(requestId,subscriptionId,signerPayment,transmitterPayment,totalCost,success);
    }
    function emitBillingStart(bytes32 requestId,Commitment memory commitment) public {
        emit BillingStart(requestId,commitment);
    }
    function emitConfigSet(uint32 maxGasLimit,uint32 stalenessSeconds,uint256 gasAfterPaymentCalculation,int256 fallbackWeiPerUnitLink,uint32 gasOverhead) public {
        emit ConfigSet(maxGasLimit,stalenessSeconds,gasAfterPaymentCalculation,fallbackWeiPerUnitLink,gasOverhead);
    }
    function emitFundsRecovered(address to,uint256 amount) public {
        emit FundsRecovered(to,amount);
    }
    function emitInitialized(uint8 version) public {
        emit Initialized(version);
    }
    function emitOwnershipTransferRequested(address from,address to) public {
        emit OwnershipTransferRequested(from,to);
    }
    function emitOwnershipTransferred(address from,address to) public {
        emit OwnershipTransferred(from,to);
    }
    function emitPaused(address account) public {
        emit Paused(account);
    }
    function emitRequestTimedOut(bytes32 requestId) public {
        emit RequestTimedOut(requestId);
    }
    function emitSubscriptionCanceled(uint64 subscriptionId,address to,uint256 amount) public {
        emit SubscriptionCanceled(subscriptionId,to,amount);
    }
    function emitSubscriptionConsumerAdded(uint64 subscriptionId,address consumer) public {
        emit SubscriptionConsumerAdded(subscriptionId,consumer);
    }
    function emitSubscriptionConsumerRemoved(uint64 subscriptionId,address consumer) public {
        emit SubscriptionConsumerRemoved(subscriptionId,consumer);
    }
    function emitSubscriptionCreated(uint64 subscriptionId,address owner) public {
        emit SubscriptionCreated(subscriptionId,owner);
    }
    function emitSubscriptionFunded(uint64 subscriptionId,uint256 oldBalance,uint256 newBalance) public {
        emit SubscriptionFunded(subscriptionId,oldBalance,newBalance);
    }
    function emitSubscriptionOwnerTransferRequested(uint64 subscriptionId,address from,address to) public {
        emit SubscriptionOwnerTransferRequested(subscriptionId,from,to);
    }
    function emitSubscriptionOwnerTransferred(uint64 subscriptionId,address from,address to) public {
        emit SubscriptionOwnerTransferred(subscriptionId,from,to);
    }
    function emitUnpaused(address account) public {
        emit Unpaused(account);
    }
}
