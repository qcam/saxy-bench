defmodule Mix.Tasks.Bench.Encode.Long do
  use Mix.Task

  def run(_args) do
    long_content = String.duplicate("1234567890 &abcdefẩ<>\"", 1000)

    Benchee.run(%{
      "saxy" => fn ->
        saxy_document = Saxy.XML.element(
          "root",
          [],
          Saxy.XML.element("data", [], long_content)
        )
        Saxy.encode!(saxy_document)
      end,
      "xml_builder no format" => fn ->
        xml_builder_document =
          XmlBuilder.document(
            "root",
            [XmlBuilder.element("data", long_content)]
          )
        XmlBuilder.generate(xml_builder_document, format: :none)
      end,
      "xml_builder indented" => fn ->
        xml_builder_document =
          XmlBuilder.document(
            "root",
            [XmlBuilder.element("data", long_content)]
          )
        XmlBuilder.generate(xml_builder_document)
      end
    }, time: 5)
  end
end
