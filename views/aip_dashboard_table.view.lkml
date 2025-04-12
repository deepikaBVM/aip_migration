view: aip_dashboard_table {
  sql_table_name: dbo.AIP_DASHBOARD_TABLE ;;

dimension: composite_id {
    primary_key: yes
    type: string
    sql: CONCAT(${TABLE}.DistrictCode, '-', ${TABLE}.SchoolCode, '-', ${TABLE}.GradeItemCode, '-', CAST(${TABLE}.STARSSchoolYear AS VARCHAR)) ;;
    hidden: yes
  }
  dimension: MapDistrictName {}
  dimension: SubpopTypeName {}

  measure: CAR {
    type: number
    value_format_name: "percent_2"
    sql: ${grade_current_year_cas} / ${grade_enroll_number} ;;
  }

  dimension: car_ratio {
    type: number
    sql: ${grade_current_year_cas} / ${grade_enroll_number} ;;
  }

  dimension: Tier1 {
    type: string
    sql:
    CASE
      WHEN ${car_ratio} < 0.05 THEN 'Tier1'
      ELSE NULL
    END ;;
  }

  dimension: Tier2 {
    type: string
    sql:
    CASE
      WHEN ${car_ratio} > 0.05 and ${car_ratio} < 0.10 THEN 'Tier2'
      ELSE NULL
    END ;;
  }

  dimension: Tier3 {
    type: string
    sql:
    CASE
      WHEN ${car_ratio} >0.1 and ${car_ratio} < 0.2 THEN 'Tier3'
      ELSE NULL
    END ;;
  }

  dimension: Tier4 {
    type: string
    sql:
    CASE
      WHEN ${car_ratio} > 0.2 THEN 'Tier4'
      ELSE NULL
    END ;;
  }
  dimension: district_code {
    type: number
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  measure: grade_current_year_cas {
    type: sum
    sql: CAST(${TABLE}.GradeCurrentYearCAS AS INT);;
  }
  measure: grade_enroll_number {
    type: sum
    sql: CAST(${TABLE}.GradeEnrollNumber AS INT) ;;
  }
  dimension: grade_item_code {
    type: string
    sql: ${TABLE}.GradeItemCode ;;
  }
  dimension: grade_level_sort_order {
    type: number
    hidden: no
    description: "Current grade level of the student at the time of the snapshot - sort order"
    sql: case ${TABLE}.GradeItemCode when 'PK' then 1 when 'KT' then 2 when '1ST' then 3 when '2ND' then 4 when '3RD' then 5
                                           when '4TH' then 6 when '5TH' then 7 when '6TH' then 8 when '7TH' then 9 when '8TH' then 10
                                           when '9TH' then 11 when '10TH' then 12 when '11TH' then 13 when '12TH' then 14 else 15 end;;
  }
  measure: grade_prior1_year_cas {
    type: sum
    sql: CAST(${TABLE}.GradePrior1YearCAS AS INT) ;;
  }
  measure: grade_prior1_year_en {
    type: sum
    sql: CAST(${TABLE}.GradePrior1YearEN AS INT) ;;
  }
  measure: grade_prior2_year_cas {
    type: sum
    sql: CAST(${TABLE}.GradePrior2YearCAS AS INT);;
  }
  measure: grade_prior2_year_en {
    type: sum
    sql: CAST(${TABLE}.GradePrior2YearEN AS INT);;
  }
  dimension_group: last_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  dimension: school_code {
    type: number
    sql: ${TABLE}.SchoolCode ;;
  }
  dimension: school_name {
    type: string
    sql: ${TABLE}.SchoolName ;;
  }
  dimension_group: starsschool_year {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.STARSSchoolYear ;;
  }
  dimension: school_year {
    type: string
    label: "School Year"
    sql:  CAST(YEAR(${TABLE}.STARSSchoolYear)-1 as varchar)+ '-'+ CAST(YEAR(${TABLE}.STARSSchoolYear) as varchar) ;;
  }
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  measure: subpop_currect_year_cas {
    type: sum
    sql:CAST(${TABLE}.SubpopCurrectYearCAS AS INT);;
  }
  measure: subpop_enroll_number {
    type: sum
    sql: CAST(${TABLE}.SubpopEnrollNumber AS INT);;
  }
  measure: subpop_prior1_year_cas {
    type: sum
    sql: CAST(${TABLE}.SubpopPrior1YearCAS AS INT);;
  }
  measure: subpop_prior2_year_cas {
    type: sum
    sql: CAST({TABLE}.SubpopPrior2YearCAS AS INT);;
  }
  measure: subpop_prior2_year_en {
    type: sum
    sql: CAST(${TABLE}.SubpopPrior2YearEN AS INT);;
  }
  measure: subpop_prior_year_en {
    type: sum
    sql: CAST(${TABLE}.SubpopPriorYearEN AS INT);;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.Zipcode ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name]
  }
}
