pragma solidity ^0.8.0;

contract AbcBank{
    address public owner;
    uint8 count;
    
    //step 4
    
    mapping(address => uint) private accounts;
    constructor() payable{
        owner = msg.sender;
        require(msg.value >= 50000000000000000000);
        count = 0;
    }
    
    //step 2 = close bank
    
    function closeBank() external payable{
        require(msg.sender == owner,"Only owner close bank");
        selfdestruct(payable(owner));
    }
    
    // step 3
    
    function openAccount() public payable{
        require(accounts[msg.sender] == 0, "Account already exist");
        require(msg.value > 0 && msg.sender != address(0), "value should not be 0 or invalid address");
        accounts[msg.sender] = msg.value;
        if(count <= 4){
          //  payable(msg.sender).transfer(10000000000000000000);
            accounts[msg.sender] += 10000000000000000000;
            count ++;
        }
    }
    
    //step 5
    
    function depositAmount(address _addr, uint _amount) public payable{
        require(_amount > 0 && _addr != address(0), "value should not be 0 or invalid address");
        accounts[_addr] += _amount;
    }
    
    // step 6 
    
    function withdraw(uint amount) public payable{
        require(amount > 0 && msg.sender != address(0), "value should not be 0 or invalid address");
        require(amount <= accounts[msg.sender],"invalid bank account");
        payable(msg.sender).transfer(amount);
        accounts[msg.sender] -= amount;
    }
    
    function inquireBalance() public view returns(uint){
        return accounts[msg.sender];
    }
    
    function closeAccount() public {
        require(msg.sender != address(0) && accounts[msg.sender] > 0,"value should not be 0 or invalid address");
        payable(msg.sender).transfer(accounts[msg.sender]);
        //delete accounts[msg.sender];
    }
    
    function bankTotalBalance() public view returns(uint){
        require(msg.sender == owner, "only owner can view bank balance");
        return address(this).balance;
    }
}