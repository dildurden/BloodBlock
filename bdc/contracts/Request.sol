pragma solidity ^0.5.0;

import "../contracts/DonorRegister.sol"; //Importing and inherting the donor register Contract to use the methods & variables from the same.
contract Request is DonorRegister{
    struct bloodReq{
        string location;
        bGrp reqGrp;
        bool reqStatus;//To know the status of request false for avialable and true for not available
    }

    uint donor_end = now;//To store the donor period in which donation cannot occur
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
        //Checking whether the donor has already donated or not the interval b/w donations should be 3 months but for devolpment its set as 30 seconds
        require(now >= donor_end,"Cannot donate as you have already donated wait for 30 secs");
        assert(request[requestee].reqGrp == donor[acceptor].grp);//asserting whether the blood groups match
        //The donor unavailabilty period is set 30 seconds from 'now'
        donor_end = now + 30 seconds;
        //Timer Condition for donor availability
        if(donor_end >= now){
        request[requestee].reqStatus = true;
        donor[acceptor].active = false;//Status changed to not available
        emit requestAccpt(acceptor,requestee);//Event called
        //5 Tokens are transfered to donors account after succesfull donation
        transfer(acceptor, 5);
        }
    }
}
