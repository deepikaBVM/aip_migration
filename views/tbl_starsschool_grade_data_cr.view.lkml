view: tbl_starsschool_grade_data_cr {
  sql_table_name: dbo.tbl_STARSSchoolGradeDataCR ;;

  measure: current_year_cas {
    type: sum
    sql: CAST(${TABLE}.CurrentYearCAS AS INT);;
  }
  dimension: district_code {
    type: string
    sql: CAST(${TABLE}.DistrictCode AS INT) ;;
  }
  measure: enroll_number {
    type: sum
    sql: CAST(${TABLE}.EnrollNumber AS INT) ;;
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

  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  measure: prior1_year_cas {
    type: sum
    sql: CAST(${TABLE}.Prior1YearCAS AS INT);;
  }
  measure: prior1_year_en {
    type: sum
    sql: CAST(${TABLE}.Prior1YearEN AS INT) ;;
  }
  measure: prior2_year_cas {
    type: sum
    sql: CAST(${TABLE}.Prior2YearCAS AS INT) ;;
  }
  measure: prior2_year_en {
    type: sum
    sql: CAST(${TABLE}.Prior2YearEN AS INT);;
  }
  dimension: school_code {
    type: string
    sql: CAST(${TABLE}.SchoolCode AS INT);;
  }
  dimension: starsschool_year {
    type: string
    sql: CAST(${TABLE}.STARSSchoolYear AS DATE);;
    }
    dimension: school_year {
      type: string
      label: "School Year"
      sql:  CAST(YEAR(${TABLE}.STARSSchoolYear)-1 as varchar)+ '-'+ CAST(YEAR(${TABLE}.STARSSchoolYear) as varchar) ;;
  }
  measure: count {
    type: count
  }
}
