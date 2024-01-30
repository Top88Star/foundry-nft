//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployTopStarNft} from "../script/DeployTopStarNft.s.sol";
import {TopStarNft} from "../src/TopStarNft.sol";

contract TopStarNftTest is Test {
    DeployTopStarNft public deployer;
    TopStarNft public topStarNft;

    address public USER = makeAddr("user");
    string public constant BUS = "ipfs://bafybeic4tbegumgrkqorxahxc4mramuyxb6qk62qnaaw5k3djauegprhbu/?filename=BUS.json";
    function setUp() public {
        deployer = new DeployTopStarNft();
        topStarNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expected = "TopStar";
        string memory actualName = topStarNft.name();

        assert(keccak256(abi.encodePacked(expected)) 
            == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndBalance() public  {
       vm.prank(USER);
       topStarNft.mintNft(BUS);
       assert(topStarNft.balanceOf(USER) == 1);
    }
}
