Feature: category name is blank when new

  In order to set the name of a category
  as an authorized user
  I want a new category name to be blank

  Scenario: a category name is blank
    Given a category
    When it is new
    Then name should be blank
