pragma solidity ^0.5.0;

import "../contracts/DonorRegister.sol";
contract Request is DonorRegister{
  struct bRequest{
    uint donorNos;
    string place;
    bGrp reqGrp;
    bool status;
  }
  address donors;
  mapping(address =>bRequest)request;
  function requestBlood(address _id,uint _donorNos,string memory _place,bGrp _reqGrp,bool _status)public{
   request[_id] = bRequest(_donorNos,_place,_reqGrp,_status);
  }
  
  
  // constructor() public {
  // }
}
