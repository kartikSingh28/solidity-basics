// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleUint {
    uint256 public myUint;           // Range: 0 to (2^256 - 1)

    uint8 public myUint8 = 250;      // Range: 0 to 255
    uint8 public myUint_EXP = 2**4;  // 2^4 = 16

    int public myInt = -10;          // Can store negative values

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        myUint--;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementInt() public {
        myInt++;
    }
}
