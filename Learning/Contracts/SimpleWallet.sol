// SPDX-License-Identifier: MIT
pragma solidity >=0.4.23 <0.9.0;

contract SimpleWallet {
    //Initialize owner's public adress, map adresses and allowance;
    address public owner;
    mapping (address => bool) public hasAccess;

    //Make deployer an owner of contract
    constructor() {
        owner = msg.sender;
        hasAccess[owner] = true;
    }

    //Only owner modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "You must be the owner to do that");
        _;
    }

    //Allowance modifier
    modifier onlyAllowed() {
        require(hasAccess[msg.sender], "This account doesn't have access.");
        _;
    }

    //Give access to wallet
    function giveAccess (address _to) public onlyOwner (){
        hasAccess[_to] = true;
    }

    //Remove acces from wallet
    function removeAccess (address _to) public onlyOwner () {
        hasAccess[_to] = false;
    }

    //Get wallet's status
    function getStatus (address _who) public view returns (string memory) {
        if (hasAccess[_who] == true && _who == owner) {
            return "Owner";
        }
        else if (hasAccess[_who] != false) {
            return "User with access";
        }
        else {
            return "No access";
        }
    }

    //Change owner
    function changeOwner (address _newOwner) public onlyOwner () {
        owner = _newOwner;
    }

    //Deposit
    function depositFunds () public payable {
    }

    //Withdraw
    function withdrawFunds (uint256 _amount) onlyOwner() public {
        require(hasAccess[msg.sender], "This account doesn't have access.");
        require(address (this).balance > _amount, "Not enough funds");
        payable(msg.sender).transfer(_amount);
    }

    //Get wallet balance
    function getBalance () public view returns (uint256) {
        return address(this).balance;
    }
}