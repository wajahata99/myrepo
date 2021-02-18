delete from dwh.kpi_definition_parameters;
delete from dwh.kpi_definition_time_range;
delete from dwh.kpi_instance_parameters;
delete from dwh.kpi_instance_time_range;
delete from dwh.kpi_instance_resource_reference;
delete from dwh.kpi_instance;
delete from dwh.kpi_definition;

-------------------
delete from 

--Effectiveness json updates
set search_path to dwh;

delete from second_fact where kpi_id = 14;

select date_id,time_id, value_mean from second_fact
where kpi_id = 14
and date_id = '2020-09-01'
and process_segment_id = 200;

select avg(value_mean) from second_fact
where kpi_id = 14;

UPDATE kpi_instance_parameters
SET kpi_input = '{
    "sourceFields": [
        {
            "factRecords": null,
            "sourceField": "unutilized_state",
            "dimensionRecords": [
                {
                    "record": "process segment",
                    "dimensionTable": "dim_process_segment",
                    "lookupParameters": [
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_name"
                        },
                        {
                            "value": [
                                "soap_line2"
                            ],
                            "condition": "in",
                            "parameter": "process_segment_code"
                        },

                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "material_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "equipment_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "personnel_segment_specification_code"
                        }
                    ]
                },
                {
                    "record": "event",
                    "dimensionTable": "dim_event",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "event_concept"
                        },
                        {
                            "value": [
                                "operational_state_event"
                            ],
                            "condition": "in",
                            "parameter": "event_category"
                        }
                    ]
                },
                {
                    "record": "states",
                    "dimensionTable": "dim_state",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "state_concept"
                        },
                        {
                            "value": [
                                "unscheduled"
                            ],
                            "condition": "in",
                            "parameter": "state_code"
                        }
                    ]
                }
            ]
        },
        {
            "factRecords": null,
            "sourceField": "breakdown_excluding_minor_time_state",
            "dimensionRecords": [
                {
                    "record": "process segment",
                    "dimensionTable": "dim_process_segment",
                    "lookupParameters": [
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_name"
                        },
                        {
                            "value": [
                                "soap_line2"
                            ],
                            "condition": "in",
                            "parameter": "process_segment_code"
                        },

                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "material_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "equipment_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "personnel_segment_specification_code"
                        }
                    ]
                },
                {
                    "record": "event",
                    "dimensionTable": "dim_event",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "event_concept"
                        },
                        {
                            "value": [
                                "operational_state_event"
                            ],
                            "condition": "in",
                            "parameter": "event_category"
                        }
                    ]
                },
                {
                    "record": "states",
                    "dimensionTable": "dim_state",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "state_concept"
                        },
                        {
                            "value": [
                                "breakdown"
                            ],
                            "condition": "in",
                            "parameter": "state_code"
                        }
                    ]
                },
                {
                    "record": "reason",
                    "dimensionTable": "dim_reason",
                    "lookupParameters": [
                        {
                            "value": [
                                "minor_stoppage_idling"
                            ],
                            "condition": "not in",
                            "parameter": "reason_subcategory_code"
                        }
                    ]
                }
            ]
        },
        {
            "factRecords": [
                {
                    "measure": "sum",
                    "factTable": "second_fact",
                    "factColumn": "value_mean",
                    "parameters": [
                        "operation_response_id"
                    ]
                }
            ],
            "sourceField": "good_quantity_produced",
            "dimensionRecords": [
                {
                    "record": "process segment",
                    "dimensionTable": "dim_process_segment",
                    "lookupParameters": [
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_name"
                        },
                        {
                            "value": [
                                "soap_line2"
                            ],
                            "condition": "in",
                            "parameter": "process_segment_code"
                        },

                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "material_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "equipment_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "personnel_segment_specification_code"
                        }
                    ]
                },
                {
                    "record": "event",
                    "dimensionTable": "dim_event",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "event_concept"
                        },
                        {
                            "value": [
                                "produced_quantity"
                            ],
                            "condition": "in",
                            "parameter": "event_category"
                        }
                    ]
                },
                {
                    "record": "property",
                    "dimensionTable": "dim_property",
                    "lookupParameters": [
                        {
                            "value": [
                                "event"
                            ],
                            "condition": "in",
                            "parameter": "property_concept"
                        },
                        {
                            "value": [
                                "pq"
                            ],
                            "condition": "in",
                            "parameter": "property_code"
                        }
                    ]
                }
            ]
        },
        {
            "factRecords": [
                {
                    "measure": null,
                    "factTable": "second_fact",
                    "factColumn": "value_mean",
                    "parameters": [
                        "operation_response_id"
                    ]
                }
            ],
            "sourceField": "nominal_speed",
            "dimensionRecords": [
                {
                    "record": "process segment",
                    "dimensionTable": "dim_process_segment",
                    "lookupParameters": [
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_name"
                        },
                        {
                            "value": [
                                "soap_line2"
                            ],
                            "condition": "in",
                            "parameter": "process_segment_code"
                        },

                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "material_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "equipment_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "personnel_segment_specification_code"
                        }
                    ]
                },
                {
                    "record": "property",
                    "dimensionTable": "dim_property",
                    "lookupParameters": [
                        {
                            "value": [
                                "segment_response"
                            ],
                            "condition": "in",
                            "parameter": "property_concept"
                        },
                        {
                            "value": [
                                "nominal_speed"
                            ],
                            "condition": "in",
                            "parameter": "property_code"
                        }
                    ]
                }
            ]
        }
    ]
}'
WHERE kpi_instance = 15;

---------------------------------------------
UPDATE kpi_instance_parameters
SET kpi_output = '{
    "sourceFields": [
        {
            "factRecords": [
                {
                    "factTable": "second_fact",
                    "factColumn": "value_mean"
                }
            ],
            "sourceField": "performance",
            "dimensionRecords": [
                {
                    "dimensionTable": "dim_process_segment",
                    "lookupParameters": [
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "stream_name"
                        },
                        {
                            "value": [
                                "soap_line2"
                            ],
                            "condition": "in",
                            "parameter": "process_segment_code"
                        },
                        {
                            "value": [
                                "production"
                            ],
                            "condition": "in",
                            "parameter": "operations_type"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "material_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "equipment_segment_specification_code"
                        },
                        {
                            "value": null,
                            "condition": "is",
                            "parameter": "personnel_segment_specification_code"
                        }
                    ]
                },
                {
                    "dimensionTable": "dim_kpi",
                    "lookupParameters": [
                        {
                            "value": [
                                "process_segment"
                            ],
                            "condition": "in",
                            "parameter": "kpi_concept"
                        },
                        {
                            "value": [
                                "performance"
                            ],
                            "condition": "in",
                            "parameter": "kpi_type_code"
                        }
                    ]
                }
            ]
        }
    ]
}'
WHERE kpi_instance = 15;

---------------------------------------------
---
UPDATE kpi_instance_time_range
SET start_time = '2020-09-01 00:00:01',
end_time = null,
last_execution_time = '2020-09-01 00:00:01',
recurrence = '00:15:00'

where kpi_instance = 15;

-------------
UPDATE kpi_instance_resource_reference
SET resource_code = 'soap_line2'
where kpi_instance = 15;