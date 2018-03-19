Feature: user login
  
As a user,
So I can login
I should have a password

Background: users in database
  
  Given the following users exist:
  | name        | uin           | tel        | email                  |   membership  |  shirt  |  classification  |  dynasty |  password  | points|
  | Eddy        | 323006658     | 9795873517 |   njuyangyang@tamu.edu |   Yes         |    Yes  |  Graduate        |  Tang    |  234567    |   16  |

  
Scenario: User log in
  When I am on the User login page
  And I fill in "Eddy" for "session_name"
  And I fill in "session_uin" with "323006658"
  And I fill in "session_password" with "234567"
  And I press "Log in"
  And I should see "9795873517"
  And I should see "njuyangyang@tamu.edu"
  And I should see "323006658"
  And I should see "Tang"