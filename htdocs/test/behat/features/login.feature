Feature: Homepage
  In order to test out the site
  As a site owner
  You receive a welcome message

  Scenario: Homepage
    Given I am not logged in
    When I visit "/"
    Then the response status code should be 200

  Scenario: Ensure the Login link is available for anonymous users.
    Given I am an anonymous user
    When I am on the homepage
    Then I should see an "input#edit-name" element
    And I should see an "input#edit-pass" element

  @api
  Scenario: Ensure as a logged in user, I can log out.
    Given I am logged in as a user with the "administrator" role
    When I click "Log out"
    Then I should be on the homepage
    And I should see "User login"

  Scenario: Submit connection
    Given I am on the homepage
    When I fill in "edit-name" with "admin"
    And I fill in "edit-pass" with "test"
    And press "Log in"
    Then I should see "Sorry, unrecognized username or password"
