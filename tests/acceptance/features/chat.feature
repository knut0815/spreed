Feature: chat

  Scenario: send a message
    Given I am logged in
    And I have opened the Talk app
    And I create a group conversation
    And I see that the chat is shown in the main view
    When I send a new chat message with the text "Hello"
    Then I see that the message 1 was sent by "user0" with the text "Hello"

  Scenario: send several messages
    Given I am logged in
    And I have opened the Talk app
    And I create a group conversation
    And I see that the chat is shown in the main view
    When I send a new chat message with the text "Hello"
    And I send a new chat message with the text "World"
    And I send a new chat message with the text "How is it going?"
    Then I see that the message 1 was sent by "user0" with the text "Hello"
    And I see that the message 2 was sent with the text "World" and grouped with the previous one
    And I see that the message 3 was sent with the text "How is it going?" and grouped with the previous one

  Scenario: receive a message from another user when the conversation was not opened yet
    Given I act as John
    And I am logged in as the admin
    And I have opened the Talk app
    And I create a one-to-one conversation with "user0"
    And I see that the chat is shown in the main view
    And I send a new chat message with the text "Hello"
    When I act as Jane
    And I am logged in
    And I have opened the Talk app
    And I open the "admin" conversation
    And I see that the chat is shown in the main view
    Then I see that the message 1 was sent by "admin" with the text "Hello"

  Scenario: receive several messages from another user when the conversation was not opened yet
    Given I act as John
    And I am logged in as the admin
    And I have opened the Talk app
    And I create a one-to-one conversation with "user0"
    And I see that the chat is shown in the main view
    And I send a new chat message with the text "Hello"
    And I send a new chat message with the text "World"
    And I send a new chat message with the text "How is it going?"
    When I act as Jane
    And I am logged in
    And I have opened the Talk app
    And I open the "admin" conversation
    And I see that the chat is shown in the main view
    Then I see that the message 1 was sent by "admin" with the text "Hello"
    And I see that the message 2 was sent with the text "World" and grouped with the previous one
    And I see that the message 3 was sent with the text "How is it going?" and grouped with the previous one

  Scenario: receive a message from another user when the conversation is already open
    Given I act as John
    And I am logged in as the admin
    And I have opened the Talk app
    And I create a one-to-one conversation with "user0"
    And I see that the chat is shown in the main view
    And I act as Jane
    And I am logged in
    And I have opened the Talk app
    And I open the "admin" conversation
    And I see that the chat is shown in the main view
    When I act as John
    And I send a new chat message with the text "Hello"
    Then I act as Jane
    And I see that the message 1 was sent by "admin" with the text "Hello"

  Scenario: receive several messages from another user when the conversation is already open
    Given I act as John
    And I am logged in as the admin
    And I have opened the Talk app
    And I create a one-to-one conversation with "user0"
    And I see that the chat is shown in the main view
    And I act as Jane
    And I am logged in
    And I have opened the Talk app
    And I open the "admin" conversation
    And I see that the chat is shown in the main view
    When I act as John
    And I send a new chat message with the text "Hello"
    And I send a new chat message with the text "World"
    And I send a new chat message with the text "How is it going?"
    Then I act as Jane
    And I see that the message 1 was sent by "admin" with the text "Hello"
    And I see that the message 2 was sent with the text "World" and grouped with the previous one
    And I see that the message 3 was sent with the text "How is it going?" and grouped with the previous one

  Scenario: two users sending chat messages
    Given I act as John
    And I am logged in as the admin
    And I have opened the Talk app
    And I create a one-to-one conversation with "user0"
    And I see that the chat is shown in the main view
    And I act as Jane
    And I am logged in
    And I have opened the Talk app
    And I open the "admin" conversation
    And I see that the chat is shown in the main view
    When I act as John
    And I send a new chat message with the text "Hello"
    And I act as Jane
    And I send a new chat message with the text "Hi!"
    And I act as John
    And I send a new chat message with the text "How are you?"
    And I act as Jane
    And I send a new chat message with the text "Fine thanks"
    And I send a new chat message with the text "And you?"
    And I act as John
    And I send a new chat message with the text "Fine too!"
    Then I see that the message 1 was sent by "admin" with the text "Hello"
    And I see that the message 2 was sent by "user0" with the text "Hi!"
    And I see that the message 3 was sent by "admin" with the text "How are you?"
    And I see that the message 4 was sent by "user0" with the text "Fine thanks"
    And I see that the message 5 was sent with the text "And you?" and grouped with the previous one
    And I see that the message 6 was sent by "admin" with the text "Fine too!"
    And I act as Jane
    And I see that the message 1 was sent by "admin" with the text "Hello"
    And I see that the message 2 was sent by "user0" with the text "Hi!"
    And I see that the message 3 was sent by "admin" with the text "How are you?"
    And I see that the message 4 was sent by "user0" with the text "Fine thanks"
    And I see that the message 5 was sent with the text "And you?" and grouped with the previous one
    And I see that the message 6 was sent by "admin" with the text "Fine too!"
