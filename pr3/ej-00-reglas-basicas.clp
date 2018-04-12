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
  (datos 1.0 azul "rojo")  (datos 1 azul)  (datos 1 azul rojo)  (datos 1 azul ROJO)  (datos 1 azul rojo 6.9))(defrule encontrar-datos 
    (datos ? azul rojo $?) => )
;For a total of 6 facts.;CLIPS> (agenda);0 encontrar-datos: f-5;0 encontrar-datos: f-3

;=============================================






Problema: Valorar el uso en los elemento condicionales patrón conectores lógicos


(deftemplate datos-B
  (slot valor)
)
(deffacts h1
(datos-A verde) ;Hecho ordenado(datos-A azul) ; Hecho definido a partir de una plantilla(datos-B (valor rojo))(datos-B (valor azul))
)

(defrule r1 (datos-A ~azul) => )(defrule r2 (datos-B (valor ~rojo&~verde)) => )(defrule r3 (datos-B (valor verde|rojo)) => )

 