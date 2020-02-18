pragma solidity >=0.5.0 <0.6.0;

// Copyright 2020 OpenST Ltd.
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

import "./GenesisERC20Cogateway.sol";
import "../proxies/MasterCopyNonUpgradable.sol";
import "../message-bus/MessageBus.sol";
import "../message-bus/StateRootInterface.sol";

/**
 * @title ERC20Cogateway facilitates confirming deposit and withdrawal of
 *        utility token at auxiliary chain.
 */
contract ERC20Cogateway is MasterCopyNonUpgradable, MessageBus, GenesisERC20Cogateway {

    /* Storage */

    /** Specifies if the ERC20Cogateway is activated. */
    bool public activated;


    /* Modifiers */

    /** Checks that contract is active. */
    modifier isActive() {
        require(
            activated == true,
            "ERC20Cogateway is not activated."
        );
        _;
    }


    /* External Functions */

    /**
     * @notice Setup function to initialize ERC20Cogateway contract.
     *         It sets up inbox and outbox of message.
     */
    function setup()
        external
    {
        MessageOutbox.setupMessageOutbox(genesisMetachainId, genesisERC20Gateway);

        MessageInbox.setupMessageInbox(
            genesisMetachainId,
            address(this),
            genesisOutboxStorageIndex,
            StateRootInterface(genesisStateRootProvider),
            genesisOutboxStorageIndex
        );
    }
}
