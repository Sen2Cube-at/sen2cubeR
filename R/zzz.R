.onLoad = function(libname, pkgname) {
  options(
    s2c_client_id="iq-web-client",
    s2c_auth_base_url="https://auth.sen2cube.at/realms/sen2cube-at/protocol/openid-connect",
    s2c_token_url="/token",
    s2c_userinfo_url="/userinfo",
    s2c_api_base_url="https://api.sen2cube.at/v1/",
    s2c_inf_ls_url="inference?page[size]="
  )
  invisible(NULL)
}
