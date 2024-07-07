# Cucumber and `Minitest` with and without Bundler

The simplest code example I could come up with that shows the behaviour I don't understand yet.


## Local set up

| Program | Version |
|---------|---------|
| ruby    | 3.3.3   |
| bundler | 2.5.14  |
| gem     | 3.5.14  |

### Prepare running the commands

I updated the current version of all the gems my system, including rubygems isteslf and bundler

```bash
> gem update --system && gem update && bundle install

Latest version already installed. Done.
Updating installed gems
Nothing to update
Bundle complete! 2 Gemfile dependencies, 17 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.```
```

Checked the versions: 

```bash
> gem -v
3.5.14
> bundler -v
Bundler version 2.5.14
```

## *With* Bundler

```bash
 > bundle exec cucumber
Using the default profile...
Feature: Contrived Examples

  Scenario: Add stuff         # features/gives_cucumber_somthing_to_run.feature:3
    Given arguments 40 and 2  # features/step_definitions/general_steps.rb:1
    When they are added       # features/step_definitions/general_steps.rb:6
    Then the sum should be 42 # features/step_definitions/general_steps.rb:10

1 scenario (1 passed)
3 steps (3 passed)
0m0.003s
```

All is good.

## *Without* Bundler

```bash
> cucumber
Using the default profile...
Feature: Contrived Examples

  Scenario: Add stuff         # features/gives_cucumber_somthing_to_run.feature:3
    Given arguments 40 and 2  # features/step_definitions/general_steps.rb:1
    When they are added       # features/step_definitions/general_steps.rb:6
    Then the sum should be 42 # features/step_definitions/general_steps.rb:10
      undefined method `assert_equal' for #<MinitestWorld:0x000000012aac1608> (NoMethodError)
      ./features/step_definitions/general_steps.rb:11:in `"the sum should be {int}"'
      features/gives_cucumber_somthing_to_run.feature:6:in `the sum should be 42'

Failing Scenarios:
cucumber features/gives_cucumber_somthing_to_run.feature:3 # Scenario: Add stuff

1 scenario (1 failed)
3 steps (1 failed, 2 passed)
0m0.050s
```

I don't understand why I get the `NoMethodError` in this case.
