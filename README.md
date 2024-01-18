# DegeNFT
A soulbound NFT collection for DEGEN HallOfFamers

NFTs cannot be transferred once minted.
NFTs can be burned.

Implements OpenZeppelin ERC721URIStorage standard

### Deploy
Copy or clone the code into Remix or another IDE.  The contract deployer is automatically set as contract owner

### Mint/Award NFT
To mint an NFT call awardNFT() and pass: 
**to** - Address to send the NFT to  
**tokenURI** - URI hosting the image associated with the NFT

Only the owner of the contract can call this function.

### Soulbound functionality
The standard ERC721 functions transferFrom() and _safeTransferFrom() are overridden.  Calling this function will revert the transaction unless the sender is addresss(0) (this happens when minting) or receiver is address(0) (this happens when burning a token).

### Ownership
The token follows the standard OpenZeppelin Ownable structure meaning contract ownership can be transferred.
