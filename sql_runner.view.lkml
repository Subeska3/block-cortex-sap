
view: sql_runner {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'data_intelligence_ar.Current_Date'
      
      
      SELECT
          (DATE("2024-01-14"))AS data_intelligence_ar_current_date_1
      FROM `lankatiles-cortex.CORTEX_SAP_REPORTING.AccountingDocumentsReceivable`
           AS data_intelligence_ar
      WHERE (data_intelligence_ar.Client_MANDT = "100" )
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: data_intelligence_ar_current_date_1 {
    type: date
    datatype: date
    sql: ${TABLE}.data_intelligence_ar_current_date_1 ;;
  }

  set: detail {
    fields: [
        data_intelligence_ar_current_date_1
    ]
  }
}
