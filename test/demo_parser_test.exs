defmodule DemoParserTest do
  use ExUnit.Case
  doctest DemoParser

  test "greets the world" do
    assert DemoParser.hello() == :world
  end
end
