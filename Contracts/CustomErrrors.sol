//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;
 
contract WillThrow {
    error ThisIsACustomError(string, string);
    function aFunction() public pure {
        revert ThisIsACustomError("Text 1", "text message 2");
    }
}