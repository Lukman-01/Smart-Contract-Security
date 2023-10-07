// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./Helper.sol";

// Create a new contract, instead of typecasting an address 
// into a contract inside the constructor. So instead of doing Helper(_helper) 
// where you are typecasting _helper address into a contract which may or may not 
// be the Helper contract, create an explicit new helper contract instance using new Helper().
contract Good {
    Helper public helper;
    constructor() payable {
        helper = new Helper();
    }

    function isUserEligible() public view returns(bool) {
        return helper.isUserEligible(msg.sender);
    }

    function addUserToList() public  {
        helper.setUserEligible(msg.sender);
    }

    fallback() external {}
}