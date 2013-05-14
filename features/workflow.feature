Feature: Use my ideas as inputs for new ideas
  In order to generate more inspiration, more ideas
  As a writer
  I want confront randomly my different ideas

  Scenario: Enter a new idea
    Given I am a connected user
    And I have no idea
    When I visit my main page
    And I fill in "Nouvelle idée" with "Une machine à oublier (oublier des films, des livres, etc...)"
    And I press "Ajouter"
    Then I should have 1 idea

  Scenario: Confront my ideas : generate new inspiration
    Given I am a connected user
    And I have 10 different ideas in my box
    When I visit my main page
    Then I should see 2 of my ideas
