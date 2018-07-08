defmodule Mix.Tasks.Bench.Encode.Nested do
  use Mix.Task

  def run(_args) do
    xml_builder_document =
      XmlBuilder.document(
        "level1",
        Enum.reduce(1000..2, "Finally we have some content", fn index, acc ->
          [XmlBuilder.element("level#{index}", acc)]
        end)
      )

    saxy_document =
      Enum.reduce(1000..1, "Finally we have some content", fn index, acc ->
        Saxy.Builder.element("level#{index}", [], acc)
      end)

    Benchee.run(%{
      "saxy" => fn -> Saxy.Encoder.encode(saxy_document) end,
      "xml_builder no format" => fn -> XmlBuilder.generate(xml_builder_document, format: :none) end,
      "xml_builder indented" => fn -> XmlBuilder.generate(xml_builder_document) end
    }, time: 5)
  end
end
