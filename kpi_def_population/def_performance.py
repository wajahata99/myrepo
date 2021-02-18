import requests
import json
f = open('performance_input.json', )
input_json = json.load(f)
f.close()

f = open('performance_output.json', )
output_json = json.load(f)
f.close()

url = "http://localhost:8088/kpi_definition/create"

payload={'description': 'Effectiveness represents the relationship between the planned target cycle and the actual cycle expressed as the planned runtime per item (PRI) multiplied by the produced quantity (PQ) divided by the actual production time (APT)',
'production_methodology': 'Batch',
'code': 'to_be_replaced',
'is_deleted': 'false',
'name': 'to_be_replaced',
'timing': 'Periodic',
'uom_category': 'Percentage',
'kpi_input_param': 'to_be_replaced',
'kpi_output_param': 'to_be_replaced',
'kpi_time_range.end_time': '2022-02-02 00:00:00',
'kpi_time_range.start_time': '2021-02-02 00:00:00',
'kpi_time_range.recurrence': '900',
'kpi_time_range.last_execution_time': '2021-02-02 00:00:00',
'resource_scope': 'process_segment',
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100'}

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
    payload['code'] = ['performance']
    payload['name'] = ['Performance']
    payload['kpi_input_param'] = str(json.dumps(input_json))
    payload['kpi_output_param'] = str(json.dumps(output_json))

    response = requests.request("POST", url, headers=headers, data=payload, files=files)
    print(response.text)
