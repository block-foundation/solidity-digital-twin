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


// Importing necessary modules and types
import { expect } from 'chai';
import { ethers } from 'hardhat';
import { DigitalTwin } from '../types/ethers-contracts/DigitalTwin';


// Describe function is used to group related tests
describe('DigitalTwin', () => {
  // The contract instance that will be tested
  let digitalTwin: DigitalTwin;

  // This function runs before each test, initializing the contract instance
  beforeEach(async () => {
    // Get the ContractFactory and Signers
    const [owner] = await ethers.getSigners();

    // Create a new instance of the DigitalTwin contract
    const DigitalTwinFactory = await ethers.getContractFactory('DigitalTwin');
    
    // Initializing oracle and jobIds with dummy data
    const oracle = ethers.constants.AddressZero;
    const temperatureJobId = ethers.utils.formatBytes32String('');
    const humidityJobId = ethers.utils.formatBytes32String('');
    const occupancyJobId = ethers.utils.formatBytes32String('');
    const energyJobId = ethers.utils.formatBytes32String('');
    const structuralJobId = ethers.utils.formatBytes32String('');
    const waterJobId = ethers.utils.formatBytes32String('');
    const airQualityJobId = ethers.utils.formatBytes32String('');

    // Deploy the contract and wait for it to be mined
    digitalTwin = (await DigitalTwinFactory.deploy(
      oracle,
      temperatureJobId,
      humidityJobId,
      occupancyJobId,
      energyJobId,
      structuralJobId,
      waterJobId,
      airQualityJobId,
      1 // setting fee to 1 Link
    )) as DigitalTwin;

    await digitalTwin.deployed();
  });

  // Test case: Should add maintenance report and emit event
  it('Should add maintenance report and emit event', async () => {
    const [owner] = await ethers.getSigners();
    
    const reportDescription = 'Elevator maintenance';
    
    // Execute the addMaintenanceReport function and check if the correct event was emitted
    await expect(digitalTwin.connect(owner).addMaintenanceReport(reportDescription))
      .to.emit(digitalTwin, 'MaintenanceReportAdded')
      .withArgs(reportDescription, await ethers.provider.getBlockNumber());
  });

  // Test case: Should retrieve correct maintenance report count
  it('Should retrieve correct maintenance report count', async () => {
    const [owner] = await ethers.getSigners();

    const reportDescription1 = 'Elevator maintenance';
    const reportDescription2 = 'AC service';

    // Add two maintenance reports and check if the count matches
    await digitalTwin.connect(owner).addMaintenanceReport(reportDescription1);
    await digitalTwin.connect(owner).addMaintenanceReport(reportDescription2);

    expect(await digitalTwin.getMaintenanceReportsCount()).to.equal(2);
  });

  // Test case: Should update fee
  it('Should update fee', async () => {
    const [owner] = await ethers.getSigners();
    const newFee = 2;
    
    // Update the fee and check if it was updated correctly
    await digitalTwin.connect(owner).setFee(newFee);
    expect(await digitalTwin.fee()).to.equal(newFee);
  });

  // Test case: Should reject non-owners trying to add maintenance report
  it('Should reject non-owners trying to add maintenance report', async () => {
    const [_, nonOwner] = await ethers.getSigners();

    const reportDescription = 'Elevator maintenance';
    
    // Attempt to add a maintenance report as a non-owner and expect it to fail
    await expect(digitalTwin.connect(nonOwner).addMaintenanceReport(reportDescription)).to.be.revertedWith('Only the contract owner may perform this action');
  });

  // Test case: Should reject non-owners trying to set fee
  it('Should reject non-owners trying to set fee', async () => {
    const [_, nonOwner] = await ethers.getSigners();
    const newFee = 2;

    // Attempt to update the fee as a non-owner and expect it to fail
    await expect(digitalTwin.connect(nonOwner).setFee(newFee)).to.be.revertedWith('Only the contract owner may perform this action');
  });

  // Test case: Should set owner on initialization
  it('Should set owner on initialization', async () => {
    const [owner] = await ethers.getSigners();

    // Check if the contract correctly set the owner upon initialization
    expect(await digitalTwin.owner()).to.equal(owner.address);
  });

  // Test case: Should allow owner to transfer ownership
  it('Should allow owner to transfer ownership', async () => {
    const [owner, newOwner] = await ethers.getSigners();

    // Transfer ownership and check if it was transferred correctly
    await digitalTwin.connect(owner).transferOwnership(newOwner.address);
    expect(await digitalTwin.owner()).to.equal(newOwner.address);
  });

  // Test case: Should reject non-owners trying to transfer ownership
  it('Should reject non-owners trying to transfer ownership', async () => {
    const [_, nonOwner, thirdParty] = await ethers.getSigners();

    // Attempt to transfer ownership as a non-owner and expect it to fail
    await expect(digitalTwin.connect(nonOwner).transferOwnership(thirdParty.address)).to.be.revertedWith('Only the contract owner may perform this action');
  });

  // Test case: Should not allow to set zero address as oracle
  it('Should not allow to set zero address as oracle', async () => {
    const [owner] = await ethers.getSigners();
    const zeroAddress = ethers.constants.AddressZero;

    // Attempt to set the oracle address to the zero address and expect it to fail
    await expect(digitalTwin.connect(owner).setOracle(zeroAddress)).to.be.revertedWith('Oracle address cannot be zero');
  });
});
