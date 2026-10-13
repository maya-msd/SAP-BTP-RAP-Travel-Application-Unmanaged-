# SAP-BTP-RAP-Travel-Application-Unmanaged Scenario
This is an Restful Application(unmanaged Scenario) build on SAP BPT, for a Travel Agency
# SAP BTP RAP: Travel Application (Unmanaged Scenario)

End-to-end implementation of the SAP RESTful Application Programming Model (RAP) unmanaged scenario built on SAP BTP and modern ABAP Cloud using Eclipse ADT.

## Architecture & Implementation Flow

### 1. Core Data Services (CDS) Layer
* **`zbtp_i_u_customer`**: Interfaces customer master data (`/dmo/customer`) with an association to standard clean-core view `I_Country`.
* **`zbtp_i_u_Agency`**: Interfaces agency master data (`/dmo/agency`) with an association to `I_Country`.
* **`zbtp_i_u_Travel` (Root View Entity)**: Defines the Business Object (BO) root view over `/dmo/travel`, establishing target associations to `_Agency`, `_Customer`, and standard `I_Currency`.

### 2. Business Object Behavior Definition (`zbtp_i_u_travel.asbdef`)
* Configured as an **unmanaged** scenario (`unmanaged implementation in class zbtp_i_u_travel unique`).
* Enables lifecycle transactional operations: `create (authorization: global)`, `update`, and `delete`.
* Protects key field integrity using `field (readonly) TravelId`.

### 3. Service Definition (`ZBTP_I_U_TRAVEL_SD`)
* Exposes the complete domain model: root view `zbtp_i_u_Travel`, master entities `zbtp_i_u_Agency` and `zbtp_i_u_customer`, alongside standard value-help views `I_Country` and `I_Currency`.

### 4. Service Binding (`ZBTP_I_U_TRAVEL_SB`)
* **Binding Type**: `OData V2 - UI` (configured for SAP BTP trial environment and SAP Fiori Elements UI).
* Published service endpoints generate active entity sets and associations supporting real-time Fiori Elements List Report preview with Create, Edit, and Delete actions.

## Technologies Used
* SAP RESTful Application Programming Model (RAP)
* ABAP Cloud & Core Data Services (CDS Views with Associations)
* Standard Clean-Core Released Views (`I_Country`, `I_Currency`)
* OData V2 UI Service Binding
* SAP BTP Trial & Eclipse ADT
