pragma solidity ^0.8.0;

contract Fallback{
    event Log(string);
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    
    fallback() external payable{
        payable(owner).transfer(msg.value);
       //  emit Log("Fall back function call");
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract CallFallback{
    function doSomething(address payable _to) public payable{
        _to.transfer(msg.value);
    }
}
