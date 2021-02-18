import requests
import json
from helper import json_template_loader, ps_json_updater, nested_eq_json_updater, def_ps_json_updater, def_eq_json_updater

class cruds:
    def __init__(self, dimension_table,name, start_range, end_range, crud_name):
        self.name = name
        self.start_range = start_range
        self.end_range = end_range
        self.operation = crud_name
        self.resource_context_dict = {'dim_process_segment': 'process_segment_code', 'dim_equipment': 'equipment_code'}
        self.dimension_table = dimension_table

        self.input_json, self.output_json, self.input_json_equipment, self.output_json_equipment = json_template_loader(self.name)

        self.payload = {'description': '',
                   'production_methodology': 'Batch',
                   'code': '',
                   'is_deleted': 'false',
                   'name': '',
                   'timing': 'Periodic',
                   'uom_category': 'Percentage',
                   'kpi_input_param': '',
                   'kpi_output_param': '',
                   'kpi_resource_reference.dimension_table': '',
                   'kpi_resource_reference.resource_context': '',
                   'kpi_resource_reference.resource_code': '',
                   'kpi_time_range.start_time': '2020-09-10 00:00:00',
                   'kpi_time_range.recurrence': '900',
                   'kpi_time_range.last_execution_time': '2020-09-10 00:00:00',
                   'resource_scope': 'process_segment',
                   'value_type': 'numeric',
                   'trend': 'The higher, the better',
                   'min_value': '0',
                   'max_value': '100',
                   'target_value': '100',
                   'kpi_definition_id': ''}
        self.files = [

        ]
        self.headers = {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIwY2ZiNTAzNC1hMTE0LTQwNGMtOWIyMS1lNTlhNWM2ODczNWQifQ.eyJleHAiOjE2MTYxNDAyODcsImlhdCI6MTYxMTA1MDIyNCwianRpIjoiY2I4NWQ4ODEtMTJmMi00OTA3LTg4YjgtMGIwMzBiYmExMWRlIiwiaXNzIjoiaHR0cHM6Ly9hdGhlbmEuaW50ZWNod3cuY29tL3N5c3RlbS9rZXljbG9hay9yZWFsbXMvdGVhbXBsYXkiLCJhdWQiOiJodHRwczovL2F0aGVuYS5pbnRlY2h3dy5jb20vc3lzdGVtL2tleWNsb2FrL3JlYWxtcy90ZWFtcGxheSIsInN1YiI6ImE3NTUwNzhhLWIxODktNGNlMy1iOGFlLTA3NDM1YjkxZTEwMyIsInR5cCI6IlJlZnJlc2giLCJhenAiOiJ0ZWFtcGxheS1hcGkiLCJub25jZSI6IjNkYzRlN2U2LTY4ZjQtNDgzYi04NGUxLTU4ODQ0MWJmNDk1ZCIsInNlc3Npb25fc3RhdGUiOiI4YjkwMDYwMi02MDBlLTQ0NTItYjhkNS0wNmFiZTU3NWFiZTkiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIn0.VSTpoXmUb_MMreoOa0CGEmSESA1phfZiNirymPnpbg0'
        }

    def instance_create(self, nested_eq, ps_list, availability_ps_def_id, availability_eq_def_id,equipments_ls, equipments_names_dict):

        self.nested_eq = nested_eq
        self.equipments_ls = equipments_ls
        self.ps_list = ps_list
        self.equipments_names_dict = equipments_names_dict
        self.availability_ps_def_id = availability_ps_def_id
        self.availability_eq_def_id = availability_eq_def_id

        url = "http://localhost:8088/kpi_instance/create"

        for j in self.ps_list:
            for i in range(self.start_range, self.end_range):
                self.ps_code = j + str(i)
                self.ps_name = self.ps_code.upper()
                if self.nested_eq == 1:
                    for k in self.equipments_ls:
                        self.eq_code = j + str(i) + '_' + k
                        self.eq_name = self.equipments_names_dict[k] + ' ' + self.ps_name

                        self.payload['code'] = [self.name+'_' + self.eq_code]
                        self.payload['name'] = [self.name.capitalize() + ' ' + self.eq_name]
                        self.payload['kpi_definition_id'] = self.availability_eq_def_id
                        self.payload['description'] = self.name.capitalize() + 'for equipment in process segment' + self.eq_name
                        self.payload['kpi_resource_reference.dimension_table'] = self.dimension_table
                        self.payload['kpi_resource_reference.resource_context'] = self.resource_context_dict[self.dimension_table]
                        self.payload['kpi_resource_reference.resource_code'] = self.eq_code

                        self.input_json_equipment, self.output_json_equipment = nested_eq_json_updater(self.name, self.ps_code, self.eq_code, self.input_json_equipment, self.output_json_equipment)

                        self.payload['kpi_input_param'] = str(json.dumps(self.input_json_equipment))
                        self.payload['kpi_output_param'] = str(json.dumps(self.output_json_equipment))

                        response = requests.request("POST", url, headers=self.headers, data=self.payload, files=self.files)
                        print(response.text)


                self.payload['code'] = [self.name+'_' + self.ps_code]
                self.payload['name'] = [self.name.capitalize()+' ' + self.ps_name]
                self.payload['kpi_definition_id'] = self.availability_ps_def_id
                self.payload['description'] = self.name.capitalize() + ' for process segment ' + self.ps_name
                self.payload['kpi_resource_reference.dimension_table'] = self.dimension_table
                self.payload['kpi_resource_reference.resource_context'] = self.resource_context_dict[self.dimension_table]
                self.payload['kpi_resource_reference.resource_code'] = self.ps_code

                self.input_json, self.output_json = ps_json_updater(self.name, self.ps_code, self.input_json, self.output_json)

                self.payload['kpi_input_param'] = str(json.dumps(self.input_json))
                self.payload['kpi_output_param'] = str(json.dumps(self.output_json))

                response = requests.request("POST", url, headers=self.headers, data=self.payload, files=self.files)
                print(response.text)


    def def_create_for_ps(self):
        url = "http://localhost:8088/kpi_definition/create"

        self.payload['code'] = [self.name]
        self.payload['name'] = [self.name.capitalize()]
        self.payload['description'] = self.name + ' for process segment'
        self.payload['resource_scope'] = 'process_segment'
        self.input_json, self.output_json = def_ps_json_updater(self.name, self.input_json,
                                                            self.output_json)

        self.payload['kpi_input_param'] = str(json.dumps(self.input_json))
        self.payload['kpi_output_param'] = str(json.dumps(self.output_json))

        response = requests.request("POST", url, headers=self.headers, data=self.payload, files=self.files)
        print(response.text)

    def def_create_for_eq(self):
        url = "http://localhost:8088/kpi_definition/create"

        self.payload['code'] = [self.name]
        self.payload['name'] = [self.name.capitalize()]
        self.payload['description'] = self.name +' for equipment'
        self.payload['resource_scope'] = 'equipment'

        self.input_json, self.output_json = def_eq_json_updater(self.name, self.input_json,
                                                            self.output_json)

        self.payload['kpi_input_param'] = str(json.dumps(self.input_json))
        self.payload['kpi_output_param'] = str(json.dumps(self.output_json))

        response = requests.request("POST", url, headers=self.headers, data=self.payload, files=self.files)
        print(response.text)