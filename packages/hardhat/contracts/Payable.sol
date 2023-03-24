pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

abstract contract PayableIDP {
    function deposit() public virtual;

    function withdraw() public virtual;

    function transfer(address payable _to, uint _amount) public virtual;
}


contract Payable is PayableIDP {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public override {}

    function withdraw() public override {
        uint amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    function transfer(address payable _to, uint _amount) public override {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}