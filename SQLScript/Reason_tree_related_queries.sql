
select * from dt."Reason" where "subCategory" in (select id from dt."ReasonSubCategory" where category in (select id from dt."ReasonCategory" where code = 'downtime' ))

select cat.code, sub_cat.code, reason.code from dt."ReasonCategory" cat join dt."ReasonSubCategory" sub_cat on cat."id" = sub_cat.category join dt."Reason" reason on sub_cat.id = reason."subCategory"

select * from dt."EquipmentClass" where id in (select "equipmentClass" from dt."EquipmentClassMapping" where equipment in (select id from dt."Equipment" where code in ('paster_wrapper_rl1','posimat_unscrambler_rl1')));


--different schema
SELECT dim_eq.id FROM dwh.dim_equipment as dim_eq 
WHERE dim_eq.equipment_code = (SELECT eq.code FROM dt."Equipment" eq WHERE eq.id ='ckh61311600t70797xlr5xf4w') 
AND dim_eq.equipment_type_code = (SELECT eq_class.code FROM dt."EquipmentClassMapping" as eq_map join dt."EquipmentClass" eq_class on eq_map."equipmentClass" = eq_class.id WHERE eq_map.equipment = 'ckh61311600t70797xlr5xf4w') LIMIT 1;
    
