defmodule SafeResolver do
  def safely(fun) do
    fn parent, args, resolution -> 
      try do
        fun.(parent, args, resolution)
      rescue
        e -> {:error, Exception.message(e)}
      end
    end
  end
end
