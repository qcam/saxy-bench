defmodule Mix.Tasks.Bench.Encode.Simple do
  use Mix.Task

  def run(_args) do
    xml_builder_document =
      XmlBuilder.document("root", [], [
        XmlBuilder.element("element1", [], []),
        XmlBuilder.element("element2", [], [
          XmlBuilder.element("element21", [], []),
          XmlBuilder.element("element22", [], []),
          XmlBuilder.element("element23", [], []),
          XmlBuilder.element("element24", [], []),
        ]),
        XmlBuilder.element("element3", [], []),
      ])

    saxy_document =
      Saxy.Builder.element("root", [], [
        Saxy.Builder.element("element1", [], []),
        Saxy.Builder.element("element2", [], [
          Saxy.Builder.element("element21", [], []),
          Saxy.Builder.element("element22", [], []),
          Saxy.Builder.element("element23", [], []),
          Saxy.Builder.element("element24", [], []),
        ]),
        Saxy.Builder.element("element3", [], []),
      ])

    Benchee.run(%{
      "saxy" => fn -> Saxy.encode!(saxy_document) end,
      "xml_builder" => fn -> XmlBuilder.generate(xml_builder_document) end
    }, time: 5)
  end
end
