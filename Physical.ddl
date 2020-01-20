-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-01-20 20:46:07 CET
--   site:      Oracle Database 12cR2
--   type:      Oracle Database 12cR2



CREATE TABLE airlock (
    id                              VARCHAR2(6) NOT NULL,
    status                          VARCHAR2(30) NOT NULL,
    "Avg_(de)pressurization_time"   DATE,
    platform_name                   VARCHAR2(63) NOT NULL,
    station_id                      INTEGER NOT NULL,
    maintenance_date                DATE NOT NULL
)
LOGGING;

ALTER TABLE airlock ADD CONSTRAINT airlock_pk PRIMARY KEY ( id );

CREATE TABLE battery (
    id                 VARCHAR2(10) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    charge             FLOAT(4),
    capacity           FLOAT(6) NOT NULL,
    capacity_unit      VARCHAR2(10) NOT NULL,
    maintenance_date   DATE NOT NULL,
    energy_grid_id     VARCHAR2(10),
    serial_number      VARCHAR2(50) NOT NULL,
    producent_id       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE battery ADD CONSTRAINT battery_pk PRIMARY KEY ( id );

CREATE TABLE damper (
    id                 VARCHAR2(6) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    maintenance_date   DATE NOT NULL,
    serial_number      VARCHAR2(50) NOT NULL,
    producent_id       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE damper ADD CONSTRAINT damper_pk PRIMARY KEY ( id );

CREATE TABLE element_data (
    serial_number   VARCHAR2(50) NOT NULL,
    producent_id    VARCHAR2(50) NOT NULL,
    model_name      VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE element_data ADD CONSTRAINT producent_serial_number_pk PRIMARY KEY ( serial_number,
                                                                                 producent_id );

CREATE TABLE energy_grid (
    "EG-ID" VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE energy_grid ADD CONSTRAINT energy_grid_pk PRIMARY KEY ( "EG-ID" );

CREATE TABLE linear_electric_motor (
    id                 VARCHAR2(10) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    energy_grid_id     VARCHAR2(10),
    maintenance_date   DATE NOT NULL,
    serial_number      VARCHAR2(50) NOT NULL,
    producent_id       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE linear_electric_motor ADD CONSTRAINT linear_electric_motor_pk PRIMARY KEY ( id );

CREATE TABLE logs (
    "E-ID"    VARCHAR2(31) NOT NULL,
    id_type   INTEGER NOT NULL,
    "Date"    DATE NOT NULL,
    data      VARCHAR2(2047) NOT NULL
)
LOGGING;

ALTER TABLE logs ADD CONSTRAINT logs_pk PRIMARY KEY ( "E-ID" );

CREATE TABLE measurment_unit (
    unit VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE measurment_unit ADD CONSTRAINT measurment_unit_pk PRIMARY KEY ( unit );

CREATE TABLE platform (
    platform_name   VARCHAR2(63) NOT NULL,
    status          VARCHAR2(30) NOT NULL,
    station_id      INTEGER NOT NULL
)
LOGGING;

ALTER TABLE platform ADD CONSTRAINT platform_pk PRIMARY KEY ( platform_name,
                                                              station_id );

CREATE TABLE producent_data (
    id             VARCHAR2(50) NOT NULL,
    name           VARCHAR2(50) NOT NULL,
    country        VARCHAR2(50) NOT NULL,
    localization   VARCHAR2(50) NOT NULL,
    "Index"        VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE producent_data ADD CONSTRAINT producent_data_pk PRIMARY KEY ( id );

CREATE TABLE pylon (
    id                 INTEGER NOT NULL,
    length             FLOAT(4) NOT NULL,
    length_unit        VARCHAR2(10) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    maintenance_date   DATE NOT NULL,
    tube_segment_id    VARCHAR2(10) NOT NULL,
    damper_id          VARCHAR2(6 CHAR) NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX pylon__idx ON
    pylon (
        damper_id
    ASC )
        LOGGING;

ALTER TABLE pylon ADD CONSTRAINT pylon_pk PRIMARY KEY ( id );

CREATE TABLE route_section (
    id                  VARCHAR2(10) NOT NULL,
    status              VARCHAR2(30) NOT NULL,
    expected_duration   DATE NOT NULL,
    length              INTEGER NOT NULL,
    length_unit         VARCHAR2(10) NOT NULL,
    "Start"             INTEGER NOT NULL,
    end                 INTEGER NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX route_section__idx ON
    route_section (
        id
    ASC )
        LOGGING;

ALTER TABLE route_section ADD CONSTRAINT route_pk PRIMARY KEY ( id );

CREATE TABLE solar_panel (
    id                 VARCHAR2(10) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    avg_output         FLOAT(6),
    output_unit        VARCHAR2(10) NOT NULL,
    maintenance_date   DATE NOT NULL,
    serial_number      VARCHAR2(50) NOT NULL,
    producent_id       VARCHAR2(50) NOT NULL,
    tube_segment_id    VARCHAR2(10),
    energy_grid_id     VARCHAR2(10)
)
LOGGING;

ALTER TABLE solar_panel ADD CONSTRAINT solar_panel_pk PRIMARY KEY ( id );

CREATE TABLE station (
    id             INTEGER NOT NULL,
    status         VARCHAR2(30) NOT NULL,
    station_name   VARCHAR2(63) NOT NULL
)
LOGGING;

ALTER TABLE station ADD CONSTRAINT station_pk PRIMARY KEY ( id );

CREATE TABLE status (
    status VARCHAR2(30) NOT NULL
)
LOGGING;

ALTER TABLE status ADD CONSTRAINT status_pk PRIMARY KEY ( status );

CREATE TABLE terrain_type (
    type VARCHAR2(30) NOT NULL
)
LOGGING;

ALTER TABLE terrain_type ADD CONSTRAINT terrain_type_pk PRIMARY KEY ( type );

CREATE TABLE tube_on_route (
    id                VARCHAR2(10) NOT NULL,
    route_id          VARCHAR2(10) NOT NULL,
    tube_segment_id   VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE tube_on_route ADD CONSTRAINT tube_on_route_pk PRIMARY KEY ( route_id,
                                                                        id );

CREATE TABLE tube_segment (
    "TS-ID"                    VARCHAR2(10) NOT NULL,
    status                     VARCHAR2(30) NOT NULL,
    location                   mdsys.sdo_geometry NOT NULL,
    emergency_exit             NUMBER NOT NULL,
    altitude                   NUMBER,
    altitude_unit              VARCHAR2(10) NOT NULL,
    chainage                   NUMBER,
    chainage_unit              VARCHAR2(10) NOT NULL,
    linear_electric_motor_id   VARCHAR2(10),
    avg_pressure               FLOAT(6),
    serial_number              VARCHAR2(50) NOT NULL,
    producent_id               VARCHAR2(50) NOT NULL,
    tube_type                  VARCHAR2(30) NOT NULL,
    terrain_type               VARCHAR2(30) NOT NULL
)
LOGGING;

ALTER TABLE tube_segment ADD CONSTRAINT tube_segment_pk PRIMARY KEY ( "TS-ID" );

CREATE TABLE tube_type (
    type VARCHAR2(30) NOT NULL
)
LOGGING;

ALTER TABLE tube_type ADD CONSTRAINT tube_type_pk PRIMARY KEY ( type );

CREATE TABLE vacuum_pump (
    id                 VARCHAR2(10) NOT NULL,
    status             VARCHAR2(30) NOT NULL,
    power              FLOAT(6),
    power_unit         VARCHAR2(10) NOT NULL,
    target_pressure    FLOAT(6),
    pressure_unit      VARCHAR2(10) NOT NULL,
    tube_segment_id    VARCHAR2(10),
    maintenance_date   DATE NOT NULL,
    serial_number      VARCHAR2(50) NOT NULL,
    producent_id       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE vacuum_pump ADD CONSTRAINT vacuum_pump_pk PRIMARY KEY ( id );

ALTER TABLE airlock
    ADD CONSTRAINT airlock_platform_fk FOREIGN KEY ( platform_name,
                                                     station_id )
        REFERENCES platform ( platform_name,
                              station_id )
    NOT DEFERRABLE;

ALTER TABLE airlock
    ADD CONSTRAINT airlock_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT altitude_unit FOREIGN KEY ( altitude_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE battery
    ADD CONSTRAINT battery_element_data_fk FOREIGN KEY ( serial_number,
                                                         producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE battery
    ADD CONSTRAINT battery_energy_grid_fk FOREIGN KEY ( energy_grid_id )
        REFERENCES energy_grid ( "EG-ID" )
    NOT DEFERRABLE;

ALTER TABLE battery
    ADD CONSTRAINT battery_measurment_unit_fk FOREIGN KEY ( capacity_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT chainage_unit FOREIGN KEY ( chainage_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE damper
    ADD CONSTRAINT damper_element_data_fk FOREIGN KEY ( serial_number,
                                                        producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE damper
    ADD CONSTRAINT damper_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE route_section
    ADD CONSTRAINT end FOREIGN KEY ( end )
        REFERENCES station ( id )
    NOT DEFERRABLE;

ALTER TABLE linear_electric_motor
    ADD CONSTRAINT motor_element_data_fk FOREIGN KEY ( serial_number,
                                                       producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE linear_electric_motor
    ADD CONSTRAINT motor_energy_grid_fk FOREIGN KEY ( energy_grid_id )
        REFERENCES energy_grid ( "EG-ID" )
    NOT DEFERRABLE;

ALTER TABLE linear_electric_motor
    ADD CONSTRAINT motor_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE platform
    ADD CONSTRAINT platform_station_fk FOREIGN KEY ( station_id )
        REFERENCES station ( id )
    NOT DEFERRABLE;

ALTER TABLE platform
    ADD CONSTRAINT platform_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE vacuum_pump
    ADD CONSTRAINT power_unit FOREIGN KEY ( power_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE vacuum_pump
    ADD CONSTRAINT pressure_unit FOREIGN KEY ( pressure_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE element_data
    ADD CONSTRAINT producent_id_serial_number_fk FOREIGN KEY ( producent_id )
        REFERENCES producent_data ( id )
    NOT DEFERRABLE;

ALTER TABLE pylon
    ADD CONSTRAINT pylon_damper_fk FOREIGN KEY ( damper_id )
        REFERENCES damper ( id )
    NOT DEFERRABLE;

ALTER TABLE pylon
    ADD CONSTRAINT pylon_measurment_unit_fk FOREIGN KEY ( length_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE pylon
    ADD CONSTRAINT pylon_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE pylon
    ADD CONSTRAINT pylon_tube_segment_fk FOREIGN KEY ( tube_segment_id )
        REFERENCES tube_segment ( "TS-ID" )
    NOT DEFERRABLE;

ALTER TABLE route_section
    ADD CONSTRAINT route_measurment_unit_fk FOREIGN KEY ( length_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE route_section
    ADD CONSTRAINT route_section_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE solar_panel
    ADD CONSTRAINT solar_panel_element_data_fk FOREIGN KEY ( serial_number,
                                                             producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE solar_panel
    ADD CONSTRAINT solar_panel_energy_grid_fk FOREIGN KEY ( energy_grid_id )
        REFERENCES energy_grid ( "EG-ID" )
    NOT DEFERRABLE;

ALTER TABLE solar_panel
    ADD CONSTRAINT solar_panel_measurment_unit_fk FOREIGN KEY ( output_unit )
        REFERENCES measurment_unit ( unit )
    NOT DEFERRABLE;

ALTER TABLE solar_panel
    ADD CONSTRAINT solar_panel_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE solar_panel
    ADD CONSTRAINT solar_panel_tube_segment_fk FOREIGN KEY ( tube_segment_id )
        REFERENCES tube_segment ( "TS-ID" )
    NOT DEFERRABLE;

ALTER TABLE route_section
    ADD CONSTRAINT "Start" FOREIGN KEY ( "Start" )
        REFERENCES station ( id )
    NOT DEFERRABLE;

ALTER TABLE station
    ADD CONSTRAINT station_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE battery
    ADD CONSTRAINT status FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE tube_on_route
    ADD CONSTRAINT tube_on_route_route_fk FOREIGN KEY ( route_id )
        REFERENCES route_section ( id )
    NOT DEFERRABLE;

ALTER TABLE tube_on_route
    ADD CONSTRAINT tube_on_route_tube_segment_fk FOREIGN KEY ( tube_segment_id )
        REFERENCES tube_segment ( "TS-ID" )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT tube_segment_element_data_fk FOREIGN KEY ( serial_number,
                                                              producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT tube_segment_motor_fk FOREIGN KEY ( linear_electric_motor_id )
        REFERENCES linear_electric_motor ( id )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT tube_segment_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT tube_segment_terrain_type_fk FOREIGN KEY ( terrain_type )
        REFERENCES terrain_type ( type )
    NOT DEFERRABLE;

ALTER TABLE tube_segment
    ADD CONSTRAINT tube_segment_tube_type_fk FOREIGN KEY ( tube_type )
        REFERENCES tube_type ( type )
    NOT DEFERRABLE;

ALTER TABLE vacuum_pump
    ADD CONSTRAINT vacuum_pump_element_data_fk FOREIGN KEY ( serial_number,
                                                             producent_id )
        REFERENCES element_data ( serial_number,
                                  producent_id )
    NOT DEFERRABLE;

ALTER TABLE vacuum_pump
    ADD CONSTRAINT vacuum_pump_status_fk FOREIGN KEY ( status )
        REFERENCES status ( status )
    NOT DEFERRABLE;

ALTER TABLE vacuum_pump
    ADD CONSTRAINT vacuum_pump_tube_segment_fk FOREIGN KEY ( tube_segment_id )
        REFERENCES tube_segment ( "TS-ID" )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             2
-- ALTER TABLE                             62
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
