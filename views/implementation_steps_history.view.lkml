view: implementation_steps_history {
  sql_table_name: dbo.ImplementationSteps_History ;;

  dimension: created_by {
    type: string
    sql: ${TABLE}.CreatedBy ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreatedOn ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: history_id {
    type: number
    sql: ${TABLE}.HistoryId ;;
  }
  dimension: implementation_step_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ImplementationStepId ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: strategy_id {
    type: number
    sql: ${TABLE}.StrategyId ;;
  }
  dimension: tier_id {
    type: number
    sql: ${TABLE}.TierId ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: updated_by {
    type: string
    sql: ${TABLE}.UpdatedBy ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.UpdatedOn ;;
  }
  measure: count {
    type: count
    drill_fields: [name, implementation_steps.id, implementation_steps.name]
  }
}
