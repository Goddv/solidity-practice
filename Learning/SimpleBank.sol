// SPDX-License-Identifier: MIT
pragma solidity >=0.4.23 <0.9.0;

contract getBank {
    function getBalance(address _addr) public view returns (uint balance){
        balance = address(_addr).balance;
    }
    function depositFunds(address payable _addr, uint amountToDeposit) public {
        _addr.transfer(amountToDeposit);
    }

    function withdrawFund(address payable _withdrawAddr, uint amountToWithdraw) private {
        _withdrawAddr.transfer(amountToWithdraw);
    }
        
}