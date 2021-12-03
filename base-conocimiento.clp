(deftemplate area
    (slot codigo
        (type INTEGER)
    )
    (slot valor
        (type SYMBOL)
        (allowed-symbols TRUE FALSE none)
        (default none)
    )
)

(deftemplate pregunta-tema
    (slot descripcion
        (type STRING)
        (allowed-strings "construir" "computadoras" "geometria" "sociales" "culturas" "redaccion" "creativa" "historia" "investigar" "emprendedor" "negocio" "politica")
    )
    (slot valor
        (type SYMBOL)
        (allowed-symbols TRUE FALSE none)
        (default none)
    )
)

(deftemplate carrera-recomendada
    (slot descripcion
        (type STRING)
        (allowed-strings "computacion" "civil" "arquitectura" "contabilidad")
    )
)

(defrule gusta-humanidades
    (area (codigo ?codigo) (valor ?valor))
    (test
        (and
            (eq ?codigo 1)
            (eq ?valor TRUE)
        )
    )
=>
    (assert (pregunta-tema (descripcion "sociales")))
)

(defrule gusta-arte
    (area (codigo ?codigo) (valor ?valor))
    (test
        (and
            (eq ?codigo 2)
            (eq ?valor TRUE)
        )
    )
=>
    (assert (pregunta-tema (descripcion "creativa")))
)

(defrule gusta-administracion
    (area (codigo ?codigo) (valor ?valor))
    (test
        (and
            (eq ?codigo 3)
            (eq ?valor TRUE)
        )
    )
=>
    (assert (pregunta-tema (descripcion "emprendedor")))
)

(defrule gusta-biologia-quimica
    (area (codigo ?codigo) (valor ?valor))
    (test
        (and
            (eq ?codigo 4)
            (eq ?valor TRUE)
        )
    )
=>
    (assert (pregunta-tema (descripcion "")))
)

(defrule gusta-matematica
    (area (codigo ?codigo) (valor ?valor))
    (test
        (and
            (eq ?codigo 5)
            (eq ?valor TRUE)
        )
    )
=>
    (assert (pregunta-tema (descripcion "construir")))
)

; humanidades

(defrule validar-gusta-sociales
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "sociales")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (pregunta-tema (descripcion "culturas")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "redaccion")))
    )
)

; arte

(defrule validar-gusta-arte
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "creativa")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (pregunta-tema (descripcion "historia")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "investigar")))
    )
)

; administracion

(defrule validar-gusta-administracion
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "emprendedor")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (pregunta-tema (descripcion "negocio")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "politica")))
    )
)

; biologia - química

; matematica

(defrule validar-gusta-construir
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "construir")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (pregunta-tema (descripcion "computadoras")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "geometria")))
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
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "computacion")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "civil")))
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
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada(descripcion "arquitectura")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "contabilidad")))
    )
)