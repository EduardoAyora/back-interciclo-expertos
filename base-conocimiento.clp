(deftemplate archivo
    (slot codigo
        (type INTEGER)
        (default 1)
        (range 0 10000)
    )
    (slot texto
        (type STRING)
        (default ?DERIVE)
    )
)

(deftemplate pregunta-tema
    (slot descripcion
        (type STRING)
        (allowed-strings "construir" "computadoras" "geometria")
    )
    (slot valor
        (type symbol)
        (allowed-symbols true false none)
        (default none)
    )
)

(deftemplate carrera-recomendada
    (slot descripcion
        (type STRING)
        (allowed-strings "computacion" "civil" "arquitectura" "contabilidad")
    )
)

(defrule validar-gusta-construir
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "construir")
            (neq ?valor none)
        )
    )
=>
    (if 
        (test (eq ?valor true)) then
        (assert (pregunta-tema "computadoras"))
    )
    (if 
        (test (eq ?valor false)) then
        (assert (pregunta-tema "geometria"))
    )
)

(defrule validar-gusta-computadoras
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "computadoras")
            (neq ?valor none)
        )
    )
=>
    (if 
        (test (eq ?valor true)) then
        (assert (carrera-recomendada "computacion"))
    )
    (if 
        (test (eq ?valor false)) then
        (assert (carrera-recomendada "civil"))
    )
)

(defrule validar-gusta-geometria
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "geometria")
            (neq ?valor none)
        )
    )
=>
    (if 
        (test (eq ?valor true)) then
        (assert (carrera-recomendada "arquitectura"))
    )
    (if 
        (test (eq ?valor false)) then
        (assert (carrera-recomendada "contabilidad"))
    )
)