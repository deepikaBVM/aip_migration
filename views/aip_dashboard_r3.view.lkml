view: aip_dashboard_r3 {
  sql_table_name: dbo.AIP_Dashboard_R3 ;;

  dimension: map_district_name {
    type: string
    sql: ${TABLE}.map_district_name ;;
    view_label:" "
    map_layer_name: school_districts
    html: <p style="color: Yellow; font-size: 100%">{{ value }}</p> ;;
    label: "District Name"
  }

  measure: car {
    type: number
    value_format_name: "percent_2"
    sql: ${TABLE}.CAR ;;
  }
  measure: current_year_cas {
    type: sum
    sql: CAST(${TABLE}.CurrentYearCAS AS INT) ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  measure: enroll_number {
    type: sum
    sql: CAST(${TABLE}.EnrollNumber AS INT) ;;
  }
dimension: grade_item_code {

  type: string
  sql:
    CASE ${TABLE}.GradeLevel
      WHEN '1' THEN '1ST'
      WHEN '2' THEN '2ND'
      WHEN '3' THEN '3RD'
      WHEN '4' THEN '4TH'
      WHEN '5' THEN '5TH'
      WHEN '6' THEN '6TH'
      WHEN '7' THEN '7TH'
      WHEN '8' THEN '8TH'
      WHEN '9' THEN '9TH'
      WHEN '10' THEN '10TH'
      WHEN '11' THEN '11TH'
      WHEN '12' THEN '12TH'
      WHEN 'PK' THEN 'PK'
      WHEN 'KT' THEN 'KT'
      ELSE ${TABLE}.GradeLevel
    END ;;
}
  dimension: grade_level_sort_order {
    type: number
    hidden: no
    description: "Grade level sort order"
    sql: case ${TABLE}.GradeLevel
              when 'PK' then 1 when 'KT' then 2 when '1ST' then 3
              when '2ND' then 4 when '3RD' then 5 when '4TH' then 6
              when '5TH' then 7 when '6TH' then 8 when '7TH' then 9
              when '8TH' then 10 when '9TH' then 11 when '10TH' then 12
              when '11TH' then 13 when '12TH' then 14 else 15 end;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.LocationType ;;
  }
  dimension: school_code {
    type: string
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
    sql: CAST(YEAR(${TABLE}.STARSSchoolYear)-1 as varchar)+ '-'+ CAST(YEAR(${TABLE}.STARSSchoolYear) as varchar) ;;
  }

  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  measure: tier1_absence_rate {

    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier1AbsenceRate AS FLOAT) ;;
  }

  measure: tier1_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier1Absentee AS INT) ;;
  }

  measure: tier2_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier2AbsenceRate AS FLOAT) ;;
  }

  measure: tier2_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier2Absentee AS INT) ;;
  }

  measure: tier3_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier3AbsenceRate AS FLOAT) ;;
  }

  measure: tier3_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier3Absentee AS INT) ;;
  }

  measure: tier4_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier4AbsenceRate AS FLOAT) ;;
  }

  measure: tier4_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier4Absentee AS INT) ;;
  }
  measure: total_days_enrolled {
    type: sum
    sql: CAST(${TABLE}.TotalDaysEnrolled as INT) ;;
  }
  measure: total_days_excused_absence {
    type: average
    sql: CAST(${TABLE}.TotalDaysExcusedAbsence as INT) ;;
  }
  measure: total_days_present {
    type: sum
    sql: CAST(${TABLE}.TotalDaysPresent as INT) ;;
  }
  measure: total_days_unexcused_absence {
    type: average
    sql: CAST(${TABLE}.TotalDaysUnexcusedAbsence as INT) ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name]
  }
}
