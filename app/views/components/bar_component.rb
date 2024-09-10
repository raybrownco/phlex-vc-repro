# frozen_string_literal: true

class BarComponent < ApplicationComponent
  def view_template
    render(FooComponent.new(text: "Hey")) { |foo|
      foo.with_foo_slot {
        tag.p("Hello from the slot")
      }
    }
  end
end
