view: aip_dashboard_table {
sql_table_name: dbo.AIP_DASHBOARD_TABLE ;;

dimension: composite_id {
    primary_key: yes
    type: string
    sql: CONCAT(${TABLE}.DistrictCode, '-', ${TABLE}.SchoolCode, '-', ${TABLE}.GradeItemCode, '-', CAST(${TABLE}.STARSSchoolYear AS VARCHAR)) ;;
    hidden: yes
  }

  dimension: MapDistrictName {
    type: string
    sql: ${TABLE}.MapDistrictName ;;
    view_label:" "
  #map_layer_name: school_districts
  #html: <p style="color: Yellow; font-size: 100%">{{ value }}</p> ;;
    label: "District Name"
}
  dimension: SubpopTypeName {}

  dimension: district_code {
    type: number
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  measure: grade_enroll_number {
    type: sum
    sql: CAST(${TABLE}.GradeEnrollNumber AS INT) ;;
    drill_fields: [district_code,district_name, school_code,school_name,grade_enroll_number]
  }
  measure: grade_current_year_cas {
    type: sum
    sql: CAST(${TABLE}.GradeCurrentYearCAS AS INT);;
    drill_fields: [district_code,district_name, school_code,school_name,grade_current_year_cas]
  }
  measure: CAR {
    type: number
    value_format_name: "percent_2"
    sql: CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) ;;
    drill_fields: [district_code,district_name, school_code,school_name, CAR]
  }

  dimension: car_tier {
    type: string
    sql:
    CASE
      WHEN CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) < 0.05 THEN 'Tier 1'
      WHEN CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) >= 0.05 AND
           CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) < 0.10 THEN 'Tier 2'
      WHEN CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) >= 0.10 AND
           CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) < 0.20 THEN 'Tier 3'
      WHEN CAST(${grade_current_year_cas} AS FLOAT) / NULLIF(${grade_enroll_number}, 0) >= 0.20 THEN 'Tier 4'
      ELSE 'Uncategorized'
    END ;;
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
    drill_fields: [district_code,district_name, school_code,school_name,subpop_currect_year_cas]
  }
  measure: subpop_enroll_number {
    type: sum
    sql: CAST(${TABLE}.SubpopEnrollNumber AS INT);;
    drill_fields: [district_code,district_name, school_code,school_name,subpop_enroll_number]
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
    label: "Zipcode"
    view_label: " "
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name]
  }
}
