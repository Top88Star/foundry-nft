//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {TopStarNft} from "../src/TopStarNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintTopStarNft is Script {
    string public constant BUS = "ipfs://bafybeic4tbegumgrkqorxahxc4mramuyxb6qk62qnaaw5k3djauegprhbu/?filename=BUS.json";
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "TopStarNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        TopStarNft(contractAddress).mintNft(BUS);
        vm.stopBroadcast();
    }

}