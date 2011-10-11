Feature: Authentication

  Scenario: Manual authentication
    When I go to the register page
    And I fill in "user_email" with "testing@mormonizer.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Sign up"
    Then I should see "You are signed in as"
    And I should see "testing@mormonizer.com"

  Scenario: Automatic authentication
    Given I am a new, authenticated user
    Then I should see "You are signed in as"
    And I should see "testing@mormonizer.com"
