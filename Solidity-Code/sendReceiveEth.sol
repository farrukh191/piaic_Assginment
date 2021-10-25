pragma solidity ^0.8.0;

contract payableDemo{
    
    event logUint(uint);
    
    function depositeFund() public payable{
        emit logUint(msg.value);
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function send1Eth(address payable _to) public{
        _to.transfer(5 ether);
    }
    
}