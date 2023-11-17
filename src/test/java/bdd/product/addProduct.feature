Feature: Ejemplos practicos Karate
    @CP07
    Scenario: Crear un post con docString en variable
    * def body = read('classpath:resources/json/auth/bodyLogin.json')
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request body
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1