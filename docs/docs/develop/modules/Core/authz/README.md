# `authz`

## Abstract

`x/authz` is an implementation of a Cosmos SDK module, per [ADR 30](https://github.com/cosmos/cosmos-sdk/blob/v0.45.11/docs/architecture/adr-030-authz-module.md), that allows
granting arbitrary privileges from one account (the granter) to another account (the grantee). Authorizations must be granted for a particular Msg service method one by one using an implementation of the `Authorization` interface.

1. **[Concept](01_concepts.md)**
    - [Authorization](01_concepts.md#Authorization)
    - [Built-in Authorizations](01_concepts.md#Built-in-Authorization)
    - [Gas](01_concepts.md#gas)
2. **[State](02_state.md)**
3. **[Messages](03_messages.md)**
    - [MsgGrant](03_messages.md#MsgGrant)
    - [MsgRevoke](03_messages.md#MsgRevoke)
    - [MsgExec](03_messages.md#MsgExec)
4. **[Events](04_events.md)**
    - [Keeper](04_events.md#Keeper)
