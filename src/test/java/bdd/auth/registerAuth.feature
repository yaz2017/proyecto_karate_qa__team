Feature:  Registro del usuario

  @escenario
  Scenario Outline:  Crear los usuarios
    Given url urlBase
    And header Accept = "application/json"
    And path "/api/register"
    And request {"email": "<email>","password": "<password>","nombre":"<name>","tipo_usuario_id":<id_usuario>,"estado": <estado>}
    When method post
    Then status <status>
    * print response
    And match response.data.nombre == "<name>"
    And match response.data.email == "<email>"
    And match response.data.tipo_usuario_id == <id_usuario>
    And match response.data.estado == <estado>

    Examples:
      | name  | email             | password | estado | id_usuario | result     | status |
      | karla | karla05@gmail.com | 12345678 | 1      | 1          | Exitoso    | 200    |


  Scenario Outline:  Crear usuario no existe correo
    Given url urlBase
    And header Accept = "application/json"
    And path "/api/register"
    And request {"email": "<email>","password": "<password>","nombre":"<name>","tipo_usuario_id":<id_usuario>,"estado": <estado>}
    When method post
    Then status <status>
    * print response

    Examples:
      | name   | email | password | estado | id_usuario |  | status |
      | yazmin | Null  | 12323454 | 1      | 1          |  | 500    |