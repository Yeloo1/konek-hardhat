pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// ERC20 Token
contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}

// ERC721 NFT
contract MyNFT is ERC721 {
    uint256 public nextTokenId;
    address public owner;

    constructor() ERC721("MyNFT", "MNFT") {
        owner = msg.sender;
        nextTokenId = 1;
    }

    function mint(address to) external {
        require(msg.sender == owner, "Only owner can mint");
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}