--Effectiveness json updates
set search_path to dwh;

delete from second_fact where kpi_id = 16;


select date_id,time_id, value_mean from second_fact
where kpi_id = 16;

select * from second_fact
where kpi_id = 16

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
            "sourceField": "availability",
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
                    "record": "kpi",
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
                                "availability"
                            ],
                            "condition": "in",
                            "parameter": "kpi_type_code"
                        }
                    ]
                }
            ]
        },
        {
            "factRecords": null,
            "sourceField": "performance",
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
                    "record": "kpi",
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
WHERE kpi_instance = 17;

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
            "sourceField": "oee",
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
                                "oee"
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
WHERE kpi_instance = 17;

---------------------------------------------
---
UPDATE kpi_instance_time_range
SET start_time = '2020-09-01 00:45:00',
end_time = null,
last_execution_time = '2020-09-01 00:45:00',
recurrence = '00:15:00'

where kpi_instance = 17;

----------------------
UPDATE kpi_instance_resource_reference
SET resource_code = 'soap_line2'
where kpi_instance = 17;