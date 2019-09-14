pragma solidity ^0.5.0;
import "./Bdctoken.sol"; //Importing and inheriting the blood token contract

contract DonorRegister is Bdctoken{
  enum gender { male, female, other}
  enum bGrp { AP, AN, BP, BN,OP, ON,ABP,ABN}
  enum status {NotAvailavle,Available}
  struct bDonor{
        string name;
        uint age;
        string place;
        uint mob;
        bool medCond;
        gender donGen;
        bGrp grp;
        bool donorStatus;
        bool active;
     }
  mapping(address=>bDonor)donor;
  event donorRegister(address,string);//Event for Registartion
  //Function to Add Donors
  function setDonor(address _donorid,string memory _name,uint _age,string memory _place, uint _mob,bool _medCond, gender _donGen, bGrp _grp)public{
      require(_donorid != msg.sender,"Owner Cannot be donor");//Donor cannot be Owner
      require(donor[_donorid].donorStatus == false,"Donor Not Available");//To check whether the same user exists
      require(_age >= 18,"Donor Not Above 18");//Donor should be above 18
      donor[_donorid] = bDonor(_name,_age,_place,_mob,_medCond,_donGen,_grp,false,true);
      emit donorRegister(_donorid,_name);//Event called
  }
  //Function to get the donor details
 function getSample(address donorID)public view returns (uint _age,string memory _place,gender _donGen,bGrp _grp,bool _medCond,bool _active,uint token){
     //address donorID = msg.sender;
     _age = donor[donorID].age;
     _place = donor[donorID].place;
     _donGen = donor[donorID].donGen;
     _grp = donor[donorID].grp;
     _medCond = donor[donorID].medCond;
     _active = donor[donorID].active;
     token = balanceOf(donorID);//the amount of tokens the account holds

  }
}
