view: plans {
  sql_table_name: dbo.Plans ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: is_active {
    type: string
    sql: ${TABLE}.IsActive ;;
  }
  dimension: is_certified {
    type: string
    sql: ${TABLE}.IsCertified ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: sbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.SBID ;;
  }
  dimension: school_district_id {
    type: number
    sql: ${TABLE}.SchoolDistrictId ;;
  }
  dimension: school_id {
    type: number
    sql: ${TABLE}.SchoolId ;;
  }
  dimension: school_year_id {
    type: number
    sql: ${TABLE}.SchoolYearId ;;
  }
  dimension: stage_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.StageTypeId ;;
  }
  dimension: status_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.StatusTypeId ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	stage_types.id,
	stage_types.name,
	status_types.id,
	status_types.name
	]
  }

}
