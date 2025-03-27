view: school_districts {
  sql_table_name: dbo.SchoolDistricts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: code {
    type: string
    sql: CAST(${TABLE}.Code AS INT) ;;
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
    drill_fields: [id, name, dmltypes.id, dmltypes.name, schools.count]
  }
}
