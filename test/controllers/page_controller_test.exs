defmodule BasicCrud.PageControllerTest do
  use BasicCrud.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
