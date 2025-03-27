view: answers {
  sql_table_name: dbo.Answers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: answer {
    type: string
    sql: ${TABLE}.Answer ;;
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
  dimension: entity_id {
    type: number
    sql: ${TABLE}.EntityId ;;
  }
  dimension: entity_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EntityTypeId ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: plan_id {
    type: number
    sql: ${TABLE}.PlanId ;;
  }
  dimension: question_id {
    type: number
    sql: ${TABLE}.QuestionId ;;
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
    drill_fields: [id, entity_types.id, entity_types.name, answers_history.count]
  }
}
