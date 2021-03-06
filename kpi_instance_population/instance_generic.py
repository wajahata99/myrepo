from base import cruds

#Use one from 'availability', 'performance' and 'oee'
name = 'oee'
resource_concept_dim = 'dim_process_segment'

#Sequance range to be generated, e.g. sl1,sl2,sl3 etc. Use start_range 1 and end_range 2 for generating just one.
start_range = 127
end_range = 128
crud_name = 'create'

#Reffer manually from kpi_definition tables
def_id = '34'
eq_def_id = '35'

#porcess segment name initials,sl for soap line and rl for raftar line etc.
ps_list = ['sl']

#Following will be used in case of nested equipments
nested_eq = 1
equipments_ls = ['pw','cp']
equipments_names_dict = {'cp': 'Case Packer', 'pw': 'Paster Wrapper', 'pu': 'Posimat Unscrambler','rf': 'Ronchi Filler', 'tc': 'Tolkie Capper'}

myobj = cruds(resource_concept_dim, name, start_range, end_range, crud_name)

#myobj.instance_create(nested_eq, ps_list, def_id, eq_def_id, equipments_ls, equipments_names_dict)
myobj.def_create_for_eq()
myobj.def_create_for_ps()
