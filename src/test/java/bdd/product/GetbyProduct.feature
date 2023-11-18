Feature:Consultar un producto

  @getbyproduct

  Scenario Outline: obtener  producto especifico  <status> - <result>
    * def responselogin = call read("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responselogin.Authtoken
    * header Authorization = "Bearer "+token
    Given url urlBase
    And path "/api/v1/producto/"+ '<id>'
    When method get
    Then status <status>
    *  print response

    Examples:
      | id | codigo | nombre             | precio | stock | descripcion        | categoria | marca    | estado | status | result     |
      | 4  | PRO004 | AMORTIGUADOR PL135 | 95.00  | 46    | AMORTIGUADOR PL135 | Repuestos | Generico | 1      | 200    | exitoso    |
      | 00 | PRO003 | ALTERNADOR PL200NS | 35.00  | 48    | ALTERNADOR PL200NS | Repuestos | Generico | 3      | 404    | no exitoso |


    #And match response.id == <id>
    #And match response.codigo == '<codigo>'
    #And match response.nombre == '<nombre>'
    #And match response.precio == '<precio>'
    #And match response.stock == '<stock>'
    #And match response.descripcion == '<descripcion>'
    #And match response.categoria == '<categoria>'
    #And match response.marca == '<marca>'
    #And match response.estado == '<estado>'
