require "test_helper"
require "phlex/testing/view_helper"

class TestBarComponent < Minitest::Test
  include Phlex::Testing::ViewHelper

  def test_renders_a_slotted_foo_component
    output = render(BarComponent.new)

    assert_equal(
      '<div class="foo view-component"><p class="foo-text">Hey</p><div class="foo-slot"><p>Hello from the slot</p></div></div>',
      output
    )
  end
end
