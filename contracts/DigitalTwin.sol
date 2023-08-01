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


import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";


// ============================================================================
// Contracts
// ============================================================================

/// @title DigitalTwin
/// @notice This contract is used for creating a digital twin of a building with specific characteristics.
/// @dev This contract inherits ChainlinkClient to make oracle requests
contract DigitalTwin is ChainlinkClient {

    // Parameters
    // ========================================================================

    /// @notice Holds the current temperature of the building
    /// @dev This value is updated by an oracle
    uint256 public temperature;

    /// @notice Holds the current humidity of the building
    /// @dev This value is updated by an oracle
    uint256 public humidity;

    /// @notice Holds the current occupancy of the building
    /// @dev This value is updated by an oracle
    uint256 public occupancy;

    /// @notice Holds the current energy consumption of the building
    /// @dev This value is updated by an oracle
    uint256 public energyConsumption;

    /// @notice Holds the current structural health of the building
    /// @dev This value is updated by an oracle
    uint256 public structuralHealth;

    /// @notice Holds the current water consumption of the building
    /// @dev This value is updated by an oracle
    uint256 public waterConsumption;

    /// @notice Holds the current air quality of the building
    /// @dev This value is updated by an oracle
    uint256 public airQuality;

    /// @notice An array containing all the maintenance reports for the building
    /// @dev This array grows over time as new reports are added
    MaintenanceReport[] public maintenanceReports;

    /// @dev The address of the owner of the contract
    address private owner;


    // Chainlink specifics
    // ------------------------------------------------------------------------

    /// @dev The address of the oracle used to fetch data
    address private oracle;

    /// @dev The jobId of the Chainlink oracle for temperature
    bytes32 private temperatureJobId;

    /// @dev The jobId of the Chainlink oracle for humidity
    bytes32 private humidityJobId;

    /// @dev The jobId of the Chainlink oracle for occupancy
    bytes32 private occupancyJobId;

    /// @dev The jobId of the Chainlink oracle for energy consumption
    bytes32 private energyJobId;

    /// @dev The jobId of the Chainlink oracle for structural health
    bytes32 private structuralJobId;

    /// @dev The jobId of the Chainlink oracle for water consumption
    bytes32 private waterJobId;

    /// @dev The jobId of the Chainlink oracle for air quality
    bytes32 private airQualityJobId;

    /// @dev The fee for oracle requests
    uint256 private fee;


    // Error messages
    // ------------------------------------------------------------------------

    string private constant ONLY_OWNER = "Only the contract owner may perform this action";


    // Structs
    // ========================================================================

    /// @notice Represents a maintenance report for the building
    /// @dev Each report has a description and a timestamp
    struct MaintenanceReport {
        string description; // Description of the maintenance event
        uint256 timestamp;  // Time when the maintenance event occurred
    }


    // Constructor
    // ========================================================================

    /// @notice Constructs a new DigitalTwin contract
    /// @param _oracle The address of the oracle
    /// @param _temperatureJobId The jobId of the Chainlink oracle for temperature
    /// @param _humidityJobId The jobId of the Chainlink oracle for humidity
    /// @param _occupancyJobId The jobId of the Chainlink oracle for occupancy
    /// @param _energyJobId The jobId of the Chainlink oracle for energy consumption
    /// @param _structuralJobId The jobId of the Chainlink oracle for structural health
    /// @param _waterJobId The jobId of the Chainlink oracle for water consumption
    /// @param _airQualityJobId The jobId of the Chainlink oracle for air quality
    /// @param _fee The fee for oracle requests
    /// @dev Constructor sets the chainlink token, oracle and jobIds, fee, and owner
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


    // Events
    // ========================================================================

    /// @dev This event is emitted when the temperature is updated by the oracle
    event TemperatureUpdated(uint256 temperature);

    /// @dev This event is emitted when the humidity is updated by the oracle
    event HumidityUpdated(uint256 humidity);

    /// @dev This event is emitted when the occupancy is updated by the oracle
    event OccupancyUpdated(uint256 occupancy);

    /// @dev This event is emitted when the energy consumption is updated by the oracle
    event EnergyConsumptionUpdated(uint256 energyConsumption);

    /// @dev This event is emitted when the structural health is updated by the oracle
    event StructuralHealthUpdated(uint256 structuralHealth);

    /// @dev This event is emitted when the water consumption is updated by the oracle
    event WaterConsumptionUpdated(uint256 waterConsumption);

    /// @dev This event is emitted when the air quality is updated by the oracle
    event AirQualityUpdated(uint256 airQuality);

    /// @dev This event is emitted when a new maintenance report is added
    event MaintenanceReportAdded(string description, uint256 timestamp);

    // Modifiers
    // ========================================================================

    /// @dev Throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == owner, ONLY_OWNER);
        _;
    }


    // Methods
    // ========================================================================

    /// @notice Sets the fee for oracle requests
    /// @param _fee The new fee
    /// @dev Can only be called by the contract owner
    function setFee(uint256 _fee) external onlyOwner {
        fee = _fee;
    }

    /// @notice Adds a new maintenance report
    /// @param description The description of the maintenance report
    /// @dev Can only be called by the contract owner
    function addMaintenanceReport(string memory description) public onlyOwner {
        maintenanceReports.push(MaintenanceReport(description, block.timestamp));
        emit MaintenanceReportAdded(description, block.timestamp);
    }

    /// @notice Returns the number of maintenance reports
    /// @return The number of maintenance reports
    function getMaintenanceReportsCount() public view returns (uint256) {
        return maintenanceReports.length;
    }

    /// @notice Initiates a request to the oracle to update the temperature
    /// @return The requestId of the Chainlink request
    /// @dev Can only be called by the contract owner
    function updateTemperature() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillTemperature.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    /// @notice Updates the temperature with data from the oracle
    /// @param _requestId The requestId of the Chainlink request
    /// @param _temperature The new temperature
    /// @dev Can only be called by the Chainlink oracle
    function fulfillTemperature(bytes32 _requestId, uint256 _temperature) public recordChainlinkFulfillment(_requestId) {
        temperature = _temperature;
        emit TemperatureUpdated(_temperature);
    }
    /// @notice Initiates a request to the oracle to update the humidity
    /// @return requestId The requestId of the Chainlink request
    /// @dev Can only be called by the contract owner
    function updateHumidity() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillHumidity.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    /// @notice Updates the humidity with data from the oracle
    /// @param _requestId The requestId of the Chainlink request
    /// @param _humidity The new humidity value
    /// @dev Can only be called by the Chainlink oracle
    function fulfillHumidity(bytes32 _requestId, uint256 _humidity) public recordChainlinkFulfillment(_requestId) {
        humidity = _humidity;
        emit HumidityUpdated(_humidity);
    }

    /// @notice Initiates a request to the oracle to update the occupancy
    /// @return requestId The requestId of the Chainlink request
    /// @dev Can only be called by the contract owner
    function updateOccupancy() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillOccupancy.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    /// @notice Updates the occupancy with data from the oracle
    /// @param _requestId The requestId of the Chainlink request
    /// @param _occupancy The new occupancy value
    /// @dev Can only be called by the Chainlink oracle
    function fulfillOccupancy(bytes32 _requestId, uint256 _occupancy) public recordChainlinkFulfillment(_requestId) {
        occupancy = _occupancy;
        emit OccupancyUpdated(_occupancy);
    }

    /// @notice Initiates a request to the oracle to update the energy consumption
    /// @return requestId The requestId of the Chainlink request
    /// @dev Can only be called by the contract owner
    function updateEnergyConsumption() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillEnergyConsumption.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }

    /// @notice Updates the energy consumption with data from the oracle
    /// @param _requestId The requestId of the Chainlink request
    /// @param _energyConsumption The new energy consumption value
    /// @dev Can only be called by the Chainlink oracle
    function fulfillEnergyConsumption(bytes32 _requestId, uint256 _energyConsumption) public recordChainlinkFulfillment(_requestId) {
        energyConsumption = _energyConsumption;
        emit EnergyConsumptionUpdated(_energyConsumption);
    }

    /**
    * @notice Initiates a request to the oracle to update the structural health
    * @dev Can only be called by the contract owner
    * @return requestId The requestId of the Chainlink request
    */
    function updateStructuralHealth() public onlyOwner returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillStructuralHealth.selector);
        return sendChainlinkRequestTo(oracle, request, fee);
    }


    /// @notice Updates the structural health with data from the oracle
    /// @param _requestId The requestId of the Chainlink request
    /// @param _structuralHealth The new structural health
    /// @dev Can only be called by the Chainlink oracle
    function fulfillStructuralHealth(bytes32 _requestId, uint256 _structuralHealth) public recordChainlinkFulfillment(_requestId) {
        structuralHealth = _structuralHealth;
        emit StructuralHealthUpdated(_structuralHealth);
    }

}
