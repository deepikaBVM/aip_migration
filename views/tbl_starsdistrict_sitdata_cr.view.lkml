view: tbl_starsdistrict_sitdata_cr {
  sql_table_name: dbo.tbl_STARSDistrictSITDataCR ;;

  dimension: current_year_cas {
    type: number
    sql: ${TABLE}.CurrentYearCAS ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: enroll_number {
    type: number
    sql: ${TABLE}.EnrollNumber ;;
  }
  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  dimension: prior1_year_cas {
    type: number
    sql: ${TABLE}.Prior1YearCAS ;;
  }
  dimension: prior1_year_en {
    type: number
    sql: ${TABLE}.Prior1YearEN ;;
  }
  dimension: prior2_year_cas {
    type: number
    sql: ${TABLE}.Prior2YearCAS ;;
  }
  dimension: prior2_year_en {
    type: number
    sql: ${TABLE}.Prior2YearEN ;;
  }
  dimension: school_code {
    type: string
    sql: ${TABLE}.SchoolCode ;;
  }
  dimension: starsschool_year {
    type: string
    sql: ${TABLE}.STARSSchoolYear ;;
  }
  measure: count {
    type: count
  }
}
