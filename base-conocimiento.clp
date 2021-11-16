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