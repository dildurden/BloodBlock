pragma solidity ^0.5.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
* @title ERC20Interface
* @dev Contract Interface defining ERC20 protocols being used in the contract.
*/

contract ERC20Interface {
  function totalSupply() public view returns (uint256);
  function balanceOf(address _who) public view returns (uint256);
  function transfer(address _to, uint256 _value) public returns (bool);
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );
}

//Bdctoken Contract
contract Bdctoken is ERC20Interface{
  using SafeMath for uint256;
  string public constant name = 'BloodDonorCoin';
  string public constant symbol = 'BDC';
  uint8 public constant decimals = 3;
  uint _totalSupply;
  address public owner;
  mapping(address => uint) balances;
  /**
   * @dev The Token constructor sets the Token parameters.
   */
  constructor() public payable {
    owner = msg.sender;
    _totalSupply = 100000000 * 10**uint(decimals);//Setting initial total supply as 10000000 tokens
    balances[owner] = _totalSupply;
    emit Transfer(address(0), owner,_totalSupply);//Transfer event called
  }
  //Modifier to check whether the account is the owner
  modifier onlyOwner {
    require(msg.sender == owner,"Only Owner can access");
    _;
  }
  //Function to calculate the current total supply
  function totalSupply() public view returns (uint){
    return _totalSupply - balances[address(0)];
  }
  //Function that returns the no:of tokens in an account
  function balanceOf(address tokenOwner) public view returns (uint balance){
    return balances[tokenOwner];
  }
  //Function for transfering tokens from owner to donor accounts
  function transfer(address _to, uint256 _value) public returns (bool){
    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    emit Transfer(msg.sender,_to,_value);
    return true;
  }
}