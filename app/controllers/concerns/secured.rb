module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in?
  end

  def logged_in?
    if Rails.env.development?
      development_logged_in
    else
      redirect_to '/auth/auth0' unless session[:userinfo].present?
      @user = session[:userinfo]
    end
  end

  def development_logged_in
    @user = TEST_USER.dup
  end

  TEST_USER = {
    "provider"=>"auth0",
    "uid"=>"auth0|1",
    "info" => {
      "name" =>"Han Solo",
      "nickname" => "Han",
      "email" => "han.solo@rebellion.com",
      "image" =>"https://vignette.wikia.nocookie.net/starwars/images/b/b7/HanSolo-Headshot-New.jpg/revision/latest?cb=20100806150756"
    },
    "credentials"=>{
      "token" =>"DEV_TOKEN",
      "expires_at" => 1562960802,
      "expires" => false,
      "id_token" =>"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IlF6SkZOalE0UlVZMk5rWkJOVUkzTnpsQk5EZzFSRFkzUVVGRU1rRkVOakZHUVVVM09UZEZOQSJ9.eyJuaWNrbmFtZSI6InVscmljaC5mcmVkcmljIiwibmFtZSI6InVscmljaC5mcmVkcmljQGdtYWlsLmNvbSIsInBpY3R1cmUiOiJodHRwczovL3MuZ3JhdmF0YXIuY29tL2F2YXRhci83ZDU5NjkyMzQ0MzYyMjZjZmQ0NTliNWFkODNiNGNjZj9zPTQ4MCZyPXBnJmQ9aHR0cHMlM0ElMkYlMkZjZG4uYXV0aDAuY29tJTJGYXZhdGFycyUyRnVsLnBuZyIsInVwZGF0ZWRfYXQiOiIyMDE5LTA3LTExVDE5OjQ2OjQxLjgxOVoiLCJpc3MiOiJodHRwczovL3JlbXVuZXJhdGlvbi1jYWxjdWxhdG9yLmF1dGgwLmNvbS8iLCJzdWIiOiJhdXRoMHw1Y2EwZTExNGMxN2M5MjEwY2Y0OTJiOGYiLCJhdWQiOiIzZUh6VXoxR3lzOWpQQ1dtZjFUOGoyOU1ucTBKdlpGWCIsImlhdCI6MTU2Mjg3NDQwMiwiZXhwIjoxNTYyOTEwNDAyfQ.gd44P6t0sLAJ605zIKor8-WvbMLrPSTeua2aUMwJOfp6GeOqpu4VlAvGjM4Yqt4EnO15jw0zFjUUsQ2HxpR_r9aJKuAtD-yOdqkO0GKYOyTuk2Mo60wwkxcDok43Y2Kl5zYZ0Z4Gp5Xt3ZOuYNHCWitYIAVJUrC5B4iH4e9q0I9ciROYFhn4pRdm0EkBtm1Dxn6WFBNMb12lZyan0mT-rZNfK2yz9I6egyjP7AnppU5d7CmicVxYhpOTLqynm0r2eg71b2uZBfnKzgeJb_-PF6-wF5IW3-t1bTxVgQvNoYDzYB7iENDg9D2MYvn15Cap9-l4JW029KpTGF3kuZMlKw",
      "token_type" => "Bearer",
      "refresh_token" => nil
    },
    "extra" => {
      "raw_info" => {
        "sub" => "auth0|1",
        "nickname" => "Han",
        "name" => "Han Solo",
        "picture" => "https://vignette.wikia.nocookie.net/starwars/images/b/b7/HanSolo-Headshot-New.jpg/revision/latest?cb=20100806150756",
        "updated_at"=>"2019-07-11T19:46:41.819Z"
      }
    }
  }
end
