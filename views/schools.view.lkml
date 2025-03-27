view: schools {
  sql_table_name: dbo.Schools ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: CAST(${TABLE}.Id AS INT);;
  }
  dimension: code {
    type: string
    sql: CAST(${TABLE}.Code AS INT);;
  }
  dimension: created_by {
    type: string
    sql: ${TABLE}.CreatedBy ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreatedOn ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: dmltype_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DMLTypeId ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: school_district_id {
    type: number
    # hidden: yes
    sql: CAST(${TABLE}.SchoolDistrictId AS INT);;
  }
  dimension: school_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SchoolTypeId ;;
  }
  dimension: stars_key {
    type: string
    sql: ${TABLE}.StarsKey ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  name,
  school_districts.id,
  school_districts.name,
  school_types.id,
  school_types.name,
  dmltypes.id,
  dmltypes.name
  ]
  }

}
