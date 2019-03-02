Feature: PYLS configuration

  Background: Server initialized
    Given I have workspace folder "pyls"
    And I open file "pyls/test.py"
    And I call "lsp"
    Then the "pyls" status will become "initialized"

  Scenario: Server xref definitions
    Given I place the cursor after "print x"
    When I call "lsp-find-definition"
    Then the cursor should be before "x = 10"

  Scenario: Server xref references
    Given I place the cursor before "x = 10"
    When I select item "2" from the next xref call
    And I call "lsp-find-references"
    Then the cursor should be after "print "
