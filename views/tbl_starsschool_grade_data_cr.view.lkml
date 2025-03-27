view: tbl_starsschool_grade_data_cr {
  sql_table_name: dbo.tbl_STARSSchoolGradeDataCR ;;

  measure: current_year_cas {
    type: sum
    sql: CAST(${TABLE}.CurrentYearCAS AS INT);;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  measure: enroll_number {
    type: sum
    sql: CAST(${TABLE}.EnrollNumber AS INT) ;;
  }
  dimension: grade_item_code {
    type: string
    sql: ${TABLE}.GradeItemCode ;;
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
    sql: ${TABLE}.SchoolCode ;;
  }
  dimension: starsschool_year {
    type: string
    sql: ${TABLE}.STARSSchoolYear ;;
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
