pragma solidity ^0.8.0;

contract Demo{
    
    uint a = 4;
    function dosomething(uint _a) payable public returns(uint){
        a = _a;
        return a;
    }
    function getA() public view returns(uint){
        return a;
    }
    
}

//iiui