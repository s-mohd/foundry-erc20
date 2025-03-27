// SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint) private s_balances;
    mapping(address => mapping(address => uint256)) public S_allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function trancefer(address _to, uint256 _amount) public {
        require(_to != address(0x0));
        require(balanceOf(msg.sender) >= _amount);
        require(balanceOf(_to) + _amount >= balanceOf(_to));

        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        S_allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}
