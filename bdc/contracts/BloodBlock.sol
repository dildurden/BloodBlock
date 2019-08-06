pragma solidity ^0.5.0;

contract BloodBlock {
    
    enum gender { male, female, other}
    enum bGrp { AP, AN, BP, BN,OP, ON,ABP,ABN}
    
    struct bDonor{
        string name;
        uint age;
        string place;
        uint mob;
        uint bldVol;
        string medCond;
        gender donGen;
        bGrp grp;
        
    }
    
    mapping(uint=>bDonor)sample;
    
    function setDonor(uint _id,string memory _name,uint _age,string memory _place, uint _mob, uint _bldVol,string memory _medCond, gender _donGen, bGrp _grp)public{
        sample[_id] = bDonor(_name,_age,_place,_mob,_bldVol,_medCond,_donGen,_grp);
    }
    
    function getSample(uint _id)public view returns (uint _age,string memory _place,uint _bldVol,string memory _medCond,gender _donGen,bGrp _grp){
        _age = sample[_id].age;
        _place = sample[_id].place;
        _bldVol = sample[_id].bldVol;
        _medCond = sample[_id].medCond;
        _donGen = sample[_id].donGen;
        _grp = sample[_id].grp;
    }
    
    // function getSampleGrp(bGrp _grp)public view returns(uint _age,uint _bldVol){
    //     _age = sample[_grp].age;
    //     _bldVol = sample[_grp].bldVol;
    // }
}