view: aip_dashboard_r1 {
  sql_table_name: dbo.AIP_DASHBOARD_R1 ;;

  dimension: composite_id {
    primary_key: yes
    type: string
    sql: CONCAT(${TABLE}.DistrictCode, '-', ${TABLE}.SchoolCode, '-', ${TABLE}.GradeItemCode, '-', CAST(${TABLE}.STARSSchoolYear AS VARCHAR)) ;;
    hidden: yes
  }

  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: district_name {
    type: string
    sql: ${TABLE}.DistrictName ;;
  }
  dimension: grade_car {
    type: number
    value_format_name: "percent_2"
    sql: ${TABLE}.GradeCAR ;;
  }
  measure: grade_current_year_cas {
    type: sum
    sql: CAST(${TABLE}.GradeCurrentYearCAS AS INT);;
  }
  measure: grade_current_year_oar {
    type: sum
    sql: CAST(${TABLE}.GradeCurrentYearOAR AS INT) ;;
  }
  measure: grade_enroll_number {
    type: number
    sql: CAST(${TABLE}.GradeEnrollNumber AS INT) ;;
  }
  measure: grade_enroll_number_cr {
    type: sum
    sql: CAST(${TABLE}.GradeEnrollNumberCR AS INT);;
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
  dimension: map_district_name {
    type: string
    sql: ${TABLE}.MapDistrictName ;;
    view_label:" "
    map_layer_name: school_districts
    html: <p style="color: Yellow; font-size: 100%">{{ value }}</p> ;;
    label: "District Name"
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
  dimension: subpop_car {
    type: number
    value_format_name: "percent_2"
    sql: ${TABLE}.SubpopCAR ;;
  }
  measure: subpop_current_year_cas {
    type: sum
    sql: CAST(${TABLE}.SubpopCurrentYearCAS AS INT) ;;
  }
  measure: subpop_current_year_oar {
    type: sum
    sql: CAST(${TABLE}.SubpopCurrentYearOAR AS INT) ;;
  }
  measure: subpop_enroll_number {
    type: sum
    sql: CAST(${TABLE}.SubpopEnrollNumber AS INT) ;;
  }
  measure: subpop_enroll_number_cr {
    type: sum
    sql: CAST(${TABLE}.SubpopEnrollNumberCR AS INT);;
  }
  dimension: subpop_type_name {
    type: string
    sql: ${TABLE}.SubpopTypeName ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.Zipcode ;;
    label: "Zipcode"
    view_label: " "
  }
  measure: count {
    type: count
    drill_fields: [district_name, school_name, subpop_type_name, map_district_name]
  }
}
