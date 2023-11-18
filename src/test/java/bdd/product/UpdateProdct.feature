Feature: Actualizar productos
  @putproduct
  Scenario: Actualizar  producto exitoso
    * def responselogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responselogin.Authtoken
    * header Authorization = "Bearer "+token
    * def id = 3
    Given url urlBase
    And path "/api/v1/producto/"+ id
    And request read("update.json")
    When method put
    Then status 200
    *  print response

  Scenario: Actualizar  producto no exista
    * def responselogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responselogin.Authtoken
    * header Authorization = "Bearer "+token
    * def id = 1000
    Given url urlBase
    And path "/api/v1/producto/"+ id
    And request read("update.json")
    When method put
    Then status 500
    *  print response

