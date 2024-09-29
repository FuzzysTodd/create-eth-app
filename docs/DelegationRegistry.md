# Solidity API

## DelegationRegistry

An immutable registry contract to be deployed as a standalone primitive.

_See EIP-5639, new project launches can read previous cold wallet -> hot wallet delegations
from here and integrate those permissions into their flow._

### Contract
DelegationRegistry : Delegate(copy)(copy)//contracts/DelegationRegistry.sol

See EIP-5639, new project launches can read previous cold wallet -> hot wallet delegations
from here and integrate those permissions into their flow.

 --- 
### Functions:
### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

_See {IERC165-supportsInterface}._

### delegateForAll

```solidity
function delegateForAll(address delegate, bool value) external
```

Allow the delegate to act on your behalf for all contracts

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### delegateForContract

```solidity
function delegateForContract(address delegate, address contract_, bool value) external
```

Allow the delegate to act on your behalf for a specific contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| contract_ | address | The address for the contract you're delegating |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### delegateForToken

```solidity
function delegateForToken(address delegate, address contract_, uint256 tokenId, bool value) external
```

Allow the delegate to act on your behalf for a specific token

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| contract_ | address | The address for the contract you're delegating |
| tokenId | uint256 | The token id for the token you're delegating |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### _setDelegationValues

```solidity
function _setDelegationValues(address delegate, bytes32 delegateHash, bool value, enum IDelegationRegistry.DelegationType type_, address vault, address contract_, uint256 tokenId) internal
```

_Helper function to set all delegation values and enumeration sets_

### _computeAllDelegationHash

```solidity
function _computeAllDelegationHash(address vault, address delegate) internal view returns (bytes32)
```

_Helper function to compute delegation hash for wallet delegation_

### _computeContractDelegationHash

```solidity
function _computeContractDelegationHash(address vault, address delegate, address contract_) internal view returns (bytes32)
```

_Helper function to compute delegation hash for contract delegation_

### _computeTokenDelegationHash

```solidity
function _computeTokenDelegationHash(address vault, address delegate, address contract_, uint256 tokenId) internal view returns (bytes32)
```

_Helper function to compute delegation hash for token delegation_

### revokeAllDelegates

```solidity
function revokeAllDelegates() external
```

Revoke all delegates

### revokeDelegate

```solidity
function revokeDelegate(address delegate) external
```

Revoke a specific delegate for all their permissions

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to revoke |

### revokeSelf

```solidity
function revokeSelf(address vault) external
```

Remove yourself as a delegate for a specific vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The vault which delegated to the msg.sender, and should be removed |

### _revokeDelegate

```solidity
function _revokeDelegate(address delegate, address vault) internal
```

_Revoke the `delegate` hotwallet from the `vault` coldwallet._

### getDelegationsByDelegate

```solidity
function getDelegationsByDelegate(address delegate) external view returns (struct IDelegationRegistry.DelegationInfo[] info)
```

Returns all active delegations a given delegate is able to claim on behalf of

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The delegate that you would like to retrieve delegations for |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| info | struct IDelegationRegistry.DelegationInfo[] | info Array of DelegationInfo structs |

### getDelegatesForAll

```solidity
function getDelegatesForAll(address vault) external view returns (address[] delegates)
```

Returns an array of wallet-level delegates for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegates | address[] | addresses Array of wallet-level delegates for a given vault |

### getDelegatesForContract

```solidity
function getDelegatesForContract(address vault, address contract_) external view returns (address[] delegates)
```

Returns an array of contract-level delegates for a given vault and contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegates | address[] | addresses Array of contract-level delegates for a given vault and contract |

### getDelegatesForToken

```solidity
function getDelegatesForToken(address vault, address contract_, uint256 tokenId) external view returns (address[] delegates)
```

Returns an array of contract-level delegates for a given vault's token

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract holding the token |
| tokenId | uint256 | The token id for the token you're delegating |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegates | address[] | addresses Array of contract-level delegates for a given vault's token |

### _getDelegatesForLevel

```solidity
function _getDelegatesForLevel(address vault, enum IDelegationRegistry.DelegationType delegationType, address contract_, uint256 tokenId) internal view returns (address[] delegates)
```

### getContractLevelDelegations

```solidity
function getContractLevelDelegations(address vault) external view returns (struct IDelegationRegistry.ContractDelegation[] contractDelegations)
```

Returns all contract-level delegations for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegations |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| contractDelegations | struct IDelegationRegistry.ContractDelegation[] |  |

### getTokenLevelDelegations

```solidity
function getTokenLevelDelegations(address vault) external view returns (struct IDelegationRegistry.TokenDelegation[] tokenDelegations)
```

Returns all token-level delegations for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegations |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenDelegations | struct IDelegationRegistry.TokenDelegation[] |  |

### checkDelegateForAll

```solidity
function checkDelegateForAll(address delegate, address vault) public view returns (bool)
```

Returns true if the address is delegated to act on the entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |

### checkDelegateForContract

```solidity
function checkDelegateForContract(address delegate, address vault, address contract_) public view returns (bool)
```

Returns true if the address is delegated to act on your behalf for a token contract or an entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |

### checkDelegateForToken

```solidity
function checkDelegateForToken(address delegate, address vault, address contract_, uint256 tokenId) public view returns (bool)
```

Returns true if the address is delegated to act on your behalf for a specific token, the token's contract or an entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |
| tokenId | uint256 | The token id for the token you're delegating |

inherits ERC165:
inherits IERC165:
inherits IDelegationRegistry:

 --- 
### Events:
inherits ERC165:
inherits IERC165:
inherits IDelegationRegistry:
### DelegateForAll

```solidity
event DelegateForAll(address vault, address delegate, bool value)
```

Emitted when a user delegates their entire wallet

### DelegateForContract

```solidity
event DelegateForContract(address vault, address delegate, address contract_, bool value)
```

Emitted when a user delegates a specific contract

### DelegateForToken

```solidity
event DelegateForToken(address vault, address delegate, address contract_, uint256 tokenId, bool value)
```

Emitted when a user delegates a specific token

### RevokeAllDelegates

```solidity
event RevokeAllDelegates(address vault)
```

Emitted when a user revokes all delegations

### RevokeDelegate

```solidity
event RevokeDelegate(address vault, address delegate)
```

Emitted when a user revoes all delegations for a given delegate

## IDelegationRegistry

_See EIP-5639, new project launches can read previous cold wallet -> hot wallet delegations
from here and integrate those permissions into their flow_

### Contract
IDelegationRegistry : Delegate(copy)(copy)//contracts/IDelegationRegistry.sol

See EIP-5639, new project launches can read previous cold wallet -> hot wallet delegations
from here and integrate those permissions into their flow

 --- 
### Functions:
### delegateForAll

```solidity
function delegateForAll(address delegate, bool value) external
```

Allow the delegate to act on your behalf for all contracts

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### delegateForContract

```solidity
function delegateForContract(address delegate, address contract_, bool value) external
```

Allow the delegate to act on your behalf for a specific contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| contract_ | address | The address for the contract you're delegating |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### delegateForToken

```solidity
function delegateForToken(address delegate, address contract_, uint256 tokenId, bool value) external
```

Allow the delegate to act on your behalf for a specific token

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| contract_ | address | The address for the contract you're delegating |
| tokenId | uint256 | The token id for the token you're delegating |
| value | bool | Whether to enable or disable delegation for this address, true for setting and false for revoking |

### revokeAllDelegates

```solidity
function revokeAllDelegates() external
```

Revoke all delegates

### revokeDelegate

```solidity
function revokeDelegate(address delegate) external
```

Revoke a specific delegate for all their permissions

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to revoke |

### revokeSelf

```solidity
function revokeSelf(address vault) external
```

Remove yourself as a delegate for a specific vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The vault which delegated to the msg.sender, and should be removed |

### getDelegationsByDelegate

```solidity
function getDelegationsByDelegate(address delegate) external view returns (struct IDelegationRegistry.DelegationInfo[])
```

Returns all active delegations a given delegate is able to claim on behalf of

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The delegate that you would like to retrieve delegations for |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | struct IDelegationRegistry.DelegationInfo[] | info Array of DelegationInfo structs |

### getDelegatesForAll

```solidity
function getDelegatesForAll(address vault) external view returns (address[])
```

Returns an array of wallet-level delegates for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address[] | addresses Array of wallet-level delegates for a given vault |

### getDelegatesForContract

```solidity
function getDelegatesForContract(address vault, address contract_) external view returns (address[])
```

Returns an array of contract-level delegates for a given vault and contract

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address[] | addresses Array of contract-level delegates for a given vault and contract |

### getDelegatesForToken

```solidity
function getDelegatesForToken(address vault, address contract_, uint256 tokenId) external view returns (address[])
```

Returns an array of contract-level delegates for a given vault's token

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract holding the token |
| tokenId | uint256 | The token id for the token you're delegating |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | address[] | addresses Array of contract-level delegates for a given vault's token |

### getContractLevelDelegations

```solidity
function getContractLevelDelegations(address vault) external view returns (struct IDelegationRegistry.ContractDelegation[] delegations)
```

Returns all contract-level delegations for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegations |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegations | struct IDelegationRegistry.ContractDelegation[] | Array of ContractDelegation structs |

### getTokenLevelDelegations

```solidity
function getTokenLevelDelegations(address vault) external view returns (struct IDelegationRegistry.TokenDelegation[] delegations)
```

Returns all token-level delegations for a given vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| vault | address | The cold wallet who issued the delegations |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegations | struct IDelegationRegistry.TokenDelegation[] | Array of TokenDelegation structs |

### checkDelegateForAll

```solidity
function checkDelegateForAll(address delegate, address vault) external view returns (bool)
```

Returns true if the address is delegated to act on the entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |

### checkDelegateForContract

```solidity
function checkDelegateForContract(address delegate, address vault, address contract_) external view returns (bool)
```

Returns true if the address is delegated to act on your behalf for a token contract or an entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |

### checkDelegateForToken

```solidity
function checkDelegateForToken(address delegate, address vault, address contract_, uint256 tokenId) external view returns (bool)
```

Returns true if the address is delegated to act on your behalf for a specific token, the token's contract or an entire vault

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| delegate | address | The hotwallet to act on your behalf |
| vault | address | The cold wallet who issued the delegation |
| contract_ | address | The address for the contract you're delegating |
| tokenId | uint256 | The token id for the token you're delegating |

 --- 
### Events:
### DelegateForAll

```solidity
event DelegateForAll(address vault, address delegate, bool value)
```

Emitted when a user delegates their entire wallet

### DelegateForContract

```solidity
event DelegateForContract(address vault, address delegate, address contract_, bool value)
```

Emitted when a user delegates a specific contract

### DelegateForToken

```solidity
event DelegateForToken(address vault, address delegate, address contract_, uint256 tokenId, bool value)
```

Emitted when a user delegates a specific token

### RevokeAllDelegates

```solidity
event RevokeAllDelegates(address vault)
```

Emitted when a user revokes all delegations

### RevokeDelegate

```solidity
event RevokeDelegate(address vault, address delegate)
```

Emitted when a user revoes all delegations for a given delegate

