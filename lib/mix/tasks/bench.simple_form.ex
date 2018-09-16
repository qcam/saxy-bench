defmodule Mix.Tasks.Bench.SimpleForm do
  use Mix.Task

  def run(args) do
    case args do
      [] ->
        Mix.raise("file name must be provided")

      [filename] ->
        xml = File.read!("./samples/#{filename}.xml")
        xml_list = :erlang.binary_to_list(xml)

        Benchee.run(%{
          "saxy"    => fn -> {:ok, _} = Saxy.SimpleForm.parse_string(xml) end,
          "erlsom" => fn -> {:ok, _, _} = :erlsom.simple_form(xml) end,
          "exomler" => fn -> :exomler.decode(xml) end,
          "xmerl" => fn -> :xmerl_scan.string(xml_list) end,
          "meeseeks" => fn -> Meeseeks.parse(xml) end
        }, time: 10)
    end
  end
end
