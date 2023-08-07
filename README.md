<div align="right">

[![GitHub License](https://img.shields.io/github/license/block-foundation/blocktxt?style=flat-square&logo=readthedocs&logoColor=FFFFFF&label=&labelColor=%23041B26&color=%23041B26&link=LICENSE)](https://github.com/block-foundation/solidity-digital-twin/blob/main/LICENSE)
[![devContainer](https://img.shields.io/badge/Container-Remote?style=flat-square&logo=visualstudiocode&logoColor=%23FFFFFF&label=Remote&labelColor=%23041B26&color=%23041B26)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/block-foundation/solidity-digital-twin)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Digital Twin</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>

---

<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation Brand">

### Contents

- [Introduction](#introduction)
- [Colophon](#colophon)

<br clear="both"/>

---

<div align="right">

[![Report a Bug](https://img.shields.io/badge/Report%20a%20Bug-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-digital-twin/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=bug_report.yml)
[![Request a Feature](https://img.shields.io/badge/Request%20a%20Feature-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-digital-twin/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=feature_request.yml)
[![Ask a Question](https://img.shields.io/badge/Ask%20a%20Question-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-digital-twin/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=question.yml)
[![Make a Suggestion](https://img.shields.io/badge/Make%20a%20Suggestion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-digital-twin/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=suggestion.yml)
[![Start a Discussion](https://img.shields.io/badge/Start%20a%20Discussion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-digital-twin/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=discussion.yml)

</div>

## Introduction

This Building Digital Twin Smart Contract is a sophisticated piece of software, written in Solidity for the Ethereum blockchain, that creates a digital representation of a physical building. The digital twin concept is an important aspect of modern construction and building management as it allows for real-time monitoring, predictive maintenance, and simulations of different scenarios.

This smart contract utilizes Chainlink, a decentralized oracle network, to securely retrieve and write real-world data onto the blockchain. The parameters fetched include environmental aspects such as temperature and humidity, occupancy levels, energy and water consumption levels, and air quality data. It also considers the structural health of the building, providing a comprehensive digital overview of the physical building's state.

Moreover, the contract allows the owner to log maintenance reports, thereby enabling an integrated overview of not just the physical parameters but also the maintenance and repair history.

With the use of modifiers, this contract ensures that only the owner of the contract can update the parameters and add maintenance reports, providing a robust access control mechanism.

This contract is an example of the versatility and potential of Ethereum smart contracts, and how they can interface with real-world data via oracles. By using this, building owners, management, and residents could have a clearer picture of the building's condition, maintenance needs, and usage patterns in real-time.

However, as with any smart contract, it's important to remember that deploying and interacting with this contract involves the use of real digital assets (Ether and LINK tokens in this case). So it is crucial to ensure thorough testing and auditing before deploying onto the Ethereum mainnet.

## Quick Start

> Install

``` sh
npm i
```

> Compile

``` sh
npm run compile
```

## Contract


## Development Resources

### Other Repositories

#### Block Foundation Smart Contract Series

|                                   | `Solidity`  | `Teal`      |
| --------------------------------- | ----------- | ----------- |
| **Template**                      | [**>>>**](https://github.com/block-foundation/solidity-template) | [**>>>**](https://github.com/block-foundation/teal-template) |
| **Architectural Design**          | [**>>>**](https://github.com/block-foundation/solidity-architectural-design) | [**>>>**](https://github.com/block-foundation/teal-architectural-design) |
| **Architecture Competition**      | [**>>>**](https://github.com/block-foundation/solidity-architecture-competition) | [**>>>**](https://github.com/block-foundation/teal-architecture-competition) |
| **Housing Cooporative**           | [**>>>**](https://github.com/block-foundation/solidity-housing-cooperative) | [**>>>**](https://github.com/block-foundation/teal-housing-cooperative) |
| **Land Registry**                 | [**>>>**](https://github.com/block-foundation/solidity-land-registry) | [**>>>**](https://github.com/block-foundation/teal-land-registry) |
| **Real-Estate Crowdfunding**      | [**>>>**](https://github.com/block-foundation/solidity-real-estate-crowdfunding) | [**>>>**](https://github.com/block-foundation/teal-real-estate-crowdfunding) |
| **Rent-to-Own**                   | [**>>>**](https://github.com/block-foundation/solidity-rent-to-own) | [**>>>**](https://github.com/block-foundation/teal-rent-to-own) |
| **Self-Owning Building**          | [**>>>**](https://github.com/block-foundation/solidity-self-owning-building) | [**>>>**](https://github.com/block-foundation/teal-self-owning-building) |
| **Smart Home**                    | [**>>>**](https://github.com/block-foundation/solidity-smart-home) | [**>>>**](https://github.com/block-foundation/teal-smart-home) |


---

## Colophon

### Authors

This is an open-source project by the **[Block Foundation](https://www.blockfoundation.io "Block Foundation website")**.

The Block Foundation mission is enabling architects to take back initiative and contribute in solving the mismatch in housing through blockchain technology. Therefore the Block Foundation seeks to unschackle the traditional constraints and construct middle ground between rent and the rigidity of traditional mortgages.

website: [www.blockfoundation.io](https://www.blockfoundation.io "Block Foundation website")

### Development Resources

#### Contributing

We'd love for you to contribute and to make this project even better than it is today!
Please refer to the [contribution guidelines](.github/CONTRIBUTING.md) for information.

### Legal Information

#### Copyright

Copyright &copy; 2023 [Stichting Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

#### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/src/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/src/LICENSE-CODE).

#### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
