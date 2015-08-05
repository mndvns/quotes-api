defmodule Api.Dispatch do
  use Mazurka.Dispatch
  alias Api.Service

  service Quote.get/0, Service.Quote.get()
  service Quote.create/1, Service.Quote.create(&1)
end
