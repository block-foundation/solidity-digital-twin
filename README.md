<div align="right">

  [![license](https://img.shields.io/github/license/block-foundation/solidity-digital-twin?color=green&label=license&style=flat-square)](LICENSE.md)
  ![stars](https://img.shields.io/github/stars/block-foundation/solidity-digital-twin?color=blue&label=stars&style=flat-square)
  ![contributors](https://img.shields.io/github/contributors/block-foundation/solidity-digital-twin?color=blue&label=contributors&style=flat-square)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Decentralized Architectural Competition</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>

---

<div>
<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation">
<br>
<details open="open">
<summary>Table of Contents</summary>
  
- [Introduction](#style-guide)
- [Quick Start](#quick-start)
- [Contract](#contract)
- [Development Resources](#development-resources)
- [Legal Information](#legal-information)
  - [Copyright](#copyright)
  - [License](#license)
  - [Warning](#warning)
  - [Disclaimer](#disclaimer)

</details>
</div>

<br clear="both"/>

---

<div align="right">

  ![Report a Bug](https://img.shields.io/badge/Report%20a%20Bug-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Abug-suspected%26template%3Dbug_report.yml)
  ![Request a Feature](https://img.shields.io/badge/Request%20a%20Feature-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Afeature-request%252CHelp%2Bwanted%2B%25F0%259F%25AA%25A7%26template%3Dfeature_request.yml)
  ![Ask a Question](https://img.shields.io/badge/Ask%20a%20Question-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Aquestion%26template%3Dquestion.yml)
  ![Make a Suggestion](https://img.shields.io/badge/Make%20a%20Suggestion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Aenhancement%26template%3Dsuggestion.yml)
  ![Start a Discussion](https://img.shields.io/badge/Start%20a%20Discussion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fdiscussions)

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

## Legal Information

### Copyright

Copyright &copy; 2023 [Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [MIT License](https://opensource.org/license/mit/).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/LICENSE-CODE).

### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
