view: school_years {
  sql_table_name: dbo.SchoolYears ;;
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
  dimension: from_year {
    type: number
    sql: ${TABLE}.FromYear ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: to_year {
    type: number
    sql: ${TABLE}.ToYear ;;
  }
  dimension: updated_by {
    type: string
    sql: ${TABLE}.UpdatedBy ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.UpdatedOn ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
