;Problema: Mostrar por pantalla un conjunto de comidas

;ELEMENTOS CONDICIONALES PATRÓN QUE USAN COMODINES
;Representación de la información mediante hechos ordenados

(deffacts hechos
  (comidas carne huevos pescado)
)
;Representación del conocimiento
(defrule r1
  (comidas $? ?x $?)
 =>
  (printout t ?x crlf)
) 

;============================================
;Problema: Ver cómo se activa la regla con un comodin multicampo

(deffacts hechos
  (datos 1.0 azul "rojo")
    (datos ? azul rojo $?) => )
;For a total of 6 facts.

;=============================================






Problema: Valorar el uso en los elemento condicionales patrón conectores lógicos


(deftemplate datos-B
  (slot valor)
)
(deffacts h1
(datos-A verde) ;Hecho ordenado
)

(defrule r1 (datos-A ~azul) => )

 