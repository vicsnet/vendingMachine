// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract VendingMachine{
    address public owner;
    mapping(address => uint256) public donutBalances;
    constructor(){
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVendingMachineBalance () public view returns (uint256){
        return donutBalances[address(this)];
    } 

    function restock(uint amount) public {
        require(msg.sender==owner, "You are not the Owner of the Contract");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable{
        require(msg.value >= amount * 2 ether, "you must pay atleast 2 ether per donut");
        require(donutBalances[address(this)] >= amount, "Not enough donut in stock to fulfill request");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }

    function withdrawEther () public payable{
    payable(owner).transfer(address(this).balance);
    }
}