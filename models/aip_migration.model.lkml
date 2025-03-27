connection: "aip-bvm"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: aip_migration_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aip_migration_default_datagroup

explore: answers {
  join: entity_types {
    type: left_outer
    sql_on: ${answers.entity_type_id} = ${entity_types.id} ;;
    relationship: many_to_one
  }
}

explore: answers_history {
  join: answers {
    type: left_outer
    sql_on: ${answers_history.answer_id} = ${answers.id} ;;
    relationship: many_to_one
  }

  join: entity_types {
    type: left_outer
    sql_on: ${answers_history.entity_type_id} = ${entity_types.id} ;;
    relationship: many_to_one
  }
}

explore: attendance_team {}

explore: district_plan_contact {}

explore: dmltypes {}

explore: email_notifications {
  join: entity_types {
    type: left_outer
    sql_on: ${email_notifications.entity_type_id} = ${entity_types.id} ;;
    relationship: many_to_one
  }
}

explore: entity_types {}

explore: external_settings {}

explore: grade_types {}

explore: implementation_steps {}

explore: implementation_steps_history {
  join: implementation_steps {
    type: left_outer
    sql_on: ${implementation_steps_history.implementation_step_id} = ${implementation_steps.id} ;;
    relationship: many_to_one
  }
}

explore: institution_types {}

explore: internal_settings {}

explore: school_districts {
   join: schools {
    type: left_outer
    sql_on: ${schools.school_district_id} = ${school_districts.id} ;;
    relationship: one_to_many
  }
}

explore: schools {
  join: school_districts {
    type: left_outer
    sql_on: ${schools.school_district_id} = ${school_districts.id} ;;
    relationship: many_to_one
  }

  join: school_types {
    type: left_outer
    sql_on: ${schools.school_type_id} = ${school_types.id} ;;
    relationship: many_to_one
  }

}

explore: school_types {}

explore: school_years {}

explore: subpopulation_types {}

explore: tbl_starsdistrict_grade_data {}

explore: tbl_starsdistrict_grade_data_cr {}

explore: tbl_starsdistrict_sitdata {}

explore: tbl_starsdistrict_sitdata_cr {}

explore: tbl_starsdistrict_sub_pop_data {}

explore: tbl_starsdistrict_sub_pop_data_cr {}

explore: tbl_starsschool_grade_data {
  join: school_districts {
    relationship: many_to_one
    type: left_outer
    sql_on: ${tbl_starsschool_grade_data.district_code} = ${school_districts.code};;
  }
  join: schools {
    relationship: many_to_one
    type: left_outer
    sql_on:  ${school_districts.id} = ${schools.school_district_id} ;;

  }
}

explore: tbl_starsschool_grade_data_cr { join: school_districts {
    relationship: many_to_one
    type: left_outer
    sql_on: ${tbl_starsschool_grade_data_cr.district_code} = ${school_districts.code};;
  }
  join: schools {
    relationship: many_to_one
    type: left_outer
    sql_on:  ${school_districts.id} = ${schools.school_district_id}
      and ${schools.code} ${tbl_starsschool_grade_data_cr.school_code};;
  }
}

explore: tbl_starsschool_sub_pop_data {}

explore: tbl_starsschool_sub_pop_data_cr {}

explore: tbl_starssnap_shot_data_cr {}
