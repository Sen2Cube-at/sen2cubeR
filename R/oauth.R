#' @importFrom httr2 oauth_client
#' @export
#'
sen2cube_client = function() {
  oauth_client(
    id = getOption("s2c_client_id"),
    token_url = paste0(
      getOption("s2c_auth_base_url"),
      getOption("s2c_token_url")
    ),
    name = "sen2cubeR"
  )
}

#' @importFrom httr2 oauth_flow_password
#' @export
s2c_login = function(username = Sys.getenv("S2C_USERNAME"),
                     password = Sys.getenv("S2C_PASSWORD")) {
  oauth_flow_password(
    client = sen2cube_client(),
    username = username,
    password = password
  )
}
