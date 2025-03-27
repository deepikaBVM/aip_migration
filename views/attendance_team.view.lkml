view: attendance_team {
  sql_table_name: dbo.AttendanceTeam ;;
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
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: plan_id {
    type: number
    sql: ${TABLE}.PlanId ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
