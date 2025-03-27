view: district_plan_contact {
  sql_table_name: dbo.DistrictPlanContact ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: contact_email {
    type: string
    sql: ${TABLE}.ContactEmail ;;
  }
  dimension: contact_name {
    type: string
    sql: ${TABLE}.ContactName ;;
  }
  dimension: contact_phone_number {
    type: string
    sql: ${TABLE}.ContactPhoneNumber ;;
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
  dimension: plan_id {
    type: number
    sql: ${TABLE}.PlanId ;;
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
    drill_fields: [id, contact_name]
  }
}
