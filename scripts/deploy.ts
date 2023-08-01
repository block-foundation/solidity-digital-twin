// SPDX-License-Identifier: Apache-2.0


// Copyright 2023 Stichting Block Foundation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


// Import the necessary modules
import { ethers } from "hardhat";


// The main function will deploy your contract
async function main() {
  // ethers.getSigners() provides a list of Signer objects, which represent an Ethereum account
  // We're picking the first one as the deployer account
  const [deployer] = await ethers.getSigners();

  // Logging the deployer's address
  console.log("Deploying the contracts with the account:", deployer.address);

  // Logging the deployer's balance
  console.log("Account balance:", (await deployer.getBalance()).toString());

  // ethers.getContractFactory creates a new instance of ContractFactory. 
  // ContractFactory is a class to create Contract instances, which is used to deploy new smart contracts.
  const BuildingDigitalTwin = await ethers.getContractFactory("BuildingDigitalTwin");

  // Initializing oracle and jobIds with dummy data. 
  // These values should be replaced with actual values for real-world deployment.
  const oracle = ethers.constants.AddressZero;
  const temperatureJobId = ethers.utils.formatBytes32String('');
  const humidityJobId = ethers.utils.formatBytes32String('');
  const occupancyJobId = ethers.utils.formatBytes32String('');
  const energyJobId = ethers.utils.formatBytes32String('');
  const structuralJobId = ethers.utils.formatBytes32String('');
  const waterJobId = ethers.utils.formatBytes32String('');
  const airQualityJobId = ethers.utils.formatBytes32String('');

  // Deploy the contract using the .deploy() function on the contract factory, passing in necessary constructor arguments.
  // Here, we're deploying with the oracle and jobId parameters, as well as a fee of 1 LINK.
  const digitalTwin = await BuildingDigitalTwin.deploy(
    oracle,
    temperatureJobId,
    humidityJobId,
    occupancyJobId,
    energyJobId,
    structuralJobId,
    waterJobId,
    airQualityJobId,
    1 // setting fee to 1 Link
  );

  // Log the address of the deployed contract
  console.log("BuildingDigitalTwin contract address:", digitalTwin.address);
}

// Run the function, and handle any errors
main()
  .then(() => process.exit(0))  // If the function succeeds, we'll exit the Node.js script with a status code of 0
  .catch((error) => {
    console.error(error);  // If an error is caught, log the error and exit with a status code of 1
    process.exit(1);
  });
