pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    constructor(string memory _name, string memory _symbol, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function mint(address _to, uint _value) public {
        totalSupply += _value;
        balanceOf[_to] += _value;
    }

    function burn(address _from, uint _value) public {
        require(balanceOf[_from] >= _value, "Not enough balance to burn.");
        totalSupply -= _value;
        balanceOf[_from] -= _value;
    }
}