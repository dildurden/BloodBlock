pragma solidity ^0.5.0;
contract BloodBlock {
    enum gender { male, female, other}
    enum bGrp { AP, AN, BP, BN,OP, ON,ABP,ABN}
    enum medCond { yes ,no}
    struct bDonor{
        string name;
        uint age;
        string place;
        uint mob;
        uint bldVol;
        medCond donorCond;
        gender donGen;
        bGrp grp;
     }
    mapping(uint=>bDonor)sample;
    function setDonor(uint _id,string memory _name,uint _age,string memory _place, uint _mob, uint _bldVol,medCond _donorCond, gender _donGen, bGrp _grp)public{
        sample[_id] = bDonor(_name,_age,_place,_mob,_bldVol,_donorCond,_donGen,_grp);
    }
    function getSample(uint _id)public view returns (uint _age,string memory _place,uint _bldVol,medCond _donorCond,gender _donGen,bGrp _grp){
        _age = sample[_id].age;
        _place = sample[_id].place;
        _bldVol = sample[_id].bldVol;
        _donorCond = sample[_id].donorCond;
        _donGen = sample[_id].donGen;
        _grp = sample[_id].grp;
    }
}