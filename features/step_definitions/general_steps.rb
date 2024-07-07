Given('arguments {int} and {int}') do |arg1, arg2|
  @arg1 = arg1
  @arg2 = arg2
end

When('they are added') do
  @sum = @arg1 + @arg2
end

Then('the sum should be {int}') do |int|
  assert_equal 42, @sum
end
