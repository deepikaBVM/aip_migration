view: email_notifications {
  sql_table_name: dbo.EmailNotifications ;;
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
  dimension_group: email_schedule {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.EmailScheduleTime ;;
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
  dimension: notification_template_id {
    type: number
    sql: ${TABLE}.NotificationTemplateId ;;
  }
  dimension: reminder_count {
    type: number
    sql: ${TABLE}.ReminderCount ;;
  }
  dimension: retry_count {
    type: number
    sql: ${TABLE}.RetryCount ;;
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
    drill_fields: [id, entity_types.id, entity_types.name]
  }
}
