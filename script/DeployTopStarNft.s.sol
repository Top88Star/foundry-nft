//SPDX-License-Identifier: MIT


pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {TopStarNft} from "../src/TopStarNft.sol";

contract DeployTopStarNft is Script {
    function run () external returns (TopStarNft){
        vm.startBroadcast();
        TopStarNft topStarNft = new TopStarNft();
        vm.stopBroadcast();
        return topStarNft;
    }
}