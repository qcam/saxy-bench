defmodule SaxyBench.MixProject do
  use Mix.Project

  def project do
    [
      app: :saxy_bench,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:saxy, github: "qcam/saxy"},
      {:erlsom, "~> 1.4"},
      {:xml_builder, "~> 2.0"},
      {:exomler, github: "vkletsko/exomler"},
      {:meeseeks, github: "mischov/meeseeks"},
      {:benchee, ">= 0.0.0"}
    ]
  end
end
