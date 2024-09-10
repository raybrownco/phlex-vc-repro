# Phlex VC Repro

This project is a mostly empty Rails app that reproduces an issue wherein a Phlex component cannot render a ViewComponent that contains a slot.

## Getting Started

Run the following commands to get set up.

```shell
gh repo clone raybrownco/phlex-vc-repro
cd phlex-vc-repro
bundle install
```

## Viewing the issue in the Browser

1. Run `rails s` and navigate to http://localhost:3000
2. Note that the following exception is present: `undefined method 'with_foo_slot' for an instance of BarComponent`

## Testing the issue

1. Run `bin/rails test`
2. Note that the VC tests pass
3. Note that the Phlex test fails

## Things to Consider

This issue is only present when Phlex is rendering a VC with a slot. If we render the VC without a slot, the issue goes away:

```diff
# app/views/components/bar_component.rb
class BarComponent < ApplicationComponent
  def view_template
-   render(FooComponent.new(text: "Hey")) { |foo|
-     foo.with_foo_slot {
-       tag.p("Hello from the slot")
-     }
-   }
+   render(FooComponent.new(text: "Hey"))
  end
end
```

Storing the VC instance in a variable prevents the exception, but also doesn't render the slot:

```diff
# app/views/components/bar_component.rb
class BarComponent < ApplicationComponent
  def view_template
-   render(FooComponent.new(text: "Hey")) { |foo|
-     foo.with_foo_slot {
-       tag.p("Hello from the slot")
-     }
-   }
+   component = FooComponent.new(text: "Hey") { |foo|
+     foo.with_foo_slot {
+       tag.p("Hello from the slot")
+     }
+   }
+
+   render(component)
  end
end
```