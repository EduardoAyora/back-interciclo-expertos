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
        (allowed-strings "construir" "computadoras" "mdiseno" "sociales" "culturas" "redaccion" "creativa" "historia" "investigar" "emprendedor" "negocio" "politica" "cientifica" "energia" "enfermedad")
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
        (allowed-strings "computacion" "civil" "arquitectura" "contabilidad" "antropologia" "filosofia" "comunicacion" "psicologia" "artes" "diseno" "arqueologia" "filologia" "empresas" "contabilidad" "economista" "ingcomercial" "cquimica" "biologia" "medicina" "bioquimica")
    )
)

; areas generales

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
    (assert (pregunta-tema (descripcion "cientifica")))
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

(defrule validar-gusta-culturas
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "culturas")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "antropologia")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "filosofia")))
    )
)

(defrule validar-gusta-redaccion
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "redaccion")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "comunicacion")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "psicologia")))
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

(defrule validar-gusta-historia
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "historia")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "artes")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "diseno")))
    )
)

(defrule validar-gusta-investigar
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "investigar")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "arqueologia")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "filologia")))
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

(defrule validar-gusta-negocio
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "negocio")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "empresas")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "contabilidad")))
    )
)

(defrule validar-gusta-politica
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "politica")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "economista")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "ingcomercial")))
    )
)

; biologia - química

(defrule validar-gusta-cientifica
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "cientifica")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (pregunta-tema (descripcion "energia")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "enfermedad")))
    )
)

(defrule validar-gusta-energia
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "energia")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "cquimica")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "biologia")))
    )
)

(defrule validar-gusta-enfermedad
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "enfermedad")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada (descripcion "medicina")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "bioquimica")))
    )
)

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
        (assert (pregunta-tema (descripcion "mdiseno")))
    )
    (if (eq ?valor FALSE) then
        (assert (pregunta-tema (descripcion "computadoras")))
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
        (assert (carrera-recomendada (descripcion "contabilidad")))
    )
)

(defrule validar-gusta-mdiseno
    (pregunta-tema (descripcion ?descripcion) (valor ?valor))
    (test
        (and
            (eq ?descripcion "mdiseno")
            (neq ?valor none)
        )
    )
=>
    (if (eq ?valor TRUE) then
        (assert (carrera-recomendada(descripcion "arquitectura")))
    )
    (if (eq ?valor FALSE) then
        (assert (carrera-recomendada (descripcion "civil")))
    )
)