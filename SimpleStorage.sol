// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 favNumber;

    mapping(string => uint256) public nameToFavNum;

    struct People {
        uint256 favNumber;
        string name;
    }

    People[] public people;

    function addPerson(string memory _name, uint256 _favNumber) public {
        // People memory newPerson = People({favNumber : _favNumber, name : _name});
        people.push((People(_favNumber, _name)));
        nameToFavNum[_name] = _favNumber;
    }

    function store(uint256 _favNum) public virtual {
        favNumber = _favNum;
    }

    function retrieve() public view returns (uint256) {
        return favNumber;
    }
}
