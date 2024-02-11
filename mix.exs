defmodule Fonticode.MixProject do
  use Mix.Project

  def project do
    [
      app: :fonticode,
      version: "1.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: &docs/0,
      package: package(),
      source_url: "https://github.com/crertel/fonticode",
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
      {:credo, "~> 1.7.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Chris Ertel"],
      licenses: ["Public Domain (unlicense)"],
      links: %{"GitHub" => "https://github.com/crertel/fonticode"}
    ]
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])
    [source_ref: ref, main: "api-reference"]
  end
end
