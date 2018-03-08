pragma solidity^0.4.0;
contract ERC20
{
    function transfer(address to,uint256 amount)public;
    function transferfrom(address from,address to,uint256 amount)public;
    function mint(uint256 amount)public returns(uint256);
}
contract test is ERC20
{
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;
    address owner;
    function test()
    {
        name="Mahendra Next Wealth";
        symbol="MNW";
        decimals=18;
        totalSupply=1000; 
        owner=msg.sender;
    }
  
    mapping(address=>uint256)balance;
    modifier check()
    {
        require(owner==msg.sender);
        _;
    }
    function transfer(address to,uint256 amount)check()public
    {
        require(amount<=balance[msg.sender]&&balance[msg.sender]!=0);
     balance[msg.sender]-=amount;
     balance[to]+=amount;
    }
    function transferfrom(address from,address to,uint256 amount)public
    {
        require(amount<=balance[msg.sender]&&balance[msg.sender]!=0);
        balance[from]=amount;
        balance[msg.sender]-=amount;
        balance[to]+=amount;
    }
    function mint(uint256 amount)check()public returns(uint256)
    {
        require(amount<=totalSupply);
        balance[msg.sender]+=amount;
        require(balance[msg.sender]<=totalSupply);
        return balance[msg.sender];
    }
}
