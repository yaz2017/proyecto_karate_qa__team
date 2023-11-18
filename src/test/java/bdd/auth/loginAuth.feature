Feature:  Login de sesion

  @login
  Scenario Outline: Generar token exitoso
    Given url urlBase
    And path '/api/login'
    And header Accept = "application/json"
    And request {"email": "<email>","password": "<password>","nombre":"<name>","tipo_usuario_id":<id_usuario>,"estado": <estado>}
    When method post
    Then status 200
    * print response
    * def Authtoken = response.access_token
    * print Authtoken
    Examples:
      | name    | email             | password | estado | id_usuario |
      | yazmin | carlosz@gmail.com | 12345678 | 1      | 1          |

  Scenario Outline: Generar token no exitoso
    Given url urlBase
    And path '/api/login'
    And header Accept = "application/json"
    And request {"email": "<email>","password": "<password>","nombre":"<name>","tipo_usuario_id":<id_usuario>,"estado": <estado>}
    When method post
    Then status 401
    * print response

    Examples:
      | name   | email | password | estado | id_usuario |
      | yazmin | null  | 12345678 | 1      | 1          |