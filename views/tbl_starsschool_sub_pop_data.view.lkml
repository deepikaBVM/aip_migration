view: tbl_starsschool_sub_pop_data {
  sql_table_name: dbo.tbl_STARSSchoolSubPopData ;;

  measure: current_year_oar {
    type: sum
    sql: CAST( ${TABLE}.CurrentYearOAR AS INT);;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  measure: enroll_number {
    type: sum
    sql: CAST( ${TABLE}.EnrollNumber AS INT);;
  }
  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
  }
  measure: prior1_year_oar {
    type: sum
    sql: CAST(${TABLE}.Prior1YearOAR AS INT) ;;
  }
  measure: prior2_year_oar {
    type: sum
    sql: CAST(${TABLE}.Prior2YearOAR AS INT);;
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
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  measure: count {
    type: count
  }
}
