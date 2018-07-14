defmodule Mix.Tasks.Bench.Encode.Simple do
  use Mix.Task

  def run(_args) do
    Benchee.run(%{
      "saxy" => fn ->
        saxy_document =
          Saxy.XML.element("root", [], [
            Saxy.XML.element("element1", [], []),
            Saxy.XML.element("element2", [], [
              Saxy.XML.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              Saxy.XML.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              Saxy.XML.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              Saxy.XML.element("element2x", %{a: "aaa", b: "bbb", c: "ccc &amp;"}, []),
              Saxy.XML.element("element2x", %{a: "aaa", b: "bbb", c: "ccc &amp;"}, []),
              Saxy.XML.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              Saxy.XML.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], [])
            ]),
            Saxy.XML.element("element3", [], []),
          ])
        Saxy.encode!(saxy_document)
      end,
      "xml_builder" => fn ->
        xml_builder_document =
          XmlBuilder.document("root", [], [
            XmlBuilder.element("element1", [], []),
            XmlBuilder.element("element2", [], [
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              XmlBuilder.element("element2x", %{a: "aaa", b: "bbb", c: "ccc &amp;"}, []),
              XmlBuilder.element("element2x", %{a: "aaa", b: "bbb", c: "ccc &amp;"}, []),
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], []),
              XmlBuilder.element("element2x", [a: "aaa", b: "bbb", c: "ccc &amp;"], [])
            ]),
            XmlBuilder.element("element3", [], []),
          ])
        XmlBuilder.generate(xml_builder_document, format: :none)
      end
    }, time: 5)
  end
end
