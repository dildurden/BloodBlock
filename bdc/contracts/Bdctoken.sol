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

/**
* @title ERC20
* @dev Contract defining functions of the ERC20 token.
*/

// contract ERC20 is ERC20Interface {
//   using SafeMath for uint256;
//   mapping(address => uint256) balances; //to store token balances of all accounts.
//   address public contractorGlobal; //saving contractor address globally to use throughout the contract.
//   uint256 totalSupply_;
//   /**
//   * @dev Total number of tokens in existence.
//   */
//   function totalSupply() public view returns (uint256) {
//     return totalSupply_;
//   }
//  /**
//   * @dev Public function that transfers tokens to a specified address.
//   * @param _to The address to transfer tokens to.
//   * @param _value The amount to be transferred.
//   */
//   function transfer(address _to, uint256 _value) public returns (bool) {
//     //Checking if the to address is a valid address.
//     require(_to != address(0), "Invalid Address, cannot call Transfer!");
//     //Condition for transferring tokens to Contract Address (paying toll, called by user).
//     if(_to == address(this)) {
//       balances[msg.sender] = balances[msg.sender].sub(_value);
//       balances[address(this)] = balances[address(this)].add(_value);
//       emit Transfer(address(this), _to, _value);
//     }
//     //Condition for withdrawing Tokens (called by Contractor).
//     else if (contractorGlobal == msg.sender) {
//       balances[address(this)] = balances[address(this)].sub(_value);
//       balances[_to] = balances[_to].add(_value);
//       emit Transfer(address(this), _to, _value);
//     }
//     //Condition for user buying tokens (called by user).
//     else {
//       require(msg.sender == _to, "User can purchase tokens only for themselves!");
//       balances[owner] = balances[owner].sub(_value);
//       balances[_to] = balances[_to].add(_value);
//       emit Transfer(owner, _to, _value);
//       return true;
//     }
//   }
//   /**
//   * @dev Public function that returns the balance of the specified address.
//   * @param _owner The account address of whose balance is being checked.
//   * @return An uint256 representing the amount owned by the passed address.
//   */
//   function balanceOf(address _owner) public view returns (uint256 balance) {
//     return balances[_owner];
//   }
//   /**
//    * @dev Internal function that mints an amount of the token and assigns it to
//    * an owner. This encapsulates the modification of balances such that the
//    * proper events are emitted.
//    * @param _owner The account that will receive the created tokens (owner).
//    * @param _amount The amount that will be created.
//    */
//   function _mint(address _owner, uint256 _amount) internal {
//     require(_owner != address(0));
//     totalSupply_ = totalSupply_.add(_amount);
//     balances[_owner] = balances[_owner].add(_amount);
//     emit Transfer(address(0), _owner, _amount);
//   }

// }


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
    _totalSupply = 100000000 * 10**uint(decimals);
    balances[owner] = _totalSupply;
    emit Transfer(address(0), owner,_totalSupply);
  }

  modifier onlyOwner {
    require(msg.sender == owner,"Only Owner can access");
    _;
  }
  function totalSupply() public view returns (uint){
    return _totalSupply - balances[address(0)];
  }
  function balanceOf(address tokenOwner) public view returns (uint balance){
    return balances[tokenOwner];
  }
  function transfer(address _to, uint256 _value) public returns (bool){
    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    emit Transfer(msg.sender,_to,_value);
    return true;
  }
}
// contract ERC20Interface {
//     function totalSupply() public view returns (uint);
//     function balanceOf(address tokenOwner) public view returns (uint balance);
//     function allowance(address tokenOwner, address spender) public view returns (uint remaining);
//     function transfer(address to, uint tokens) public returns (bool success);
//     function approve(address spender, uint tokens) public returns (bool success);
//     function transferFrom(address from, address to, uint tokens) public returns (bool success);

//     event Transfer(address indexed from, address indexed to, uint tokens);
//     event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
// }

// /**
//  *@title ScholarshipToken
//  *@dev ERC20Interface contract is inherited to ScholarshipToken contract 
//  */ 

// contract ScholarshipToken is ERC20Interface {
//     string public symbol;
//     string public  name;
//     uint8 public decimals;
//     uint _totalSupply;
//     address public owner;
    
//     /**
//      *@dev mapping with address as key and uint value as balances
//      */ 
//     mapping(address => uint) balances;
//     mapping(address => mapping(address => uint)) allowed;

//     /**
//      *@notice owner is assigned to the contract deploying address
//      */ 
//     constructor() public {
//         owner = msg.sender;
//         symbol = "A";
//         name = "SCHOLAR";
//         decimals = 2;
//         _totalSupply = 100000000 * 10**uint(decimals);
//         balances[owner] = _totalSupply;
//         emit Transfer(address(0), owner, _totalSupply);
//     }
    
//     /**
//      *@dev defining a modifier onlyOwner to restrict entry in certain function
//      */ 
//     modifier onlyOwner {
//         require(msg.sender == owner);
//         _;
//     }
    
//     /**
//      *@notice function to view the total no of tokens
//      */ 
//     function totalSupply() public view returns (uint) {
//         return _totalSupply - balances[address(0)];
//     }
    
//     /**
//      *@notice function to view the balance of tokenOwner with key
//      */
//     function balanceOf(address tokenOwner) public view returns (uint balance) {
//         return balances[tokenOwner];
//     }
    
//     /**
//      *@notice function to supply tokens to specific address and can be called by onlyOwner 
//      */ 
//     function transfer(address to, uint tokens) public onlyOwner  returns (bool success) {
//         balances[msg.sender] = balances[msg.sender]-tokens;
//         balances[to] = balances[to]+tokens;
//         /**
//          *@dev emitting event Transfer
//          */ 
//         emit Transfer(msg.sender, to, tokens);
//         return true;
//     }
    
//     function approve(address spender, uint tokens) public returns (bool success) {
//         allowed[msg.sender][spender] = tokens;
//         emit Approval(msg.sender, spender, tokens);
//         return true;
//     }
    
    
//     /**
//      *@notice function to transfer tokens peer to peer 
//      */ 
//     function transferFrom(address from, address to, uint tokens) public returns (bool success) {
//         require(from!=owner,"Cannot Transfer from Owner Account");
// 	    require(from!=to,"Cannot transfer to same account");
// 	    require(tokens<balances[from],"Fraud not possible");
//         balances[from] = balances[from]-tokens;
//         allowed[from][msg.sender] = allowed[from][msg.sender]-tokens;
//         balances[to] = balances[to]+tokens;
        
//         /**
//          *@dev emitting event Transfer
//          */ 
//         emit Transfer(from, to, tokens);
//         return true;
//     }

//     function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
//         return allowed[tokenOwner][spender];
//     }
// }
