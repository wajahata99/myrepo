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
'kpi_time_range.start_time': '2022-09-01 00:00:00',
'kpi_time_range.recurrence': '900',
'kpi_time_range.last_execution_time': '2022-09-01 00:00:00',
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100',
'kpi_definition_id': '65'}

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
'value_type': 'numeric',
'trend': 'The higher, the better',
'min_value': '0',
'max_value': '100',
'target_value': '100',
'kpi_definition_id': '34'}

files=[

]
headers = {
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIwY2ZiNTAzNC1hMTE0LTQwNGMtOWIyMS1lNTlhNWM2ODczNWQifQ.eyJleHAiOjE2MTYxNDAyODcsImlhdCI6MTYxMTA1MDIyNCwianRpIjoiY2I4NWQ4ODEtMTJmMi00OTA3LTg4YjgtMGIwMzBiYmExMWRlIiwiaXNzIjoiaHR0cHM6Ly9hdGhlbmEuaW50ZWNod3cuY29tL3N5c3RlbS9rZXljbG9hay9yZWFsbXMvdGVhbXBsYXkiLCJhdWQiOiJodHRwczovL2F0aGVuYS5pbnRlY2h3dy5jb20vc3lzdGVtL2tleWNsb2FrL3JlYWxtcy90ZWFtcGxheSIsInN1YiI6ImE3NTUwNzhhLWIxODktNGNlMy1iOGFlLTA3NDM1YjkxZTEwMyIsInR5cCI6IlJlZnJlc2giLCJhenAiOiJ0ZWFtcGxheS1hcGkiLCJub25jZSI6IjNkYzRlN2U2LTY4ZjQtNDgzYi04NGUxLTU4ODQ0MWJmNDk1ZCIsInNlc3Npb25fc3RhdGUiOiI4YjkwMDYwMi02MDBlLTQ0NTItYjhkNS0wNmFiZTU3NWFiZTkiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIn0.VSTpoXmUb_MMreoOa0CGEmSESA1phfZiNirymPnpbg0'
}

ps_list = ['soap_line']
for j in ps_list:
  for i in range(2,4):
    ps_code = j+str(i)
    ps_name = ps_code.upper()
    payload['code'] = ['availability_'+ps_code]
    payload['name'] = ['Availability ' + ps_name]
    payload['description'] = 'Availability for process segment ' + ps_name
    input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]

    equipments_ls = ['cp', 'pw', 'pu', 'rf', 'tc']
    equipments_names_dict = {'cp':'Case Packer','pw':'Paster Wrapper','pu':'Posimat Unscrambler','rf': 'Ronchi Filler','tc':'Tolkie Capper'}
    for k in equipments_ls:
      eq_code = j+str(i)+'_'+k
      eq_name = equipments_names_dict[k] + ' ' +ps_name
      payload2['code'] = ['availability_' + eq_code]
      payload2['name'] = ['Availability ' + eq_name]
      payload2['description'] = 'Availability for equipment ' + eq_name

      input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
      input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
      input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
      input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
      output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
      output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

      payload2['kpi_input_param'] = str(json.dumps(input_json_equipment))
      payload2['kpi_output_param'] = str(json.dumps(output_json_equipment))
      payload2['kpi_resource_reference.resource_code'] = eq_code

      response = requests.request("POST", url, headers=headers, data=payload2, files=files)
      print(response.text)

    payload['kpi_input_param'] = str(json.dumps(input_json))
    payload['kpi_output_param'] = str(json.dumps(output_json))
    payload['kpi_resource_reference.resource_code'] = ps_code

    response = requests.request("POST", url, headers=headers, data=payload, files=files)
    print(response.text)