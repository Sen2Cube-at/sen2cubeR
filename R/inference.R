#' @importFrom rrapply rrapply
#' @importFrom httr2 request req_headers req_perform resp_body_json
#' @export

s2c_inference_ls = function(n = 10) {
  token = s2c_login()
  inf_ls = request(
    paste0(
        getOption("s2c_api_base_url"),
        getOption("s2c_inf_ls_url"),
        as.character(n)
      )
    ) |>
    req_headers(Authorization = paste("Bearer", token$access_token)) |>
    req_perform() |>
    resp_body_json()

  inf_cols_def = c(
    "id",
    "attributes.factbase_id",
    "attributes.favourite",
    "attributes.knowledgebase_id",
    "attributes.owner",
    "attributes.qgis_project_location",
    "attributes.output",
    "attributes.status",
    "attributes.status_message",
    "attributes.status_progress",
    "attributes.status_timestamp",
    "attributes.temp_range_end",
    "attributes.temp_range_start",
    "attributes.timestamp_created",
    "attributes.timestamp_finished",
    "attributes.timestamp_started"
  )

  inf_df = rrapply(inf_ls$data, how = "bind")
  inf_df = inf_df[, inf_cols_def]
  colnames(inf_df) = sub("attributes.", "", colnames(inf_df))
  inf_df
}
