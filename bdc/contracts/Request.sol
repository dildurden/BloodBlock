pragma solidity ^0.5.0;

import "../contracts/DonorRegister.sol"; //Importing and inherting the donor register Contract to use the methods & variables from the same.
contract Request is DonorRegister{
    struct bloodReq{
        string location;
        bGrp reqGrp;
        bool reqStatus;//To know the status of request false for avialable and true for not available
    }
    mapping(address=>bloodReq)public request; //Mapping by address
    //Set Request function
    function setReq(address _requestee,string memory _location,bGrp _reqGrp)public{
       request[_requestee] = bloodReq(_location,_reqGrp,false);
    }
    //Get Request fuction (address as parameter)
    function getReq(address requestEE)public view returns(string memory _location,bGrp _reqGrp,bool _reqStatus){
       _location = request[requestEE].location;
       _reqGrp = request[requestEE].reqGrp;
       _reqStatus = request[requestEE].reqStatus;
    }
    //Event for acceptReq function
    event requestAccpt(address,address);
    //Accepting request function to accept the donor
    function acceptReq(address acceptor,address requestee)public{
        //asserting whether the status is Available and the blood groups match
        assert(request[requestee].reqStatus == false);
        assert(donor[acceptor].donorStatus == false);
        assert(request[requestee].reqGrp == donor[acceptor].grp);
        //Status changed to not available
        request[requestee].reqStatus = true;
        donor[acceptor].donorStatus = true;
        emit requestAccpt(acceptor,requestee);//Event called
        //5 Tokens are transfered to donors account
        transfer(acceptor, 5);
    }
}
