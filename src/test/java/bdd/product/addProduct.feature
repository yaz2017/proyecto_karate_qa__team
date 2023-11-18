Feature: Agregar producto
        Background:
      * def responselogin = call read("classpath:bdd/auth/loginAuth.feature@login")
        * def token = responselogin.Authtoken
        * header Authorization = "Bearer "+token
        * header Accept = "application/json"
    @Addproducto
    Scenario Outline: Agregar producto nuevo
        Given url urlBase
        And path "/api/v1/producto"
        And request {"codigo": "#(codigo)","nombre": "#(nombre)","medida": "#(medida)","marca": "#(marca)","categoria": "#(categoria)","precio": "#(precio)","stock": "#(stock)","estado": "#(estado)","descripcion": "#(descripcion)"}
        When method post
        Then status 200
        * print response
        And match response.codigo == "#(codigo)"
        And match response.nombre == "#(nombre)"
        And match response.medida == "#(medida)"
        And match response.precio == "#(precio)"
        And match response.stock == "#(stock)"
        And match response.estado == "#(estado)"
        And match response.descripcion == "#(descripcion)"

        Examples:
            |read('product.csv')|

    Scenario Outline: Producto duplicado
        Given url urlBase
        And path "/api/v1/producto"
        And request {"codigo": "#(codigo)","nombre": "#(nombre)","medida": "#(medida)","marca": "#(marca)","categoria": "#(categoria)","precio": "#(precio)","stock": "#(stock)","estado": "#(estado)","descripcion": "#(descripcion)"}
        When method post
        Then status 500
        * print response
        Examples:
            |read('product.csv')|

    Scenario Outline: Producto no trae la marca del producto
        Given url urlBase
        And path "/api/v1/producto"
        And request {"codigo":"#(codigo)","nombre": "#(nombre)","medida": "#(medida)","categoria": "#(categoria)","precio": "#(precio)","stock": "#(stock)","estado": "#(estado)","descripcion": "#(descripcion)"}
        When method post
        Then status 500
        * print response
        Examples:
            |read('product.csv')|

    Scenario Outline: PEl codigo es requerido cuando se deja vacío
        Given url urlBase
        And path "/api/v1/producto"
        And request {"codigo":"#(codigo)","nombre": "#(nombre)","medida": "#(medida)","marca": "#(marca)","categoria": "#(categoria)","precio": "#(precio)","stock": "#(stock)","estado": "#(estado)","descripcion": "#(descripcion)"}
        When method post
        Then status 500
        * print response

        Examples:
            |read('producterror.csv')|
