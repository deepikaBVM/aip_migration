view: tiers_dashboard_table {
  sql_table_name: dbo.Tiers_Dashboard_Table ;;

  dimension: answer {
    type: string
    sql: ${TABLE}.Answer ;;
  }
  dimension: answers_id {
    type: number
    sql: ${TABLE}.AnswersID ;;
  }
  dimension: district_id {
    type: number
    sql: ${TABLE}.DistrictID ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  dimension: entity_type {
    type: string
    sql: ${TABLE}.EntityType ;;
  }
  dimension: entity_type_id {
    type: number
    sql: ${TABLE}.EntityTypeID ;;
  }
  dimension: from_year {
    type: number
    sql: ${TABLE}.FromYear ;;
  }
  dimension: implementation_description {
    type: string
    sql: ${TABLE}.ImplementationDescription ;;
  }
  dimension: implementation_id {
    type: number
    sql: ${TABLE}.ImplementationId ;;
  }
  dimension: implementation_step {
    type: string
    sql: ${TABLE}.ImplementationStep ;;
  }
  dimension: implementation_title {
    type: string
    sql: ${TABLE}.ImplementationTitle ;;
  }
  dimension: plan_description {
    type: string
    sql: ${TABLE}.PlanDescription ;;
  }
  dimension_group: plan_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Plan_End_Date ;;
  }
  dimension: plan_id {
    type: number
   sql: CASE WHEN ${TABLE}.PlanID IS NOT NULL THEN ${TABLE}.PlanID ELSE NULL END ;;
  }
  measure: plan_count {
    type: count
    #sql: ${plan_id} ;;
  }
  dimension: plan_name {
    type: string
    sql: ${TABLE}.PlanName ;;
  }
  dimension_group: plan_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Plan_Start_Date ;;
  }
  dimension: plan_status {
    type: number
    sql: ${TABLE}.Plan_Status ;;
  }
  dimension: IsCertified {
    type: number
    sql:  ${TABLE}.IsCertified ;;
  }
  dimension: planstatus {
    type: string
    sql: ${TABLE}.PlanStatus ;;
  }
  dimension: school_code {
    type: string
    sql: ${TABLE}.SchoolCode ;;
  }
  dimension: school_description {
    type: string
    sql: ${TABLE}.SchoolDescription ;;
  }
  dimension: school_id {
    type: number
    sql: ${TABLE}.SchoolID ;;
  }
  dimension: school_name {
    type: string
    sql: ${TABLE}.SchoolName ;;
  }
  dimension: school_status {
    type: string
    sql: ${TABLE}.SchoolStatus ;;
  }
  dimension: school_year {
    type: string
    sql: ${TABLE}.SchoolYear ;;
  }
  dimension: school_year_id {
    type: number
    sql: ${TABLE}.SchoolYearId ;;
  }
  dimension: strategy_description {
    type: string
    sql: ${TABLE}.StrategyDescription ;;
  }
  dimension: strategy_id {
    type: number
    sql: ${TABLE}.StrategyID ;;
  }
  measure: strategy_id_count {
    type: count
    #sql: ${strategy_id} ;;
  }
  dimension: strategy_name {
    type: string
    sql: ${TABLE}.StrategyName ;;
  }
  dimension: strategy_title {
    type: string
    sql: ${TABLE}.StrategyTitle ;;
  }
  dimension: tier_description {
    type: string
    sql: ${TABLE}.TierDescription ;;
  }
  dimension: tier_id {
    type: number
    sql: CASE WHEN ${TABLE}.TierID IS NOT NULL THEN ${TABLE}.TierID ELSE NULL END ;;
  }
  dimension: tier_name {
    type: string
    sql: CASE WHEN ${TABLE}.TierName IS NOT NULL THEN ${TABLE}.TierName ELSE NULL END ;;
  }
  dimension: tier_title {
    type: string
    sql: ${TABLE}.TierTitle ;;
  }
  dimension: to_year {
    type: number
    sql: ${TABLE}.ToYear ;;
  }
  measure: count {
    type: count
    drill_fields: [school_name, district_name, tier_name, plan_name, strategy_name]
  }

}
