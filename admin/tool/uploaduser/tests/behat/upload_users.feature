@categotyroleassign @tool @tool_uploaduser @_file_upload
Feature: Upload users
  In order to add users to the system
  As an admin
  I need to upload files containing the users data

  @javascript
  Scenario: Upload users enrolling them on courses and groups
    Given the following "courses" exist:
      | fullname | shortname |
      | management1 | management1 |
    And the following "categories" exist:
      | fullname | shortname | idnumber |
      | MGMT | MGMT | 2 |
    And the following "roles" exist:
      | name | shortname |
      | Manager | manager |
      | Student | student |
    And I log in as "admin"
    And I navigate to "Users > Accounts >Upload users" in site administration
    When I upload "lib/tests/fixtures/upload_user_category.csv" file to "File" filemanager
    And I press "Upload users"
    Then I should see "Upload users preview"
    And I should see "Tom"
    And I should see "Jones"
    And I should see "verysecret"
    And I should see "jonest@example.com"
    And I should see "Reznor"
    And I should see "MGMT"
    And I should see "manager"
    And I should see "student"
    And I should see "management1"
    And I press "Upload users"
    And I press "Continue"
    And I navigate to "Users > Accounts > Browse list of users" in site administration
    And I should see "Tom Jones"
    And I should see "Trent Reznor"
    And I should see "reznor@example.com"
    And I am on "management1" course homepage
    And I navigate to "Participant" in current page administration
    And I should see "Tom" 
    And I should see "Reznor"