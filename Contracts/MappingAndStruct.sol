//SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.14;
 
contract MappingsStructExample {
    
    struct Transaction {
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }
 
    mapping(address => Balance) public balanceReceived;
 
 
    function getBalance(address _addr) public view returns(uint) {
        return balanceReceived[_addr].totalBalance;
    }
 
    function depositMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numDeposits] = deposit;
        balanceReceived[msg.sender].numDeposits++;
    }
    
   function withdrawMoney(address payable _to, uint _amount) public {
    require(_amount <= balanceReceived[msg.sender].totalBalance, "Not enough balance");

    // Reduce balance
    balanceReceived[msg.sender].totalBalance -= _amount;

    // Record a new withdrawal
    Transaction memory withdrawal = Transaction(_amount, block.timestamp);
    balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].numWithdrawals] = withdrawal;
    balanceReceived[msg.sender].numWithdrawals++;

    // Send the amount
    _to.transfer(_amount);
}

}