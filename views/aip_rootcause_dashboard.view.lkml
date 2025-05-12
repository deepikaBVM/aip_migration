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
    type: count
    filters: [answer: "Yes"]
    label: "Engaged yes answer"
  }
  measure: no_answer {
    type: count
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
    sql: ${school_id} ;;
    label: "Schools with Factor"
    description: "Count of distinct schools with each root cause factor"
  }

  measure: percent_schools_with_factor {
    type: number
    sql: ${schools_with_factor} / NULLIF(${total_schools}, 0) ;;
    value_format_name: percent_1
    label: "% of Schools with Factor"
  }

  measure: top_factors {
    type: string
    sql:
    SELECT STRING_AGG(CAST(factor AS VARCHAR(255)), ', ' ORDER BY school_count DESC)
    FROM (
      SELECT
        RootCauseFactorName AS factor,
        COUNT(DISTINCT SchoolID) AS school_count
      FROM ${TABLE}
      GROUP BY RootCauseFactorName
      ORDER BY school_count DESC
      LIMIT 3
    ) AS subquery ;;
    label: "Top 3 Factors"
  }

}
