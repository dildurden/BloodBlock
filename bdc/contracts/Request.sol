pragma solidity ^0.5.0;

import "../contracts/DonorRegister.sol";
contract Request is DonorRegister{
  struct bRequest{
    uint amount;
    string place;
    address donors;
    bool status;

  }
  mapping(uint =>bRequest)request;
  function requestBlood(uint _id,uint _amount,string memory _place,address _donors,bool _status)public{
   request[_id] = bRequest(_amount,_place,_donors,_status);
  }
  
  
  // constructor() public {
  // }
}
