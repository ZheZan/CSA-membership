Feature: No access
  

Background: users in database
  

  
Scenario: No access
  When I go to the User list page
  And I should see "You shoud have admin access to view this information"
