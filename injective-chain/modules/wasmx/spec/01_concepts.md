---
sidebar_position: 1
title: Concepts
---

## Concepts

### Begin blocker execution

Smart contracts can only respond to incoming messages and do not have the ability to execute actions on their own schedule. The Wasmx module allows contracts to be registered and called in the begin blockers section of each block.
To be eligible for this, each registered contract must respond to the sudo message called "begin_blocker," which can only be called by the chain itself and not directly by any user or other contract. This ensures that the "begin_blocker" message can be trusted.

### Registration

Upon registering a contract, the user must declare a gas price, which is the amount they are willing to pay for contract execution, as well as a gas limit, which is the maximum amount of gas that can be consumed during the execution of the contract.

Currently, contract registration can only be done through a governance proposal. This proposal, if approved, will add the contract at a specific address to the list of contracts that are run during each "begin blockers" period.

For security reasons, the proposer must specify a code_id for the contract, which will be verified upon registration and each time the contract is executed. This is to prevent an attacker from registering a benign contract but later upgrading it to a malicious one. The proposer can request to be exempt from this check when registering the contract to avoid delays when a new version of the contract is released, but this may affect the voting results depending on the trustworthiness of the proposer.

The proposer can also request for the contract to be "pinned," meaning it is loaded and kept in memory, which can greatly improve the performance of the contract.

### Deregistration

A contract can be deregistered through a governance proposal, which can be initiated by anyone, including the contract owner if they no longer require the contract or by any other individual if the contract is found to be malicious.

If contract fails to execute due to insufficient gas it will be automatically deregistered.

When contract is deregistered, wasmx will call special deregister callback (if present).

### Pausing, params update

The owner of a contract has the ability to deactivate or activate the contract at any time without requiring a governance vote. They can also update the parameters for contract execution, such as the gas price or gas limit, at any time.


### Batch methods

For convenience, the Wasmx module provides batch versions of some of the previously mentioned proposals, such as batch registration and deregistration, as well as a batch version of the StoreCodeProposal. These batch versions allow multiple proposals to be processed at the same time, rather than individually.