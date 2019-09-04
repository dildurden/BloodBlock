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
  struct bloodReq{
        //address requestee;
        uint donorNos;
        string location;
        bGrp reqGrp;
        bool reqStatus;
    }
    // address donors;
    mapping(address=>bloodReq)public request;
    function setReq(address _requestee,uint _donorNos,string memory _location,bGrp _reqGrp)public{
       request[_requestee] = bloodReq(_donorNos,_location,_reqGrp,false);
   }
   
   function getReq(address requestEE)public view returns(uint _donorNos,string memory _location,bGrp _reqGrp,bool _reqStatus){
       _donorNos = request[requestEE].donorNos;
       _location = request[requestEE].location;
       _reqGrp = request[requestEE].reqGrp;
       _reqStatus = request[requestEE].reqStatus;
   }
   event requestAccpt(address,address);
   //Accepting request function to accept
   function acceptReq(address acceptor,address requestee)public{
       assert(request[requestee].reqStatus == false);
       assert(donor[acceptor].donorStatus == false);
       assert(request[requestee].reqGrp == donor[acceptor].grp);
       request[requestee].reqStatus = true;
       donor[acceptor].donorStatus = true;
       emit requestAccpt(acceptor,requestee);
       transfer(acceptor, 5);
    //    donor[acceptor].

    //    donors = accept;
        // getSample(donors);
        // donorStatus = status.Donated;
        // emit counter(donorStatus);

   }
}
