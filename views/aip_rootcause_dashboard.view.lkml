view: aip_rootcause_dashboard {
  sql_table_name: dbo.AIP_ROOTCAUSE_DASHBOARD ;;

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
  dimension: is_plan_submitted {
    type: string
    sql: ${TABLE}.IsPlanSubmitted ;;
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
  dimension: school_district_id {
    type: number
    sql: ${TABLE}.SchoolDistrictId ;;
  }
  dimension: school_id {
    type: number
    sql: ${TABLE}.SchoolID ;;
  }
  dimension: school_name {
    type: string
    sql: ${TABLE}.SchoolName ;;
  }
  dimension: school_year {
    type: string
    sql: ${TABLE}.SchoolYear ;;
  }
  dimension: strategy_name {
    type: string
    sql: ${TABLE}.StrategyName ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name, root_cause_factor_name, strategy_name]
  }
  measure: total_schools {
    type: count_distinct
    sql: ${TABLE}.school_name ;;
    label: "Total Schools"
  }

  measure: engaged_schools {
    type: count_distinct
    sql: ${school_name} ;;
    filters: [answer: "Yes", answer: "No"]
    label: "Engaged Schools (Any Response)"
  }
  measure: not_engaged_schools {
    type: count_distinct
    sql: ${school_name} ;;
    filters: [answer: "NULL"]
    label: "Not Engaged Schools"
  }
  measure: engagement_rate {
    type: number
    sql: ${engaged_schools} / NULLIF(${total_schools}, 0) ;;
    value_format_name: percent_1
    label: "Engagement Rate"
  }


}
