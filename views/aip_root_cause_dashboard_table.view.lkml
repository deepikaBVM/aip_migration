view: aip_root_cause_dashboard_table {
  sql_table_name: dbo.AIP_RootCause_Dashboard_Table ;;

  dimension: answer {
    type: string
    sql: ${TABLE}.Answer ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  dimension: entity_id {
    type: number
    sql: ${TABLE}.EntityId ;;
  }
  dimension: entity_type {
    type: string
    sql: ${TABLE}.EntityType ;;
  }
  dimension: plan_id {
    type: number
    sql: ${TABLE}.PlanID ;;
  }
  dimension: question {
    type: string
    sql: ${TABLE}.Question ;;
  }
  dimension: root_cause_challenge {
    type: string
    sql: ${TABLE}.RootCauseChallenge ;;
  }
  dimension: root_cause_factor_name {
    type: string
    sql: ${TABLE}.RootCauseFactorName ;;
  }
  dimension: root_cause_factor_title {
    type: string
    sql: ${TABLE}.RootCauseFactorTitle ;;
  }
  dimension: root_cause_step {
    type: string
    sql: ${TABLE}.RootCauseStep ;;
  }
  dimension: school_name {
    type: string
    sql: ${TABLE}.SchoolName ;;
  }
  dimension: strategy_name {
    type: string
    sql: ${TABLE}.StrategyName ;;
  }
  dimension: year {
    type: string
    sql: ${TABLE}.Year ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name, root_cause_factor_name, strategy_name]
  }
}
