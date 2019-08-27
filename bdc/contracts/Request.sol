pragma solidity ^0.5.0;

import "../contracts/DonorRegister.sol";
contract Request is DonorRegister{
  // struct bRequest{
  //   uint donorNos;
  //   string place;
  //   bGrp reqGrp;
  //   bool status;
  // }
  // address donors;
  // mapping(address =>bRequest)request;
  // function requestBlood(address _id,uint _donorNos,string memory _place,bGrp _reqGrp,bool _status)public{
  //  request[_id] = bRequest(_donorNos,_place,_reqGrp,_status);
  // }
  
  // function appreciation()
  
  // constructor() public {
  // }
  struct acpReq{
        //address requestee;
        uint donorNos;
        string location;
        //uint age;
        bGrp reqGrp;
        //bool status;
    }

    mapping(address=>acpReq)acceptor;

    function setReq(address _requestee,uint _donorNos,string memory _location,bGrp _reqGrp)public{
       acceptor[_requestee] = acpReq(_donorNos,_location,_reqGrp);
   }
   
   function getReq(address requestEE)public view returns(uint _donorNos,string memory _location,bGrp _reqGrp){
       _donorNos = acceptor[requestEE].donorNos;
       _location = acceptor[requestEE].location;
       _reqGrp = acceptor[requestEE].reqGrp;
   }
}
