view: absentee_tiers {
  sql_table_name: dbo.Absentee_Tiers ;;


  dimension: curr_grade_ord {
    type: string
    sql: ${TABLE}.CURR_GRADE_ORD ;;
  }
  dimension: district_code {
    type: number
    sql: ${TABLE}.DISTRICT_CODE;;
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
  dimension: Subpop_code {
    type: string
    sql:
    CASE
      /* Ethnicity mappings */
      WHEN ${ethnic_code} = 'Hispanic' THEN 'H'
      WHEN ${ethnic_code} = 'Black or African American' THEN 'B'
      WHEN ${ethnic_code} = 'Asian' THEN 'A'
      WHEN ${ethnic_code} = 'Caucasian' THEN 'C'
      WHEN ${ethnic_code} = 'Multi-Racial' THEN 'MR'
      WHEN ${ethnic_code} = 'American Indian/Alaskan Native' THEN 'I'
      WHEN ${ethnic_code} = 'Native Hawaiian or Other Pacific Islander' THEN 'P'

      /* Gender mappings */
      WHEN ${student_gender} = 'M' THEN 'M'
      WHEN ${student_gender} = 'F' THEN 'F'

      /* Default case */
      ELSE 'Other'
    END ;;
  }

  dimension: Subpop_label {
    type: string
    sql:
    CASE
      /* Ethnicity displays */
      WHEN ${ethnic_code} = 'Hispanic' THEN 'Hispanic'
      WHEN ${ethnic_code} = 'Black or African American' THEN 'Black/African American'
      WHEN ${ethnic_code} = 'Asian' THEN 'Asian'
      WHEN ${ethnic_code} = 'Caucasian' THEN 'White'
      WHEN ${ethnic_code} = 'Multi-Racial' THEN 'Multi-Racial'
      WHEN ${ethnic_code} = 'American Indian/Alaskan Native' THEN 'Native American'
      WHEN ${ethnic_code} = 'Native Hawaiian or Other Pacific Islander' THEN 'Pacific Islander'

      /* Gender displays */
      WHEN ${student_gender} = 'M' THEN 'Male'
      WHEN ${student_gender} = 'F' THEN 'Female'

      /* Default case */
      ELSE 'Other'
    END ;;
  }
  dimension: hispanic_ind {
    type: string
    sql: ${TABLE}.HISPANIC_IND ;;
  }
  dimension: location_id {
    type: number
    sql: CAST(${TABLE}.LOCATION_ID AS INT);;
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
  dimension: school_year {
    type: string
    label: "School Year"
    sql:  CAST(YEAR(${TABLE}.school_year)-1 as varchar)+ '-'+ CAST(YEAR(${TABLE}.school_year) as varchar) ;;
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
  dimension: GRADEITEMCODE_EDIT {

    type: string
    sql:
    CASE
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = 'PK' THEN 'PK'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = 'KF' THEN 'KT'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '01' THEN '1ST'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '02' THEN '2ND'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '03' THEN '3RD'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '04' THEN '4TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '05' THEN '5TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '06' THEN '6TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '07' THEN '7TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '08' THEN '8TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '09' THEN '9TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '10' THEN '10TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '11' THEN '11TH'
      WHEN ${TABLE}.STUDENT_GRADE_LEVEL = '12' THEN '12TH'
      ELSE 'ALL'
    END ;;
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
  measure: Percent_Tier1 {
    type: number
    value_format_name: "percent_2"
    label: "Percent of Tier1"
    sql:
    CASE
      WHEN ${absentee_tiers.total_days_enrolled} = 0 THEN 0
      ELSE ${absentee_tiers.tier1_absent_student} * 1.0 / ${absentee_tiers.total_days_enrolled}
    END ;;
  }

  measure: Percent_Tier2 {
    type: number
    value_format_name: "percent_2"
    label: "Percent of Tier2"
    sql:
    CASE
      WHEN ${absentee_tiers.total_days_enrolled} = 0 THEN 0
      ELSE ${absentee_tiers.tier2_absent_student} * 1.0 / ${absentee_tiers.total_days_enrolled}
    END ;;
  }

  measure: Percent_Tier3 {
    type: number
    value_format_name: "percent_2"
    label: "Percent of Tier3"
    sql:
    CASE
      WHEN ${absentee_tiers.total_days_enrolled} = 0 THEN 0
      ELSE ${absentee_tiers.tier3_absent_student} * 1.0 / ${absentee_tiers.total_days_enrolled}
    END ;;
  }

  measure: Percent_Tier4 {
    type: number
    value_format_name: "percent_2"
    label: "Percent of Tier4"
    sql:
    CASE
      WHEN ${absentee_tiers.total_days_enrolled} = 0 THEN 0
      ELSE ${absentee_tiers.tier4_absent_student} * 1.0 / ${absentee_tiers.total_days_enrolled}
    END ;;
  }
 measure: total_days_enrolled {
    type: sum
    sql: ${TABLE}.TOTAL_DAYS_ENROLLED ;;
  }
 measure: total_days_present {
    type: sum
    sql: ${TABLE}.TOTAL_DAYS_PRESENT ;;
  }
  measure: total_days_unexcused_absent {
    type: sum
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
