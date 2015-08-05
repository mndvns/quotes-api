defmodule Api.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use Api.Dispatch

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug Plug.Parsers, parsers: [:urlencoded, :json],
                     json_decoder: Poison
  plug :dispatch

  get     "/",                          Api.Resource.Root
  post    "/quotes",                    Api.Resource.Quote.Create

  match   _,                            Api.Resource.Error.NotFound
end
