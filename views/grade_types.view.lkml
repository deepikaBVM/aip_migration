view: grade_types {
  sql_table_name: dbo.GradeTypes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: created_by {
    type: string
    sql: ${TABLE}.CreatedBy ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreatedOn ;;
  }
  dimension: grade_catg_code {
    type: number
    sql: ${TABLE}.GradeCatgCode ;;
  }
  dimension: grade_catg_desc {
    type: string
    sql: ${TABLE}.GradeCatgDesc ;;
  }
  dimension: grade_item_code {
    type: string
    sql: ${TABLE}.GradeItemCode ;;
  }
  dimension: grade_item_descr {
    type: string
    sql: ${TABLE}.GradeItemDescr ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: sort_order {
    type: number
    sql: ${TABLE}.SortOrder ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
