 view: car_by_grade {
    derived_table: {
      sql:
      SELECT
        GradeItemCode,
        SUM(CAST(GradeCurrentYearCAS AS FLOAT)) AS total_cas,
        SUM(CAST(GradeEnrollNumber AS FLOAT)) AS total_enrollment,
        SUM(CAST(GradeCurrentYearCAS AS FLOAT)) / NULLIF(SUM(CAST(GradeEnrollNumber AS FLOAT)), 0) AS car
      FROM dbo.AIP_DASHBOARD_TABLE
      WHERE SubPopItemCode = 'ALL'
      GROUP BY GradeItemCode
    ;;
    }

    dimension: grade_item_code {
      type: string
      sql: ${TABLE}.GradeItemCode ;;
    }

    dimension: car {
      type: number
      value_format_name: "percent_2"
      sql: ${TABLE}.car ;;
    }

    dimension: car_tier {
      type: string
      sql:
      CASE
        WHEN ${car} < 0.05 THEN 'Tier 1'
        WHEN ${car} < 0.10 THEN 'Tier 2'
        WHEN ${car} < 0.20 THEN 'Tier 3'
        WHEN ${car} >= 0.20 THEN 'Tier 4'
        ELSE 'Uncategorized'
      END ;;
    }

    measure: number_of_grades {
      type: count
    }

    measure: average_car {
      type: average
      sql: ${car} ;;
      value_format_name: "percent_2"
    }


  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: car_by_grade {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
