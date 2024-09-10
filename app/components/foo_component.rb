# frozen_string_literal: true

class FooComponent < ViewComponent::Base
  renders_one :foo_slot

  def initialize(text: "Hello from VC")
    @text = text
  end

  def call
    tag.div(class: "foo view-component") {
      concat(tag.p(@text, class: "foo-text"))
      concat(tag.div(foo_slot, class: "foo-slot")) if foo_slot?
    }
  end
end
