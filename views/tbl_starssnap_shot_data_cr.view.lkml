view: tbl_starssnap_shot_data_cr {
  sql_table_name: dbo.tbl_STARSSnapShotDataCR ;;

  dimension: actual120_day_cas {
    type: number
    sql: ${TABLE}.Actual120DayCAS ;;
  }
  dimension: actual120_day_en {
    type: number
    sql: ${TABLE}.Actual120DayEN ;;
  }
  dimension: actual40_day_cas {
    type: number
    sql: ${TABLE}.Actual40DayCAS ;;
  }
  dimension: actual40_day_en {
    type: number
    sql: ${TABLE}.Actual40DayEN ;;
  }
  dimension: actual80_day_cas {
    type: number
    sql: ${TABLE}.Actual80DayCAS ;;
  }
  dimension: actual80_day_en {
    type: number
    sql: ${TABLE}.Actual80DayEN ;;
  }
  dimension: actual_eoycas {
    type: number
    sql: ${TABLE}.ActualEOYCAS ;;
  }
  dimension: actual_eoyen {
    type: number
    sql: ${TABLE}.ActualEOYEN ;;
  }
  dimension: district_code {
    type: string
    sql: ${TABLE}.DistrictCode ;;
  }
  dimension: last_updated_date {
    type: string
    sql: ${TABLE}.LastUpdatedDate ;;
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
