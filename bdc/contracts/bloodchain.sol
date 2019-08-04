pragma solidity ^0.5.0;

contract DonorMangementSystem {
    enum gender {male,female,other}
    
    struct profile {
        string name;
        uint age;
        gender donorGender;
        string bloodGroup;
    }
    
    mapping(uint => profile) donor;
    
    function setDonor(uint _donor, string memory _name, uint _age,gender _donorGender,string memory _bloodGroup) public {
        donor[_donor] = profile(_name,_age,_donorGender,_bloodGroup);
    }
    
    function getDonor(uint _donor) public view returns (string memory _name, uint _age, gender _donorGender, string memory _bloodGroup){
        _name = donor[_donor].name;
        _age = donor[_donor].age;
        _donorGender = donor[_donor].donorGender;
        _bloodGroup = donor[_donor].bloodGroup;
    }
}
