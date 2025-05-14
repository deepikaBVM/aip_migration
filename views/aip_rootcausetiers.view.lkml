view: aip_rootcausetiers {
  sql_table_name: dbo.AIP_ROOTCAUSETIERS ;;

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
  dimension: entity_type_id {
    type: number
    sql: ${TABLE}.EntityTypeId ;;
  }
  dimension: from_date {
    type: number
    sql: ${TABLE}.FromDate ;;
  }
  dimension: implementation_name {
    type: string
    sql: ${TABLE}.ImplementationName ;;
  }
  dimension: is_plan_submitted {
    type: string
    sql: ${TABLE}.IsPlanSubmitted ;;
  }
  dimension: IsCertified_Label {
    type: string
    sql: CASE
         WHEN ${TABLE}.IsPlanSubmitted  = 'YES' THEN 'Submitted'
         WHEN ${TABLE}.IsPlanSubmitted  = 'NO' THEN 'Plan Created But Not Submitted'
         WHEN ${TABLE}.IsPlanSubmitted  IS NULL OR ${plan_id} IS NULL THEN 'No Plan'
         ELSE NULL
       END ;;
    group_label: "Certification"
  }
   dimension: plan_id {
    type: number
    sql: CASE WHEN ${TABLE}.PlanID IS NOT NULL THEN ${TABLE}.PlanID ELSE NULL END ;;
  }
  measure: plan_count {
    type: count_distinct
    sql: ${plan_id} ;;
  }
  dimension: question {
    type: string
    sql: ${TABLE}.Question ;;
  }
  dimension: root_cause_challenge {
    type: string
    sql: ${TABLE}."Root Cause Challenge" ;;
  }
  dimension: root_cause_factor_name {
    type: string
    sql: ${TABLE}."Root Cause Factor Name" ;;
  }
  dimension: root_cause_factor_title {
    type: string
    sql: ${TABLE}."Root Cause Factor Title" ;;
  }
  dimension: root_cause_step {
    type: string
    sql: ${TABLE}."Root Cause Step" ;;
  }
  dimension: root_cause_strategy_name {
    type: string
    sql: ${TABLE}."Root Cause Strategy Name" ;;
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
  dimension: sort_answer_id {
    type: number
    sql: ${TABLE}.SortAnswerID ;;
  }
  dimension: strategy_name {
    type: string
    sql: ${TABLE}.StrategyName ;;
  }
  dimension: tier_name {
    type: string
    sql: ${TABLE}.TierName ;;
  }
  dimension: to_date {
    type: number
    sql: ${TABLE}.ToDate ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension: dashboardtype {
    type: string
    sql: ${TABLE}.DashboardType ;;
  }

  measure: total_schools {
    type: count_distinct
    sql: ${TABLE}.SchoolName ;;
    label: "Total Schools"
  }
  measure: engaged_schools {
    type: count_distinct
    sql: ${school_name} ;;
    filters: [answer: "Yes", answer: "No"]
    label: "Engaged Schools"
  }
  measure: yes_answer {
    type: count_distinct
    sql: ${school_name} ;;
    filters: [answer: "Yes"]
    label: "Engaged yes answer"
  }
  measure: no_answer {
    type: count_distinct
    sql: ${school_name} ;;
    filters: [answer: "No"]
    label: "Engaged No answer"
  }
  measure: schools_per_factor {
    type: count_distinct
    sql: ${TABLE}.SchoolName  ;;
    label: "Schools with This Factor"
  }
# Add these new measures for factor analysis:

  measure: schools_with_factor {
    type: count_distinct
    sql:${TABLE}.SchoolName ;;
    label: "Schools with Factor"
    description: "Count of distinct schools with each root cause factor"
  }

  measure: percent_schools_with_factor {
    type: number
    sql: ${schools_with_factor} / NULLIF(${total_schools}, 0) ;;
    value_format_name: percent_1
    label: "% of Schools with Factor"
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  district_name,
  school_name,
  tier_name,
  strategy_name,
  implementation_name,
  root_cause_factor_name,
  root_cause_strategy_name
  ]
  }

}
