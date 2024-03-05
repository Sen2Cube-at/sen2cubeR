#' @importFrom httr2 request req_headers req_perform resp_body_json
#' @export

s2c_session_info = function() {
  token = s2c_login()
  request(
    base_url = paste0(
      getOption("s2c_auth_base_url"),
      getOption("s2c_userinfo_url")
    )
  ) |>
    req_headers(Authorization = paste("Bearer", token$access_token)) |>
    req_perform() |>
    resp_body_json()
}
