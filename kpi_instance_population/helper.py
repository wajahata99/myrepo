import json

def json_template_loader(name):
    if name == 'availability':
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
    elif name == 'performance':
        f = open('performance_input.json', )
        input_json = json.load(f)
        f.close()
    
        f = open('performance_input_equipment.json', )
        input_json_equipment = json.load(f)
        f.close()
    
        f = open('performance_output.json', )
        output_json = json.load(f)
        f.close()
    
        f = open('performance_output_equipment.json', )
        output_json_equipment = json.load(f)
        f.close()
    elif name == 'oee':
        f = open('oee_input.json', )
        input_json = json.load(f)
        f.close()
    
        f = open('oee_input_equipment.json', )
        input_json_equipment = json.load(f)
        f.close()
    
        f = open('oee_output.json', )
        output_json = json.load(f)
        f.close()
    
        f = open('oee_output_equipment.json', )
        output_json_equipment = json.load(f)
        f.close()
    else:
        print('kpi name does not match the available kpi instances')
    return input_json, output_json, input_json_equipment, output_json_equipment
    

def ps_json_updater(name, ps_code, input_json, output_json):
    if name == 'availability':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    elif name == 'performance':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][3]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    elif name == 'oee':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
    else:
        'kpi name is not compatible'
    return input_json, output_json

def nested_eq_json_updater(name, ps_code, eq_code, input_json_equipment, output_json_equipment):
    if name == 'availability':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

    elif name == 'performance':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][3]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][2]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][3]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

    elif name == 'oee':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]
        input_json_equipment['sourceFields'][2]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = [ps_code]
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = [eq_code]

    else:
        'kpi name is not compatible'
    return input_json_equipment, output_json_equipment

def def_ps_json_updater(name, input_json, output_json):
    if name == 'availability':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
    elif name == 'performance':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][3]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
    elif name == 'oee':
        input_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
    else:
        'kpi name is not compatible'
    return input_json, output_json

def def_eq_json_updater(name, input_json_equipment, output_json_equipment):
    if name == 'availability':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

    elif name == 'performance':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][3]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][2]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][3]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

    elif name == 'oee':
        input_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][2]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        input_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][1]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None
        input_json_equipment['sourceFields'][2]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

        output_json_equipment['sourceFields'][0]['dimensionRecords'][0]['lookupParameters'][2]['value'] = None
        output_json_equipment['sourceFields'][0]['dimensionRecords'][1]['lookupParameters'][0]['value'] = None

    else:
        'kpi name is not compatible'
    return input_json_equipment, output_json_equipment
