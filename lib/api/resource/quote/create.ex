defmodule Api.Resource.Quote.Create do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      Quote.create(Input.get("text"))
    end

    affordance do
      %{
        "input" => %{
          "text" => %{
            "type" => "text",
            "required" => true
          }
        }
      }
    end
  end
end
