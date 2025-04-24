view: absentee_tiers {
  sql_table_name: dbo.Absentee_Tiers ;;


  dimension: curr_grade_ord {
    type: string
    sql: ${TABLE}.CURR_GRADE_ORD ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DISTRICT_CODE ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DISTRICT_NAME ;;
  }
  dimension: economic_code {
    type: string
    sql: ${TABLE}.ECONOMIC_CODE ;;
  }
  dimension: eng_prof_code {
    type: string
    sql: ${TABLE}.ENG_PROF_CODE ;;
  }
  dimension: ethnic_code {
    type: string
    sql: ${TABLE}.ETHNIC_CODE ;;
  }
  dimension: hispanic_ind {
    type: string
    sql: ${TABLE}.HISPANIC_IND ;;
  }
  dimension: location_id {
    type: string
    sql: ${TABLE}.LOCATION_ID ;;
  }
  dimension: school_name {
    type: string
    sql: ${TABLE}.SCHOOL_NAME ;;
  }
  dimension_group: school_year {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.SCHOOL_YEAR ;;
  }
  dimension_group: snapshot {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SNAPSHOT_DATE ;;
  }
  dimension: special_ed_code {
    type: string
    sql: ${TABLE}.SPECIAL_ED_CODE ;;
  }
  dimension: student_gender {
    type: string
    sql: ${TABLE}.STUDENT_GENDER ;;
  }
  dimension: student_grade_level {
    type: string
    sql: ${TABLE}.STUDENT_GRADE_LEVEL ;;
  }
  dimension: student_id {
    type: string
    sql: ${TABLE}.STUDENT_ID ;;
  }
  dimension: tier1_absentee {
    type: number
    sql: CAST(${TABLE}."Tier1 Absentee"  AS INT) ;;
  }
  dimension: tier2_absentee {
    type: number
    sql: CAST(${TABLE}."Tier2 Absentee" AS INT ) ;;
  }
  dimension: tier3_absentee {
    type: number
    sql: CAST(${TABLE}."Tier3 Absentee" AS INT)  ;;
  }
  dimension: tier4_absentee {
    type: number
    sql: CAST(${TABLE}."Tier4 Absentee" AS INT)  ;;
  }
  measure: tier1_absent_student {
    type: sum
    label: "No. of Student in Tier 1"
    sql: ${tier1_absentee} ;;
  }
  measure: tier2_absent_student {
    type: sum
    label: "No. of Student in Tier 2"
    sql: ${tier2_absentee} ;;
  }
  measure: tier3_absent_student {
    type: sum
    label: "No. of Student in Tier 3"
    sql: ${tier3_absentee} ;;
  }
  measure: tier4_absent_student {
    type: sum
    label: "No. of Student in Tier 4"
    sql: ${tier4_absentee} ;;
  }
  dimension: total_days_enrolled {
    type: number
    sql: ${TABLE}.TOTAL_DAYS_ENROLLED ;;
  }
  dimension: total_days_present {
    type: number
    sql: ${TABLE}.TOTAL_DAYS_PRESENT ;;
  }
  dimension: total_days_unexcused_absent {
    type: number
    sql: ${TABLE}.TOTAL_DAYS_UNEXCUSED_ABSENT ;;
  }
  dimension: id {
    primary_key:  yes
    type:  number
    sql: ${TABLE}.id ;;
  }
  measure: count {

    type: count
    drill_fields: [district_name, school_name]
  }
}
