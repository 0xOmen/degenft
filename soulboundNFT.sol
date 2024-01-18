// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulBoundToken is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("SoulBoundDegen", "DEGENFT") Ownable(msg.sender) {}

    function awardNFT(address to, string memory tokenURI)
        public onlyOwner
        returns  (uint256)
    {
        uint256 newNFTId = _tokenIdCounter.current();
        _mint(to, newNFTId);
        _setTokenURI(newNFTId, tokenURI);

        _tokenIdCounter.increment();
        return newNFTId;
    }

    function transferFrom(address from, address to, uint256) override(ERC721, IERC721) pure public {
        require(from == address(0) || to == address(0), "Soulbound token cannot be transferred");
    }

    function _safeTransfer(address from, address to, uint256, bytes memory) override(ERC721) pure internal {
        require(from == address(0) || to == address(0), "Soulbound token cannot be transferred");
    }

    function burn(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Only token owner can burn");
        _burn(tokenId);
    }
}
