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

 measure: CAR {
  type: number
  value_format_name: "percent_2"
  sql: CAST(${current_year_cas} AS FLOAT) / NULLIF(${enroll_number}, 0) ;;
  drill_fields: [district_code,district_name, school_code,school_name, CAR]
}
  measure: current_year_cas {
    type: sum
    sql: CAST(${TABLE}.CurrentYearCAS AS INT) ;;
    drill_fields: [district_code, district_name, school_code, school_name, current_year_cas]
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
    drill_fields: [district_code,district_name, school_code,school_name,enroll_number]
  }
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  dimension: sub_pop_item_sort {
    type: number
    label: "Subpopulation Item Sort"

    sql:  case when ${sub_pop_item_code} = 'F' then 1
               when ${sub_pop_item_code} = 'M' then 2
               when ${sub_pop_item_code} = 'H' then 3
               when ${sub_pop_item_code} = 'I' then 4
               when ${sub_pop_item_code} = 'A' then 5
               when ${sub_pop_item_code} = 'B' then 6
               when ${sub_pop_item_code} = 'C' then 7
               when ${sub_pop_item_code} = 'P' then 8
               when ${sub_pop_item_code} = 'NH' then 9
               when ${sub_pop_item_code} = 'ED' then 10
               when ${sub_pop_item_code} = 'SD' then 11
               when ${sub_pop_item_code} = 'EL' then 12
               when ${sub_pop_item_code} = 'Homeless' then 13
               when ${sub_pop_item_code} = 'Not Homeless' then 14
               else 0 end
              ;;
  }

  dimension: sub_pop_item {
    type: string
    label: "Subpopulation Item"
    order_by_field: sub_pop_item_sort
    sql:  case when ${sub_pop_item_code} = 'F' then 'Female'
               when ${sub_pop_item_code} = 'M' then 'Male'
               when ${sub_pop_item_code} = 'ED' then 'Economically Disadvantaged'
               when ${sub_pop_item_code} = 'H' then 'Hispanic'
               when ${sub_pop_item_code} = 'A' then 'Asian'
               when ${sub_pop_item_code} = 'C' then 'Caucasian'
               when ${sub_pop_item_code} = 'B' then 'Black  or African American'
               when ${sub_pop_item_code} = 'I' then 'American Indian/Alaskan Native'
               when ${sub_pop_item_code} = 'P' then 'Native Hawaiian or Other Pacific Islander'
               when ${sub_pop_item_code} = 'SD' then 'Students with Disabilities'
               when ${sub_pop_item_code} = 'EL' then 'English Language Learners'
               when ${sub_pop_item_code} = 'NH' then 'Not Hispanic'
               when ${sub_pop_item_code} = 'Homeless' then 'Experiencing Housing Insecurity'
               when ${sub_pop_item_code} = 'Not Homeless' then 'Housed'
               else '' end
              ;;
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
      WHEN '01' THEN '1ST'
      WHEN '02' THEN '2ND'
      WHEN '03' THEN '3RD'
      WHEN '04' THEN '4TH'
      WHEN '05' THEN '5TH'
      WHEN '06' THEN '6TH'
      WHEN '07' THEN '7TH'
      WHEN '08' THEN '8TH'
      WHEN '09' THEN '9TH'
      WHEN '10' THEN '10TH'
      WHEN '11' THEN '11TH'
      WHEN '12' THEN '12TH'
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

  measure: tier1_absence_rate {
    label: "Percent of Student in Tier 1"
    type: average
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier1AbsenceRate AS FLOAT) ;;
  }

  measure: tier1_absent_student {
    type: sum
    label: "No. of Student in Tier 1"
    sql: CAST(${TABLE}.EnrollNumber as INT) -  CAST(${TABLE}.Tier2Absentee as INT) - CAST(${TABLE}.Tier3Absentee as INT) - CAST(${TABLE}.Tier4Absentee as INT);;
    drill_fields: [district_code,district_name,school_code,school_name, tier1_absent_student]
  }

  measure: Tier1_percentage {
    type: number
    value_format_name: "percent_2"
    sql: CAST(${tier1_absent_student} AS FLOAT) / NULLIF(${enroll_number}, 0) ;;
    drill_fields: [district_code,district_name, school_code,school_name, Tier1_percentage]
  }

  measure: tier2_absence_rate {
    type: average
    label: "Percent of Student in Tier 2"
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier2AbsenceRate AS FLOAT) ;;
  }

  measure: tier2_absent_student {
    type: sum
    label: "No. of Student in Tier 2"
    sql: CAST(${TABLE}.Tier2Absentee as INT);;
    drill_fields: [district_code,district_name,school_code,school_name, tier2_absent_student]

  }

  measure: Tier2_percentage {
    type: number
    value_format_name: "percent_2"
    sql: CAST(${tier2_absent_student} AS FLOAT) / NULLIF(${enroll_number}, 0) ;;
    drill_fields: [district_code,district_name, school_code,school_name, Tier2_percentage]
  }

  measure: tier3_absence_rate {
    type: average
    value_format_name: "percent_2"
    label: "Percent of Student in Tier 3"
    sql: TRY_CAST(${TABLE}.Tier3AbsenceRate AS FLOAT) ;;
  }

  measure: tier3_absent_student {
    type: sum
    label: "No. of Student in Tier 3"
    sql: CAST(${TABLE}.Tier3Absentee as INT) ;;
    drill_fields: [district_code,district_name,school_code,school_name, tier3_absent_student]

  }

  measure: Tier3_percentage {
    type: number
    value_format_name: "percent_2"
    sql: CAST(${tier3_absent_student} AS FLOAT) / NULLIF(${enroll_number}, 0) ;;
    drill_fields: [district_code,district_name, school_code,school_name, Tier3_percentage]
  }

  measure: tier4_absence_rate {
    type: average
    value_format_name: "percent_2"
    label: "Percent of Student in Tier 4"
    sql: TRY_CAST(${TABLE}.Tier4AbsenceRate AS FLOAT) ;;
  }

  measure: tier4_absent_student {
    type: sum
    label: "No. of Student in Tier 4"
    sql: CAST(${TABLE}.Tier4Absentee as INT) ;;
    drill_fields: [district_code,district_name,school_code,school_name, tier4_absent_student]

  }

  measure: Tier4_percentage {
    type: number
    value_format_name: "percent_2"
    sql: CAST(${tier4_absent_student} AS FLOAT) / NULLIF(${enroll_number}, 0) ;;
    drill_fields: [district_code,district_name, school_code,school_name, Tier4_percentage]
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
  measure: avg_days_unexcused_absence {
    type: average
    label: "Average Days Unexcused Absence"
    sql: ${TABLE}.TotalDaysUnexcusedAbsence ;;
  }
  measure: avg_days_excused_absence {
    type: average
    label: "Average Excused Absences"
    sql: ${TABLE}.TotalDaysExcusedAbsence ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name]
  }
}
