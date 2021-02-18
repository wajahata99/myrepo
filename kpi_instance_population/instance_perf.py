import requests
import json
f = open('performance_input.json', )
input_json = json.load(f)
f.close()

f = open('performance_output.json', )
output_json = json.load(f)
f.close()

url = "http://localhost:8088/kpi_instance/create"

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
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100',
'kpi_definition_id': '37'}
files=[

]
headers = {
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIwY2ZiNTAzNC1hMTE0LTQwNGMtOWIyMS1lNTlhNWM2ODczNWQifQ.eyJleHAiOjE2MTYxNDAyODcsImlhdCI6MTYxMTA1MDIyNCwianRpIjoiY2I4NWQ4ODEtMTJmMi00OTA3LTg4YjgtMGIwMzBiYmExMWRlIiwiaXNzIjoiaHR0cHM6Ly9hdGhlbmEuaW50ZWNod3cuY29tL3N5c3RlbS9rZXljbG9hay9yZWFsbXMvdGVhbXBsYXkiLCJhdWQiOiJodHRwczovL2F0aGVuYS5pbnRlY2h3dy5jb20vc3lzdGVtL2tleWNsb2FrL3JlYWxtcy90ZWFtcGxheSIsInN1YiI6ImE3NTUwNzhhLWIxODktNGNlMy1iOGFlLTA3NDM1YjkxZTEwMyIsInR5cCI6IlJlZnJlc2giLCJhenAiOiJ0ZWFtcGxheS1hcGkiLCJub25jZSI6IjNkYzRlN2U2LTY4ZjQtNDgzYi04NGUxLTU4ODQ0MWJmNDk1ZCIsInNlc3Npb25fc3RhdGUiOiI4YjkwMDYwMi02MDBlLTQ0NTItYjhkNS0wNmFiZTU3NWFiZTkiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIn0.VSTpoXmUb_MMreoOa0CGEmSESA1phfZiNirymPnpbg0'
}

ps_list = ['sl']
for j in ps_list:
  for i in range(1,6):
    ps_code = j+str(i)
    ps_name = ps_code.upper()
    payload['code'] = ['performance_'+ps_code]
    payload['name'] = ['Performance ' + ps_name]
    payload['description'] = 'Performance for process segment ' + ps_name

    input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    input_json['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    input_json['sourceFields'][3]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]

    payload['kpi_input_param'] = str(json.dumps(input_json))
    payload['kpi_output_param'] = str(json.dumps(output_json))
    payload['kpi_resource_reference.resource_code'] = ps_code

    response = requests.request("POST", url, headers=headers, data=payload, files=files)
    print(response.text)

