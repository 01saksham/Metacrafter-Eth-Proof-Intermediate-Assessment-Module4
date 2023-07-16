// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function mint(address to, uint256 amount) external;
    function burn(uint256 amount) external;
    function transfer(address recipient, uint256 amount) external returns (bool);
    function addItem( string memory itemName, uint256 price, string memory desc) external;
    function redeemItem(uint256 Item) external payable;
    function getItemDetails(uint256 Item) external view returns (string memory, uint256);
    function owner() external view returns (address);
}
contract DegenToken is IERC20 {
    string public name;
    string public symbol;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(uint256 => ItemInfo) private _items;
    address private _owner;
    event ItemRedeemed(address indexed player, uint256 Item);
        uint public itemCount = 0;
        
    struct ItemInfo {
        uint itemId;
        string name;
        uint price;
        string desc;
    }
    constructor() {
        name = "Degen";
        symbol = "DGN";
        _totalSupply = 0;
        _owner = msg.sender;

 addItem("DLQ", 100, "A Sniper");
        addItem("CBR", 200, "An Smg");
        addItem("KRM", 300, "A Shotgun");
    }
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the owner can call this function");
        _;
    }

    function totalSupply() external view  returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view  returns (uint256) {
        return _balances[account];
    }

    function mint(address to, uint256 amount) external  onlyOwner {
        require(amount > 0, "Amount must be greater than zero.");
        _totalSupply += amount;
        _balances[to] += amount;
    }

    function burn(uint256 amount) external  {
        require(amount > 0, "Amount must be greater than zero.");
        require(_balances[msg.sender] >= amount, "The balance is insufficient.");
        _totalSupply -= amount;
        _balances[msg.sender] -= amount;
    }

     function transfer(address recipient, uint256 amount) external  returns (bool) {
        require(amount > 0, "Amount must be greater than zero.");
        require(_balances[msg.sender] >= amount, "The balance is insufficient.");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        return true;
    }

    function addItem( string memory itemName, uint256 price, string memory desc) public   {
        itemCount++;
        _items[itemCount] = ItemInfo(itemCount,itemName, price, desc);
    }

    function redeemItem(uint256 Item) external  payable {
        require(bytes(_items[Item].name).length > 0, "Item does not exist");
        require(_balances[msg.sender] >= _items[Item].price, "Insufficient balance");
        _balances[msg.sender] -= _items[Item].price;
        emit ItemRedeemed(msg.sender, Item);
    }

    function getItemDetails(uint256 Item) external view  returns (string memory, uint256) {
        return (_items[Item].name, _items[Item].price);
    }

     function getItems() external view returns (ItemInfo[] memory) {
        ItemInfo[] memory allItems = new ItemInfo[](itemCount);
        
        for (uint i = 1; i <= itemCount; i++) {
            allItems[i - 1] = _items[i];
        }
        
        return allItems;
    }

    function owner() external view  returns (address) {
        return _owner;
    }

}
