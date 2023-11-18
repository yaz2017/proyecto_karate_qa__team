Feature: Consultar todos los productos
  @getproducto
  Scenario: Consulta lista de todos productos
    * def responselogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responselogin.Authtoken
    * header Authorization = "Bearer "+token
    Given url urlBase
    And path "/api/v1/producto/"
    When method get
    Then status 200
    * print response