/*
   Please read:
   The contract was updated to address mapping, noe the donors address is mapped to struct.
   Consequently, the address has to stored in the address variable donorID
   Added modifier crieria to check for age and medicalConditions for function setDonor
   getSample() is now a parameter less function that returns the entire struct
   Intialised Constructor
   Thus the corresponding views and routes are to be updated
*/
pragma solidity ^0.5.0;


contract DonorRegister {
  enum gender { male, female, other}
    enum bGrp { AP, AN, BP, BN,OP, ON,ABP,ABN}
    struct bDonor{
      //   address donorID;
        string name;
        uint age;
        string place;
        uint mob;
        bool medCond;
        gender donGen;
        bGrp grp;
      //   uint counter;
     }
  mapping(address=>bDonor)donor;
//   mapping(uint=>bDonor)donor;
//   modifier criteria {
//      require(sample[msg.sender].age > 18,"Not old enough");
//    //   require(sample[msg.sender].medCond == false,"Not Medically fit");
//      _;

//   }
  function setDonor(address _donorid,string memory _name,uint _age,string memory _place, uint _mob,bool _medCond, gender _donGen, bGrp _grp)public{
      donor[_donorid] = bDonor(_name,_age,_place,_mob,_medCond,_donGen,_grp);
  }
  function getSample(address donorID)public view returns (uint _age,string memory _place,gender _donGen,bGrp _grp,bool _medCond){
     //address donorID = msg.sender;
     _age = donor[donorID].age;
     _place = donor[donorID].place;
     _donGen = donor[donorID].donGen;
     _grp = donor[donorID].grp;
     _medCond = donor[donorID].medCond;

  }
  constructor() public {
     //Intialising the struct variables like Account address and other variables
   //   bDonor({donorID:msg.sender,name:"",age:0,place:"",mob:0,medCond:false,donGen:gender.male,grp:bGrp.AP});
   }
}
