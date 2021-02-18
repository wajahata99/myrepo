import requests
import json

f = open('availability_input.json', )
input_json = json.load(f)
f.close()

f = open('availability_input_equipment.json', )
input_json_equipment = json.load(f)
f.close()

f = open('availability_output.json', )
output_json = json.load(f)
f.close()

f = open('availability_output_equipment.json', )
output_json_equipment = json.load(f)
f.close()

url = "http://localhost:8088/kpi_definition/create"

payload={'description': 'to_be_replaced',
'production_methodology': 'Batch',
'code': 'to_be_replaced',
'is_deleted': 'false',
'name': 'to_be_replaced',
'timing': 'Periodic',
'uom_category': 'Percentage',
'kpi_input_param': 'to_be_replaced',
'kpi_output_param': 'to_be_replaced',
'kpi_resource_reference.dimension_table': 'dim_process_segment',
'kpi_resource_reference.resource_context': 'process_segment_code',
'kpi_resource_reference.resource_code': 'to_be_replaced',
'kpi_time_range.start_time': '2022-02-02 00:00:00',
'kpi_time_range.recurrence': '900',
'kpi_time_range.last_execution_time': '2022-02-02 00:00:00',
'resource_scope': 'process_segment',
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100',
'kpi_definition_id': '25'}

payload2={'description': 'to_be_replaced',
'production_methodology': 'Batch',
'code': 'to_be_replaced',
'is_deleted': 'false',
'name': 'to_be_replaced',
'timing': 'Periodic',
'uom_category': 'Percentage',
'kpi_input_param': 'to_be_replaced',
'kpi_output_param': 'to_be_replaced',
'kpi_resource_reference.dimension_table': 'dim_equipment',
'kpi_resource_reference.resource_context': 'equipment_code',
'kpi_resource_reference.resource_code': 'to_be_replaced',
'kpi_time_range.start_time': '2022-02-02 00:00:00',
'kpi_time_range.recurrence': '900',
'kpi_time_range.last_execution_time': '2022-02-02 00:00:00',
'resource_scope': 'equipment',
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100',
'kpi_definition_id': '25'}

files=[

]
headers = {
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIwY2ZiNTAzNC1hMTE0LTQwNGMtOWIyMS1lNTlhNWM2ODczNWQifQ.eyJleHAiOjE2MTYxNDAyODcsImlhdCI6MTYxMTA1MDIyNCwianRpIjoiY2I4NWQ4ODEtMTJmMi00OTA3LTg4YjgtMGIwMzBiYmExMWRlIiwiaXNzIjoiaHR0cHM6Ly9hdGhlbmEuaW50ZWNod3cuY29tL3N5c3RlbS9rZXljbG9hay9yZWFsbXMvdGVhbXBsYXkiLCJhdWQiOiJodHRwczovL2F0aGVuYS5pbnRlY2h3dy5jb20vc3lzdGVtL2tleWNsb2FrL3JlYWxtcy90ZWFtcGxheSIsInN1YiI6ImE3NTUwNzhhLWIxODktNGNlMy1iOGFlLTA3NDM1YjkxZTEwMyIsInR5cCI6IlJlZnJlc2giLCJhenAiOiJ0ZWFtcGxheS1hcGkiLCJub25jZSI6IjNkYzRlN2U2LTY4ZjQtNDgzYi04NGUxLTU4ODQ0MWJmNDk1ZCIsInNlc3Npb25fc3RhdGUiOiI4YjkwMDYwMi02MDBlLTQ0NTItYjhkNS0wNmFiZTU3NWFiZTkiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIn0.VSTpoXmUb_MMreoOa0CGEmSESA1phfZiNirymPnpbg0'
}

ps_list = ['sl']
for j in ps_list:
  for i in range(1,2):
    ps_code = j
    ps_name = ps_code.upper()
    payload['code'] = ['availability']
    payload['name'] = ['Availability']
    payload['description'] = 'Availability is a ratio that shows the relation between the actual production time (APT)\
and the planned busy time (PBT) for a work unit'

    equipments_ls = ['eq']
    for k in equipments_ls:
      eq_code = j+'_'+k
      eq_name = j.upper()+ ' ' +k.upper()
      payload2['code'] = ['availability']
      payload2['name'] = ['Availability']
      payload2['description'] = 'Availability is a ratio that shows the relation between the actual production time (APT)\
and the planned busy time (PBT) for a work unit'

      payload2['kpi_input_param'] = str(json.dumps(input_json_equipment))
      payload2['kpi_output_param'] = str(json.dumps(output_json_equipment))

      response = requests.request("POST", url, headers=headers, data=payload2, files=files)
      print(response.text)

    payload['kpi_input_param'] = str(json.dumps(input_json))
    payload['kpi_output_param'] = str(json.dumps(output_json))

    response = requests.request("POST", url, headers=headers, data=payload, files=files)
    print(response.text)