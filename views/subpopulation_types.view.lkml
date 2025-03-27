view: subpopulation_types {
  sql_table_name: dbo.SubpopulationTypes ;;
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
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: sort_order {
    type: number
    sql: ${TABLE}.SortOrder ;;
  }
  dimension: sub_pop_catg_code {
    type: number
    sql: ${TABLE}.SubPopCatgCode ;;
  }
  dimension: sub_pop_catg_desc {
    type: string
    sql: ${TABLE}.SubPopCatgDesc ;;
  }
  dimension: sub_pop_item_code {
    type: string
    sql: ${TABLE}.SubPopItemCode ;;
  }
  dimension: sub_pop_item_descr {
    type: string
    sql: ${TABLE}.SubPopItemDescr ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
