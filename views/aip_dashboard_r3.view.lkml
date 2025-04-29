view: aip_dashboard_r3 {
  sql_table_name: dbo.AIP_Dashboard_R3 ;;

  dimension: car {
    type: number
    sql: CAST(${TABLE}.CAR AS FLOAT) ;;
  }
  dimension: current_year_cas {
    type: number
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
    type: number
    sql: CAST(${TABLE}.enroll_number AS INT) ;;
  }
  dimension: grade_level {
    type: string
    sql: ${TABLE}.GradeLevel ;;
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
  dimension: tier1_absence_rate {

    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier1AbsenceRate AS FLOAT) ;;
  }

  dimension: tier1_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier1Absentee AS INT) ;;
  }

  dimension: tier2_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier2AbsenceRate AS FLOAT) ;;
  }

  dimension: tier2_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier2Absentee AS INT) ;;
  }

  dimension: tier3_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier3AbsenceRate AS FLOAT) ;;
  }

  dimension: tier3_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier3Absentee AS INT) ;;
  }

  dimension: tier4_absence_rate {
    type: number
    value_format_name: "percent_2"
    sql: TRY_CAST(${TABLE}.Tier4AbsenceRate AS FLOAT) ;;
  }

  dimension: tier4_absentee {
    type: number
    sql: TRY_CAST(${TABLE}.Tier4Absentee AS INT) ;;
  }
  dimension: total_days_enrolled {
    type: number
    sql: ${TABLE}.TotalDaysEnrolled ;;
  }
  dimension: total_days_excused_absence {
    type: string
    sql: ${TABLE}.TotalDaysExcusedAbsence ;;
  }
  dimension: total_days_present {
    type: number
    sql: ${TABLE}.TotalDaysPresent ;;
  }
  dimension: total_days_unexcused_absence {
    type: string
    sql: ${TABLE}.TotalDaysUnexcusedAbsence ;;
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name]
  }
}
