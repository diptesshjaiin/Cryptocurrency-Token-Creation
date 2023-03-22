# Cryptocurrency-Token-Creation

In this project we're going to create a Cryptocurrency token from scratch with mint and burn features. 

pragma solidity ^0.8.0;
contract MyToken {

string public name;
string public symbol;
uint public totalSupply;

These are the public variables that store the details about our token. name and symbol are both strings, while totalSupply is an unsigned integer (uint). By making them public, we can access their values from outside the contract.

mapping(address => uint) public balanceOf;

This is a mapping that associates addresses with balances. Each address corresponds to a uint value, which represents the number of tokens that the address holds. By making it public, we can access the balance of any address from outside the contract.

constructor(string memory _name, string memory _symbol, uint _totalSupply) {
    name = _name;
    symbol = _symbol;
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = _totalSupply;

The constructor initializes the token with the specified name, symbol, and total supply, and assigns the entire supply to the contract creator's address.

It takes three parameters: the name, symbol, and initial total supply of our token. When the contract is deployed, these values are set and stored in the corresponding public variables.

The last line in the constructor initializes the balance of the contract creator (i.e., the account that deployed the contract) to the total supply of the token.


function mint(address _to, uint _value) public {
    totalSupply += _value;
    balanceOf[_to] += _value;
}

The mint() function takes an address and a value as parameters, and increases the total supply by the given value, while also increasing the balance of the specified address. 

When the function is called, it adds the _value parameter to the totalSupply variable, effectively creating new tokens. It also adds the same _value parameter to the balanceOf mapping at the _to address, which means that the address now has more tokens.

Note that the public keyword means that this function can be called from outside the contract, by anyone who knows the address of the contract.

function burn(address _from, uint _value) public {
    require(balanceOf[_from] >= _value, "Not enough balance to burn.");
    totalSupply -= _value;
    balanceOf[_from] -= _value;
}

It takes two parameters: the address to burn tokens from, and the number of tokens to burn and checks if the balance of the address is greater than or equal to the given value. If it is, the function deducts the value from both the total supply and the balance of the specified address. Otherwise, it throws an error message indicating that there are not enough tokens to burn. 

When the function is called, it first checks if the _from address has enough tokens to burn. If the balance of _from is greater than or equal to the _value parameter, the function subtracts the _value parameter from both the totalSupply variable and the _from address's balance in the balanceOf mapping.

If the balance of _from is not enough, the function throws an error message using the require() function, which ensures that a certain condition is met before executing the rest of the code.
