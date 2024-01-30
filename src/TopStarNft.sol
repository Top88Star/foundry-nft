//SPDX-License-Identifier: MIT


pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TopStarNft is ERC721 {

    uint256 private s_tokenConter;
    mapping (uint256 => string) private s_tokenToUri;
    constructor() ERC721 ("TopStar", "TOP"){
        s_tokenConter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenToUri[s_tokenConter] = tokenUri;
        _safeMint(msg.sender, s_tokenConter);
        s_tokenConter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        
    }

}