import xlrd
import psycopg2
import psycopg2.extras
import uuid
from pandas import read_excel
#import math

state_library_dict = {}
reason_category_dict = {}
reason_subcategory_dict = {}
state_machine_dict = {}
process_segment_dict = {}
equipment_class_dict = {}
reason_dict = {}
state_def_dict = {}
equipment_dict = {}
reason_tree_dict = {}


def insert_query(query):
    try:
        connection = None
        connection = psycopg2.connect(database="dt_reason_tables", user="postgres", password='Maple#105',
                                      host="localhost", port=5432)
        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()
        count = cursor.rowcount
        # print(count, "Record inserted successfully")
    except (Exception, psycopg2.Error) as error:
        print("Failed to insert record", error)
        raise error
    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


def execute_query(query, fetch_one=True):
    try:
        connection = None
        connection = psycopg2.connect(database="dt_reason_tables", user="postgres", password='Maple#105',
                                      host="localhost", port=5432)
        cursor = connection.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cursor.execute(query)
        if fetch_one:
            result = cursor.fetchone()
        else:
            result = cursor.fetchall()
        return result

    except (Exception, psycopg2.Error) as error:
        print("Error while fetching data from PostgreSQL", error)
        raise error

    finally:
        # closing database connection.
        if (connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")


def category_table_population():
    category_df = read_excel("D:/reason_dt_table_population/ReasonTree.xlsx",
                             sheet_name='ReasonCategory')
    for index, row in category_df.iterrows():
        cat_uuid = str(uuid.uuid4())[:8]
        query = """INSERT INTO dt."ReasonCategory" 
        (id,name,code,description,"isDeleted","sortOrder") 
        values('%s','%s','%s','%s','%s',%d)""" % (
        cat_uuid, row.Name, row.code, row.description, row.isDeleted, row.sortOrder)
        insert_records = insert_query(query)


def get_state_library_id_and_code():
    query = """SELECT id, code FROM dt."StateLibrary";"""
    state_library_id_and_code = execute_query(query, False)
    for x in state_library_id_and_code:
        state_library_dict[x[1]] = x[0]
    return state_library_dict


def get_reason_category_id_and_code():
    query = """SELECT id, code FROM dt."ReasonCategory";"""
    reason_category_id_and_code = execute_query(query, False)
    for x in reason_category_id_and_code:
        reason_category_dict[x[1]] = x[0]
    return reason_category_dict


def state_library_category_mapping_table_population(state_library_dict, reason_category_dict):
    state_category_df = read_excel("ReasonTree.xlsx",
                                   sheet_name='StateLibraryReasonCategoryMap')
    for index, row in state_category_df.iterrows():
        cat_state_map_uuid = str(uuid.uuid4())[:8]
        category_id = reason_category_dict[row.category_code]
        state_library_id = state_library_dict[row.state_library_code]

        query = """INSERT INTO dt."StateLibraryReasonCategoryMapping" 
        (category,"stateLibrary") 
        values('%s','%s')""" % ( category_id, state_library_id)
        insert_records = insert_query(query)


def subcategory_table_population():
    subcategory_df = read_excel("ReasonTree.xlsx",
                                sheet_name='ReasonSubCategory')
    for index, row in subcategory_df.iterrows():
        subcat_uuid = str(uuid.uuid4())[:8]
        category_id = reason_category_dict[row.category_code]
        query = """INSERT INTO dt."ReasonSubCategory" 
        (id,code,name,description,category,"isDeleted","sortOrder") 
        values('%s','%s','%s','%s','%s','%s',%d)""" % (
        subcat_uuid, row.code, row.Name, row.description, category_id, row.isDeleted, row.sortOrder)
        insert_records = insert_query(query)


def get_reason_subcategory_id_and_code():
    query = """SELECT id, code FROM dt."ReasonSubCategory";"""
    reason_subcategory_id_and_code = execute_query(query, False)
    for x in reason_subcategory_id_and_code:
        reason_subcategory_dict[x[1]] = x[0]
    return reason_subcategory_dict


def reason_table_population():
    reason_df = read_excel("ReasonTree.xlsx", sheet_name='Reason')
    for index, row in reason_df.iterrows():
        reason_uuid = str(uuid.uuid4())[:8]
        subcategory_id = reason_subcategory_dict[row.subcategory_code]
        query = """INSERT INTO dt."Reason" 
        (id,code,name,description,"subCategory","hasEquipment","isDeleted","sortOrder") 
        values('%s','%s','%s','%s','%s','%s', '%s', %d)""" % (
        reason_uuid, row.code, row.Name, row.description, subcategory_id, False, row.isDeleted,
        row.sortOrder)
        insert_records = insert_query(query)


def get_state_machine_id_and_code():
    query = """SELECT id, code FROM dt."StateMachineDefinition";"""
    state_machine_id_and_code = execute_query(query, False)
    for x in state_machine_id_and_code:
        state_machine_dict[x[1]] = x[0]
    return state_machine_dict


def get_process_segment_id_and_code():
    query = """SELECT id, code FROM dt."ProcessSegment";"""
    process_segment_id_and_code = execute_query(query, False)
    for x in process_segment_id_and_code:
        process_segment_dict[x[1]] = x[0]
    return process_segment_dict


def reason_tree_table_population():
    reason_tree_df = read_excel("ReasonTree.xlsx",
                                sheet_name='ReasonTree')
    for index, row in reason_tree_df.iterrows():
        reason_tree_uuid = str(uuid.uuid4())[:8]
        state_machine_id = state_machine_dict[row.state_machine_code]
        process_segment_id = process_segment_dict[row.process_segment_code]
        query = """INSERT INTO dt."ReasonTree" 
        (id,code,name,description,"stateMachine","processSegment","isDeleted","sortOrder") 
        values('%s','%s','%s','%s','%s','%s','%s',%d)""" % (
        reason_tree_uuid, row.code, row.Name, row.description, state_machine_id, process_segment_id, row.isDeleted,
        row.sortOrder)
        insert_records = insert_query(query)


def get_equipment_class_id_and_code():
    query = """SELECT id, code FROM dt."EquipmentClass";"""
    equipment_class_id_and_code = execute_query(query, False)
    for x in equipment_class_id_and_code:
        equipment_class_dict[x[1]] = x[0]
    return equipment_class_dict


def get_reason_id_and_code():
    query = """SELECT id, code FROM dt."Reason";"""
    reason_id_and_code = execute_query(query, False)
    for x in reason_id_and_code:
        reason_dict[x[1]] = x[0]
    return reason_dict


def reason_equipment_type_table_population():
    reason_equipment_type_df = read_excel("ReasonTree.xlsx",
                                          sheet_name='ReasonEquipmentTypeMapping')

    for index, row in reason_equipment_type_df.iterrows():
        reason_id = reason_dict[row.reason_code]
        equipment_type_id = equipment_class_dict[row.equipment_type_code]
        query = """INSERT INTO dt."ReasonEquipmentTypeMapping" 
        ("equipmentType",reason) 
        values('%s','%s')""" % (equipment_type_id, reason_id)
        insert_records = insert_query(query)


def get_state_definition_id_and_code():
    query = """SELECT id, code FROM dt."StateDefinition";"""
    state_definition_id_and_code = execute_query(query, False)
    for x in state_definition_id_and_code:
        state_def_dict[x[1]] = x[0]
    return state_def_dict


def get_equipment_id_and_code():
    query = """SELECT id, code FROM dt."Equipment";"""
    equipment_id_and_code = execute_query(query, False)
    for x in equipment_id_and_code:
        equipment_dict[x[1]] = x[0]
    return equipment_dict


def get_reason_tree_id_and_code():
    query = """SELECT id, code FROM dt."ReasonTree";"""
    reason_tree_id_and_code = execute_query(query, False)
    for x in reason_tree_id_and_code:
        reason_tree_dict[x[1]] = x[0]
    return reason_tree_dict


def reason_tree_config_table_population():
    reason_tree_config_df = read_excel("ReasonTree.xlsx",sheet_name='ReasonTreeConfig')
    for index, row in reason_tree_config_df.iterrows():
        reason_tree_config_uuid = str(uuid.uuid4())[:8]
        reason_tree_id = reason_tree_dict[row.reason_tree_code]
        state_definition_id = state_def_dict[row.state_definition_code]
        category_id = reason_category_dict[row.category_code]
        subcategory_id = reason_subcategory_dict[row.sub_category_code]

        if row.equipment_code in equipment_dict.keys():
            equipment_id = equipment_dict[row.equipment_code]
        else:
            equipment_id = None

        reason_id = reason_dict[row.reason_code]
        group_num = category_id + subcategory_id + state_definition_id + reason_id

        if equipment_id == None:

            query = """INSERT INTO dt."ReasonTreeConfig" 
            (id, "groupNumber", "isDeleted", "sortOrder", reason, equipment, "stateDefinition", "subCategory", category, "reasonTree") 
            values('%s','%s','%s','%s','%s',null,'%s','%s','%s','%s')""" % (
            reason_tree_config_uuid, group_num, row.isDeleted, row.sortOrder, reason_id, state_definition_id,
            subcategory_id, category_id, reason_tree_id)

        else:
            query = """INSERT INTO dt."ReasonTreeConfig" 
            (id, "groupNumber", "isDeleted", "sortOrder", reason, equipment, "stateDefinition", "subCategory", category, "reasonTree") 
            values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')""" % (
            reason_tree_config_uuid, group_num, row.isDeleted, row.sortOrder, reason_id, equipment_id,
            state_definition_id, subcategory_id, category_id, reason_tree_id)

        insert_records = insert_query(query)


category_table_population=category_table_population()
state_library_dict = get_state_library_id_and_code()
reason_category_dict = get_reason_category_id_and_code()
state_library_category_mapping_table_population=state_library_category_mapping_table_population(state_library_dict,reason_category_dict)
subcategory_table_population=subcategory_table_population()
reason_subcategory_dict = get_reason_subcategory_id_and_code()
reason_table_population=reason_table_population()
state_machine_dict = get_state_machine_id_and_code()
process_segment_dict = get_process_segment_id_and_code()
reason_tree_table_population=reason_tree_table_population()
equipment_class_dict = get_equipment_class_id_and_code()
reason_dict = get_reason_id_and_code()
reason_equipment_type_table_population=reason_equipment_type_table_population()
get_state_definition_id_and_code = get_state_definition_id_and_code()
get_equipment_id_and_code = get_equipment_id_and_code()
get_reason_tree_id_and_code = get_reason_tree_id_and_code()
reason_tree_config_table_population=reason_tree_config_table_population()