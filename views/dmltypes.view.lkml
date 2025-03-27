view: dmltypes {
  sql_table_name: dbo.DMLTypes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}.Code ;;
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
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, school_districts.count, schools.count]
  }
}
