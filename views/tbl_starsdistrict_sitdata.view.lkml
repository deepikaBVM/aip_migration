view: tbl_starsdistrict_sitdata {
  sql_table_name: dbo.tbl_STARSDistrictSITData ;;

  dimension: current_year_oar {
    type: number
    sql: ${TABLE}.CurrentYearOAR ;;
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
  dimension: prior1_year_oar {
    type: number
    sql: ${TABLE}.Prior1YearOAR ;;
  }
  dimension: prior2_year_oar {
    type: number
    sql: ${TABLE}.Prior2YearOAR ;;
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
