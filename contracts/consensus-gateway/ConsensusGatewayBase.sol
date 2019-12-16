pragma solidity ^0.5.0;

// Copyright 2019 OpenST Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import "../consensus/ConsensusModule.sol";
import "../ERC20I.sol";

/** Base contract for ConsensusGateway and ConsensusCogateway contracts. */
contract ConsensusGatewayBase {

    /** Storage */

    /** Address of most contract on origin or auxiliary chain. */
    ERC20I public most;

    /** Mapping of message sender and nonce. */
    mapping(address => uint256) public  nonces;

    /** Height of current metablock */
    uint256 public currentMetablockHeight;


    /** External functions. */

    function setup(
        ERC20I _most,
        uint256 _currentMetablockHeight
    )
        external
    {
        require(
            address(_most) != address(0),
            "most address must not be 0."
        );

        currentMetablockHeight = _currentMetablockHeight;
        most = _most;
    }
}
