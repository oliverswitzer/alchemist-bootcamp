defmodule Todo do
  def start do
    filename = IO.gets("Name of .csv to load: ") |> String.trim
    read(filename)
      |> parse
      |> get_command
    # ask user for file name
    # open file and read
    # parse data
    # ask user for commands
    # (read todos, add todos, delete todos, load file, save file)
  end

  def get_command(data) do
    prompt = """
Type the first letter of the command you want to run
<> "R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a .csv    S)ave a .csv
"""
    command = IO.gets(prompt)
      |> String.trim
      |> String.downcase

    case command do
      "r"     -> show_todos(data)
      "d"     -> delete_todo(data)
      "q"     -> "Goodbye!"
      _       -> get_command(data)
    end
  end

  def read(filename) do
    case File.read(filename) do
      { :ok, body } -> body
      { :error, reason } -> IO.puts ~s(Could not open file "#{filename}")
                            IO.inspect ~s("#{:file.format_error reason}"\n)
                            start()
    end
  end

  def parse(data) do
    [header | lines] = String.split(data, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")

    parse_lines(lines, titles)
  end

  def parse_lines(lines, titles) do
    Enum.reduce(lines, %{}, fn line, acc ->
      [todo_name | todo_attributes] = String.split(line, ",")

      parsed_todo_attributes = Enum.zip(titles, todo_attributes) |> Enum.into(%{})

      Map.merge(acc, %{todo_name => parsed_todo_attributes})
    end)
  end

  def show_todos(data, next_command? \\ true) do
    items = Map.keys data
    IO.puts("You have the following Todos:\n")
    Enum.each items, fn item -> IO.puts item end
    IO.puts("\n")

    if next_command? do
      get_command(data)
    end
  end

  def delete_todo(data) do
    todo = IO.gets("Which todo would you like to delete?\n") |> String.trim

    if Map.has_key?(data, todo) do
      IO.puts "ok, deleting #{todo}}"
      new_map = Map.drop(data, [todo])
      IO.puts ~s{#{todo} has been deleted.}
      get_command(new_map)
    else
      IO.puts "There is no Todo named #{todo}"
      show_todos(data, false)
      delete_todo(data)
    end
  end
end
