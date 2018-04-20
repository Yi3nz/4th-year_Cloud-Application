require 'test_helper'

class UserNotifierMailerTest < ActionMailer::TestCase
  test "activation" do
    mail = UserNotifierMailer.activation
    assert_equal "Activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
