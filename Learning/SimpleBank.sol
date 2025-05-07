// SPDX-License-Identifier: MIT
pragma solidity >=0.4.23 <0.9.0;

contract getBank {
    mapping (address => uint) public balanceOf;

    function getBalance(address _addr) public view returns (uint balance){
        balance = balanceOf[_addr];
    }

    function depositFunds() public payable {
        require (msg.value > 0, "Amount shouldn't be zero");
        balanceOf[msg.sender] += msg.value;
    }

    function withdrawFunds(uint amount) public payable {
        require (balanceOf[msg.sender] >= amount, "Can't withdraw more than you own");
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    
    }
}