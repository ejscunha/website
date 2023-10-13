defmodule PersonalWeb.PageHTML do
  use PersonalWeb, :html

  import PersonalWeb.Endpoint, only: [static_path: 1]

  embed_templates "page_html/*"
end
