pragma solidity >=0.5.0 <0.6.0;

import "../../consensus/ConsensusModule.sol";

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


contract ConsensusModuleTest is ConsensusModule{


    /**
     * @notice This method is created to test setupConsensus method.
     * @param _consensus Address of consensus contract.
     */
    function setupConsensusExternal(ConsensusInterface _consensus) public
    {
        ConsensusModule.setupConsensus(_consensus);
    }

}
