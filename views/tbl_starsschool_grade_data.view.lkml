view: tbl_starsschool_grade_data {
  sql_table_name: dbo.tbl_STARSSchoolGradeData ;;

  measure: current_year_oar {
    type: average
    sql: CAST(${TABLE}.CurrentYearOAR AS FLOAT);;
  }
  dimension: district_code {
    type: string
    sql: CAST(${TABLE}.DistrictCode AS INT) ;;
  }
  measure: enroll_number {
    type: sum
    sql: CAST(${TABLE}.EnrollNumber AS INT);;
  }
  dimension: grade_item_code {
    type: string
    sql: ${TABLE}.GradeItemCode ;;
  }
  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  measure: prior1_year_oar {
    type: sum
    sql: CAST(${TABLE}.Prior1YearOAR AS INT);;
  }
  measure: prior2_year_oar {
    type: sum
    sql:CAST(${TABLE}.Prior2YearOAR AS INT) ;;
  }
  dimension: school_code {
    type: string
    sql: CAST(${TABLE}.SchoolCode AS INT);;
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
