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

(deftemplate disparador
    (slot codigo
        (type INTEGER)
        (default 1)
        (range 0 10000)
    )
)

(defrule mensaje
    (disparador (codigo ?codigo))
=>
    (assert (mensaje "hola mundo"))
)