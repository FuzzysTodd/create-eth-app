# Solidity API

## LibRichErrorsV06

### Contract
LibRichErrorsV06 : 0x(copy)/contracts/erc20/src/v06/LibERC20TokenV06_flattened.sol

 --- 
### Functions:
### StandardError

```solidity
function StandardError(string message) internal pure returns (bytes)
```

_ABI encode a standard, string revert error payload.
     This is the same payload that would be included by a `revert(string)`
     solidity statement. It has the function signature `Error(string)`._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| message | string | The error string. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bytes | The ABI encoded error. |

### rrevert

```solidity
function rrevert(bytes errorData) internal pure
```

_Reverts an encoded rich revert reason `errorData`._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| errorData | bytes | ABI encoded error data. |

## LibBytesRichErrorsV06

### Contract
LibBytesRichErrorsV06 : 0x(copy)/contracts/erc20/src/v06/LibERC20TokenV06_flattened.sol

 --- 
### Functions:
### InvalidByteOperationError

```solidity
function InvalidByteOperationError(enum LibBytesRichErrorsV06.InvalidByteOperationErrorCodes errorCode, uint256 offset, uint256 required) internal pure returns (bytes)
```

## LibBytesV06

### Contract
LibBytesV06 : 0x(copy)/contracts/erc20/src/v06/LibERC20TokenV06_flattened.sol

 --- 
### Functions:
### rawAddress

```solidity
function rawAddress(bytes input) internal pure returns (uint256 memoryAddress)
```

_Gets the memory address for a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| input | bytes | Byte array to lookup. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| memoryAddress | uint256 | Memory address of byte array. This         points to the header of the byte array which contains         the length. |

### contentAddress

```solidity
function contentAddress(bytes input) internal pure returns (uint256 memoryAddress)
```

_Gets the memory address for the contents of a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| input | bytes | Byte array to lookup. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| memoryAddress | uint256 | Memory address of the contents of the byte array. |

### memCopy

```solidity
function memCopy(uint256 dest, uint256 source, uint256 length) internal pure
```

_Copies `length` bytes from memory location `source` to `dest`._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| dest | uint256 | memory address to copy bytes to. |
| source | uint256 | memory address to copy bytes from. |
| length | uint256 | number of bytes to copy. |

### slice

```solidity
function slice(bytes b, uint256 from, uint256 to) internal pure returns (bytes result)
```

_Returns a slices from a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | The byte array to take a slice from. |
| from | uint256 | The starting index for the slice (inclusive). |
| to | uint256 | The final index for the slice (exclusive). |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | bytes | The slice containing bytes at indices [from, to) |

### sliceDestructive

```solidity
function sliceDestructive(bytes b, uint256 from, uint256 to) internal pure returns (bytes result)
```

_Returns a slice from a byte array without preserving the input.
     When `from == 0`, the original array will match the slice.
     In other cases its state will be corrupted._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | The byte array to take a slice from. Will be destroyed in the process. |
| from | uint256 | The starting index for the slice (inclusive). |
| to | uint256 | The final index for the slice (exclusive). |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | bytes | The slice containing bytes at indices [from, to) |

### popLastByte

```solidity
function popLastByte(bytes b) internal pure returns (bytes1 result)
```

_Pops the last byte off of a byte array by modifying its length._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array that will be modified. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | bytes1 | The byte that was popped off. |

### equals

```solidity
function equals(bytes lhs, bytes rhs) internal pure returns (bool equal)
```

_Tests equality of two byte arrays._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| lhs | bytes | First byte array to compare. |
| rhs | bytes | Second byte array to compare. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| equal | bool | True if arrays are the same. False otherwise. |

### readAddress

```solidity
function readAddress(bytes b, uint256 index) internal pure returns (address result)
```

_Reads an address from a position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array containing an address. |
| index | uint256 | Index in byte array of address. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | address | address from byte array. |

### writeAddress

```solidity
function writeAddress(bytes b, uint256 index, address input) internal pure
```

_Writes an address into a specific position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array to insert address into. |
| index | uint256 | Index in byte array of address. |
| input | address | Address to put into byte array. |

### readBytes32

```solidity
function readBytes32(bytes b, uint256 index) internal pure returns (bytes32 result)
```

_Reads a bytes32 value from a position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array containing a bytes32 value. |
| index | uint256 | Index in byte array of bytes32 value. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | bytes32 | bytes32 value from byte array. |

### writeBytes32

```solidity
function writeBytes32(bytes b, uint256 index, bytes32 input) internal pure
```

_Writes a bytes32 into a specific position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array to insert <input> into. |
| index | uint256 | Index in byte array of <input>. |
| input | bytes32 | bytes32 to put into byte array. |

### readUint256

```solidity
function readUint256(bytes b, uint256 index) internal pure returns (uint256 result)
```

_Reads a uint256 value from a position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array containing a uint256 value. |
| index | uint256 | Index in byte array of uint256 value. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | uint256 | uint256 value from byte array. |

### writeUint256

```solidity
function writeUint256(bytes b, uint256 index, uint256 input) internal pure
```

_Writes a uint256 into a specific position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array to insert <input> into. |
| index | uint256 | Index in byte array of <input>. |
| input | uint256 | uint256 to put into byte array. |

### readBytes4

```solidity
function readBytes4(bytes b, uint256 index) internal pure returns (bytes4 result)
```

_Reads an unpadded bytes4 value from a position in a byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Byte array containing a bytes4 value. |
| index | uint256 | Index in byte array of bytes4 value. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| result | bytes4 | bytes4 value from byte array. |

### writeLength

```solidity
function writeLength(bytes b, uint256 length) internal pure
```

_Writes a new length to a byte array.
     Decreasing length will lead to removing the corresponding lower order bytes from the byte array.
     Increasing length may lead to appending adjacent in-memory bytes to the end of the byte array._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| b | bytes | Bytes array to write new length to. |
| length | uint256 | New length of byte array. |

## IERC20Token

### Contract
IERC20Token : 0x(copy)/contracts/erc20/src/v06/LibERC20TokenV06_flattened.sol

 --- 
### Functions:
### transfer

```solidity
function transfer(address to, uint256 value) external returns (bool)
```

_send `value` token to `to` from `msg.sender`_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| to | address | The address of the recipient |
| value | uint256 | The amount of token to be transferred |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if transfer was successful |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external returns (bool)
```

_send `value` token to `to` from `from` on the condition it is approved by `from`_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| from | address | The address of the sender |
| to | address | The address of the recipient |
| value | uint256 | The amount of token to be transferred |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | True if transfer was successful |

### approve

```solidity
function approve(address spender, uint256 value) external returns (bool)
```

_`msg.sender` approves `spender` to spend `value` tokens_

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| spender | address | The address of the account able to transfer the tokens |
| value | uint256 | The amount of wei to be approved for transfer |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | bool | Always true if the call has enough gas to complete execution |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```

_Query total supply of token_

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | Total supply of token |

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```

_Get the balance of `owner`._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | The address from which the balance will be retrieved |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | Balance of owner |

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```

_Get the allowance for `spender` to spend from `owner`._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| owner | address | The address of the account owning tokens |
| spender | address | The address of the account able to transfer the tokens |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| [0] | uint256 | Amount of remaining tokens allowed to spent |

### decimals

```solidity
function decimals() external view returns (uint8)
```

_Get the number of decimals this token has._

 --- 
### Events:
### Transfer

```solidity
event Transfer(address from, address to, uint256 value)
```

### Approval

```solidity
event Approval(address owner, address spender, uint256 value)
```

## LibERC20TokenV06

### Contract
LibERC20TokenV06 : 0x(copy)/contracts/erc20/src/v06/LibERC20TokenV06_flattened.sol

 --- 
### Functions:
### compatApprove

```solidity
function compatApprove(contract IERC20Token token, address spender, uint256 allowance) internal
```

_Calls `IERC20Token(token).approve()`.
     Reverts if the return data is invalid or the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| spender | address | The address that receives an allowance. |
| allowance | uint256 | The allowance to set. |

### approveIfBelow

```solidity
function approveIfBelow(contract IERC20Token token, address spender, uint256 amount) internal
```

_Calls `IERC20Token(token).approve()` and sets the allowance to the
     maximum if the current approval is not already >= an amount.
     Reverts if the return data is invalid or the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| spender | address | The address that receives an allowance. |
| amount | uint256 | The minimum allowance needed. |

### compatTransfer

```solidity
function compatTransfer(contract IERC20Token token, address to, uint256 amount) internal
```

_Calls `IERC20Token(token).transfer()`.
     Reverts if the return data is invalid or the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| to | address | The address that receives the tokens |
| amount | uint256 | Number of tokens to transfer. |

### compatTransferFrom

```solidity
function compatTransferFrom(contract IERC20Token token, address from, address to, uint256 amount) internal
```

_Calls `IERC20Token(token).transferFrom()`.
     Reverts if the return data is invalid or the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| from | address | The owner of the tokens. |
| to | address | The address that receives the tokens |
| amount | uint256 | Number of tokens to transfer. |

### compatDecimals

```solidity
function compatDecimals(contract IERC20Token token) internal view returns (uint8 tokenDecimals)
```

_Retrieves the number of decimals for a token.
     Returns `18` if the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| tokenDecimals | uint8 | The number of decimals places for the token. |

### compatAllowance

```solidity
function compatAllowance(contract IERC20Token token, address owner, address spender) internal view returns (uint256 allowance_)
```

_Retrieves the allowance for a token, owner, and spender.
     Returns `0` if the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| owner | address | The owner of the tokens. |
| spender | address | The address the spender. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| allowance_ | uint256 | The allowance for a token, owner, and spender. |

### compatBalanceOf

```solidity
function compatBalanceOf(contract IERC20Token token, address owner) internal view returns (uint256 balance)
```

_Retrieves the balance for a token owner.
     Returns `0` if the call reverts._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20Token | The address of the token contract. |
| owner | address | The owner of the tokens. |

#### Return Values

| Name | Type | Description |
| ---- | ---- | ----------- |
| balance | uint256 | The token balance of an owner. |

