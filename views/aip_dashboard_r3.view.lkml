view: aip_dashboard_r3 {
  sql_table_name: dbo.AIP_Dashboard_R3 ;;

  dimension: car {
    type: string
    sql: ${TABLE}.CAR ;;
  }
  dimension: current_year_cas {
    type: string
    sql: ${TABLE}.CurrentYearCAS ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  dimension: enroll_number {
    type: string
    sql: ${TABLE}.EnrollNumber ;;
  }
  dimension: grade_level {
    type: string
    sql: ${TABLE}.GradeLevel ;;
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
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  dimension: tier1_absence_rate {
    type: string
    sql: ${TABLE}.Tier1AbsenceRate ;;
  }
  dimension: tier1_absentee {
    type: string
    sql: ${TABLE}.Tier1Absentee ;;
  }
  dimension: tier2_absence_rate {
    type: string
    sql: ${TABLE}.Tier2AbsenceRate ;;
  }
  dimension: tier2_absentee {
    type: string
    sql: ${TABLE}.Tier2Absentee ;;
  }
  dimension: tier3_absence_rate {
    type: string
    sql: ${TABLE}.Tier3AbsenceRate ;;
  }
  dimension: tier3_absentee {
    type: string
    sql: ${TABLE}.Tier3Absentee ;;
  }
  dimension: tier4_absence_rate {
    type: string
    sql: ${TABLE}.Tier4AbsenceRate ;;
  }
  dimension: tier4_absentee {
    type: string
    sql: ${TABLE}.Tier4Absentee ;;
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
