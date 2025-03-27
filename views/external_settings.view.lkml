view: external_settings {
  sql_table_name: dbo.ExternalSettings ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
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
  dimension: environment {
    type: string
    sql: ${TABLE}.Environment ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.Value ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
