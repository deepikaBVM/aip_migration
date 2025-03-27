view: tbl_starsdistrict_sub_pop_data {
  sql_table_name: dbo.tbl_STARSDistrictSubPopData ;;

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
  dimension: starsschool_year {
    type: string
    sql: ${TABLE}.STARSSchoolYear ;;
  }
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  measure: count {
    type: count
  }
}
