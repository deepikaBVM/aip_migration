view: tbl_starsdistrict_grade_data {
  sql_table_name: dbo.tbl_STARSDistrictGradeData ;;

  dimension: current_year_oar {
    type: string
    sql: ${TABLE}.CurrentYearOAR ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: enroll_number {
    type: string
    sql: ${TABLE}.EnrollNumber ;;
  }
  dimension: grade_item_code {
    type: string
    sql: ${TABLE}.GradeItemCode ;;
  }
  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  dimension: prior1_year_oar {
    type: string
    sql: ${TABLE}.Prior1YearOAR ;;
  }
  dimension: prior2_year_oar {
    type: string
    sql: ${TABLE}.Prior2YearOAR ;;
  }
  dimension: starsschool_year {
    type: string
    sql: ${TABLE}.STARSSchoolYear ;;
  }
  measure: count {
    type: count
  }
}
