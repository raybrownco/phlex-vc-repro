# frozen_string_literal: true

require "test_helper"

class FooComponentTest < ViewComponent::TestCase
  test "renders_with_default_text" do
    render_inline(FooComponent.new)

    assert_component_rendered
    assert_selector(".foo.view-component")
    assert_selector(".foo-text", text: "Hello from VC")
  end

  test "renders_with_custom_text" do
    render_inline(FooComponent.new(text: "Hey from VC"))

    assert_selector(".foo-text", text: "Hey from VC")
  end

  test "renders_with_slot_content" do
    component = FooComponent.new.tap { |foo|
      foo.with_foo_slot { "Slot stuff" }
    }

    render_inline(component)

    assert_selector(".foo-text", text: "Hello from VC")
    assert_selector(".foo-slot", text: "Slot stuff")
  end

  test "renders_with_custom_text_and_slot_content" do
    component = FooComponent.new(text: "Hey from VC").tap { |foo|
      foo.with_foo_slot { "Slot stuff" }
    }

    render_inline(component)

    assert_selector(".foo-text", text: "Hey from VC")
    assert_selector(".foo-slot", text: "Slot stuff")
  end
end
