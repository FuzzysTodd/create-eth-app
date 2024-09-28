pragma solidity ^0.6.12;

import "./IERC20.sol";
import "./LibERC20Token06.sol";

contract WETH9V06 is IERC20 {
    
    using LibERC20Token06 for IERC20;

    string public constant name = "Wrapped Ether";
    string public constant symbol = "WETH";
    uint8 public constant decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function transfer(address to, uint256 value) public override returns (bool) {
        require(to != address(0), "WETH9V06: transfer to the zero address");
        require(value <= balances[msg.sender], "WETH9V06: transfer amount exceeds balance");
        
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);

        return true;
    }
    
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        require(to != address(0), "WETH9V06: transfer to the zero address");
        require(value <= balances[from], "WETH9V06: transfer amount exceeds balance");
        
        allowed[from][msg.sender] -= value;
        balances[from] -= value;
        balances[to] += value;
        
        emit Transfer(from, to, value);
        
        return true;
    }
    
    function approve(address spender, uint256 value) public override returns (bool) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowed[owner][spender];
    }
    
    function balanceOf(address owner) public view override returns (uint256) {
        return balances[owner];
    }
}