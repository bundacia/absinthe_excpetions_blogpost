defmodule CalcSchema do
  use Absinthe.Schema

  import SafeResolver

  query do
    field :div, :integer do
      arg :a, :integer
      arg :b, :integer

      resolve safely(fn _, args, _ -> 
        divide(args.a, args.b) 
      end)
    end

    field :magic_number, :integer do
      resolve safely(fn _, _, _ -> 
        {:ok, Enum.random(0..10)}
        # Uncomment the following to see error behavior 
        # raise "The Magic is Gone!!"
      end)
    end
  end

  def divide(_, 0) do
    {
      :error, 
      "Illegal division by zero. Police have been dispatched to your location"
    }
  end

  def divide(a, b) do
    {:ok, a / b}
  end

end
