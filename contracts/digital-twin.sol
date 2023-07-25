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


pragma solidity ^0.8.19;


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract BuildingDigitalTwin is ChainlinkClient {
    // Variables to hold oracle data
    uint256 public temperature;
    uint256 public humidity;
    uint256 public occupancy;
    uint256 public energyConsumption;
    uint256 public structuralHealth;
    uint256 public waterConsumption;
    uint256 public airQuality;

    // Maintenance reports
    struct MaintenanceReport {
        string description;
        uint256 timestamp;
    }


    
    MaintenanceReport[] public maintenanceReports;

    // Events to log data updates
    event TemperatureUpdated(uint256 temperature);
    event HumidityUpdated(uint256 humidity);
    event OccupancyUpdated(uint256 occupancy);
    event EnergyConsumptionUpdated(uint256 energyConsumption);
    event StructuralHealthUpdated(uint256 structuralHealth);
    event WaterConsumptionUpdated(uint256 waterConsumption);
    event AirQualityUpdated(uint256 airQuality);
    event MaintenanceReportAdded(string description, uint256 timestamp);

    // Chainlink specifics
    address private oracle;
    bytes32 private temperatureJobId;
    bytes32 private humidityJobId;
    bytes32 private occupancyJobId;
    bytes32 private energyJobId;
    bytes32 private structuralJobId;
    bytes32 private waterJobId;
    bytes32 private airQualityJobId;
    uint256 private fee;

    // owner of the contract
    address private owner;


    // Error messages
    string private constant ONLY_OWNER = "Only the contract owner may perform this action";



    constructor(
        address _oracle,
        bytes32 _temperatureJobId,
        bytes32 _humidityJobId,
        bytes32 _occupancyJobId,
        bytes32 _energyJobId,
        bytes32 _structuralJobId,
        bytes32 _waterJobId,
        bytes32 _airQualityJobId,
        uint256 _fee
    ) {
        setChainlinkToken(0xa36085F69e2889c224210F603D836748e7dC0088); // link token on Kovan
        oracle = _oracle;
        temperatureJobId = _temperatureJobId;
        humidityJobId = _humidityJobId;
        occupancyJobId = _occupancyJobId;
        energyJobId = _energyJobId;
        structuralJobId = _structuralJobId;
        waterJobId = _waterJobId;
        airQualityJobId = _airQualityJobId;
        fee = _fee;
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(msg.sender == owner, ONLY_OWNER);
        _;
    }


    function setFee(uint256 _fee) external onlyOwner {
        fee = _fee;
    }

    // Update and fulfill functions for water consumption and air quality are similar to the other parameters.

    function addMaintenanceReport(string memory description) public onlyOwner {
        maintenanceReports.push(MaintenanceReport(description, block.timestamp));
        emit MaintenanceReportAdded(description, block.timestamp);
    }

    function getMaintenanceReportsCount() public view returns (uint256) {
        return maintenanceReports.length;
    }




    function updateTemperature() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillTemperature.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillTemperature(bytes32 _requestId, uint256 _temperature) public recordChainlinkFulfillment(_requestId) {
        temperature = _temperature;
        emit TemperatureUpdated(_temperature);
    }

    function updateHumidity() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillHumidity.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillHumidity(bytes32 _requestId, uint256 _humidity) public recordChainlinkFulfillment(_requestId) {
        humidity = _humidity;
        emit HumidityUpdated(_humidity);
    }

    function updateOccupancy() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillOccupancy.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillOccupancy(bytes32 _requestId, uint256 _occupancy) public recordChainlinkFulfillment(_requestId) {
        occupancy = _occupancy;
        emit OccupancyUpdated(_occupancy);
    }

    function updateEnergyConsumption() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillEnergyConsumption.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillEnergyConsumption(bytes32 _requestId, uint256 _energyConsumption) public recordChainlinkFulfillment(_requestId) {
        energyConsumption = _energyConsumption;
        emit EnergyConsumptionUpdated(_energyConsumption);
    }

    function updateStructuralHealth() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillStructuralHealth.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfillStructuralHealth(bytes32 _requestId, uint256 _structuralHealth) public recordChainlinkFulfillment(_requestId) {
        structuralHealth = _structuralHealth;
        emit StructuralHealthUpdated(_structuralHealth);
    }
}



