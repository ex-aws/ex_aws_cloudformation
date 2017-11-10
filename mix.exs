defmodule ExAws.Cloudformation.Mixfile do
  use Mix.Project

  @version "2.0.0"
  @service "cloudformation"
  @url "https://github.com/ex-aws/ex_aws_#{@service}"

  def project do
    [
      app: :ex_aws_cloudformation,
      version: @version,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      name: "ExAws.Cloudformation",
      package: package(),
      deps: deps(),
      docs: [main: "ExAws.Cloudformation", source_ref: "v#{@version}",
        source_url: @url]
    ]
  end

  defp package do
    [description: "ExAws.Cloudformation service package",
     files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Ben Wilson"],
     licenses: ["MIT"],
     links: %{github: @url},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib",]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:sweet_xml, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      ex_aws(),
    ]
  end

  defp ex_aws() do
    case System.get_env("AWS") do
      "LOCAL" -> {:ex_aws, path: "../ex_aws"}
      _ -> {:ex_aws, "~> 2.0.0"}
    end
  end
end
