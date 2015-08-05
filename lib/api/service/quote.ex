defmodule Api.Service.Quote do
  quotes = "priv/quotes.json"
  |> File.read!
  |> Poison.decode!

  def start do
    :ets.new(:quotes, [:set, :public, :named_table, {:read_concurrency, true}])
    for quote <- unquote(quotes) do
      create(quote)
    end
  end

  def create(quote) do
    :ets.insert(:quotes, {quote})
    {:ok, true}
  end

  def get do
    :random.seed(:os.timestamp)
    quotes = :ets.tab2list(:quotes)
    {item} = random quotes
    {:ok, item}
  end

  def random(list) do
    :lists.nth(:random.uniform(length(list)), list)
  end
end
