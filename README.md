# Handing Elixir Exceptions In Absinthe

This repo holds the sample code from [this blog bost](https://medium.com/p/9656a9108c2d)

## Usage

```elixir
iex(1)> Absinthe.run("{ div(a: 10, b: 5) }", CalcSchema)
{:ok, %{data: %{"div" => 2.0}}}

iex(2)> Absinthe.run("{ div(a: 10, b: 0) }", CalcSchema)
{:ok,
 %{data: %{"div" => nil},
   errors: [%{locations: [%{column: 0, line: 1}],
      message: "Illegal division by zero. Police have been dispatched to your location",
      path: ["div"]}]}}

iex(3)> Absinthe.run("{ magic_number }", CalcSchema)
{:ok, %{data: %{"magic_number" => 5}}}

iex(4)> Absinthe.run("{ div(a: 10, b: 0), magic_number }", CalcSchema)
{:ok,
 %{data: %{"div" => nil, "magic_number" => 2},
   errors: [%{locations: [%{column: 0, line: 1}],
      message: "Illegal division by zero. Police have been dispatched to your location",
      path: ["div"]}]}}
```
