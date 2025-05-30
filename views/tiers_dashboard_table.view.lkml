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
  measure: count_of_districtid {
    type: count_distinct
    sql: ${district_id} ;;
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
  measure: count_of_answers {
    type: count
    #sql: ${TABLE}.AnswersID ;;
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
    type: count_distinct
    sql: ${plan_id} ;;
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
    sql: ${TABLE}.IsCertified ;;
  }
  dimension: IsCertified_Label {
    type: string
    sql: CASE
         WHEN ${TABLE}.IsCertified = 1 THEN 'Submitted'
         WHEN ${TABLE}.IsCertified = 0 THEN 'Plan Created But Not Submitted'
         WHEN ${TABLE}.IsCertified IS NULL OR ${plan_id} IS NULL THEN 'No Plan'
         ELSE NULL
       END ;;
    group_label: "Certification"
  }
  dimension: PlanCategory {
    type: string
    sql:
      CASE
        WHEN ${TABLE}.IsCertified = 1 THEN ${plan_id}='Submitted'
        WHEN ${TABLE}.IsCertified = 0 THEN ${plan_id}='Plan Created But Not Submitted'
        WHEN ${TABLE}.IsCertified IS NULL OR ${plan_id} IS NULL THEN 'No Plan'
        ELSE NULL
      END ;;
  }
  measure: Plan_Category {
    type: count
    }
  dimension: school_id {
    type: number
    sql: ${TABLE}.SchoolID ;;
  }
  measure: count_of_schoolid {
    type: count_distinct
    sql: ${school_id} ;;
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
  dimension: strategy_short_name {
    type: string
    sql:
    CASE
      WHEN ${strategy_name} = 'Assessing student and family needs to provide tailored support' THEN 'Tailored Support'
      WHEN ${strategy_name} = 'Collaboration with external agencies, including child welfare, to provide comprehensive support' THEN 'Agency Collaboration'
      WHEN ${strategy_name} = 'Creating an engaging school climate' THEN 'School Climate'
      WHEN ${strategy_name} = 'Creating detailed intervention plans focused on keeping students engaged in an educational setting' THEN 'Intervention Plans'
      WHEN ${strategy_name} = 'Fostering positive relationships with students and families' THEN 'Relationships'
      WHEN ${strategy_name} = 'Intensive case management and wraparound services to address severe attendance issues' THEN 'Case Management'
      WHEN ${strategy_name} = 'Personalized outreach to students and families' THEN 'Outreach'
      WHEN ${strategy_name} = 'Weekly progress monitoring to track attendance and adjust interventions as needed' THEN 'Progress Monitoring'
      ELSE ${strategy_name}
    END ;;
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
  dimension: postalcode {
    type: zipcode
    sql: ${TABLE}.postalcode ;;
  }
  measure: count {
    type: count
    drill_fields: [school_name, district_name, tier_name, plan_name, strategy_name]
  }
  dimension: map_district_name {
    type: string
    map_layer_name: school_districts
    sql: ${TABLE}.DistrictName ;;
  }



}
