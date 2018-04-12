;Ej.- 1
(clear) ;Módulo actual MAIN
;(focus A)


;Ej.- 2
(clear)

(defrule B::r1

EJ.- 3
(clear)
(reset)
(facts A)


Ej. 4

;(clear) ;Cuidado con las plantillas implícitas



Ej. 5

;(clear)
 
(defmodule B (import MAIN deftemplate initial-fact))

Ej. 6. Efecto de return

;(clear)
  (declare (salience 10))

 =>


;Ej. 7
;======
;CLIPS> (watch rules)
; Ojo que el programa no acaba nunca
;(clear) 
(deffacts DETECCION::d1
  (detecta 0))
(defrule DETECCION::detecta
  ?h1<- (detecta ?x)
  =>
  (printout t "Detecta " ?x crlf)
  (retract ?h1)
  (assert (detecta (+ 1 ?x) ))
  (return); Sale de este módulo DETECCION
  )
  








;Ejercicio de control de módulos
;===============================

;MODULO MAIN
(defmodule MAIN (export ?ALL))
(deftemplate 	MAIN::datos
   (slot x)
   (slot y)
)
(deffacts MAIN::hechos
   (datos (x 3) (y 4))
)

(defrule MAIN::inicio 
     =>
     (printout t "Foco en MAIN" crlf)
     (focus SUMA PRODUCTO )
) 

(defrule pedir-x
   (not (x ?))
 =>
    (printout t "Entrar x: ")
   (assert (x (read)))
   (printout t " : " crlf)
)

(defrule pedir-y

   (not (y ?))
 =>
   (printout t "Entrar y: ")
   (assert (y (read)))
   (printout t " : " crlf)
   (assert (objetivo rellenar))
)



(defrule rellenar-datos
  (declare (salience 1))
 ?h1<- (x ?x)
  ?h2<-(y ?y)
  ?h3<-(objetivo rellenar)
 ?h<- (datos (x ?) (y ?))
  =>
  ;(retract ?h1 ?h2)
  (retract ?h3)
  (modify ?h (x ?x) (y ?y))
  )

(defrule MAIN::fin
    (declare (salience -2)) 
     =>
     (printout t "Programa finalizado" crlf)

) 
;MODULO SUMA
(defmodule SUMA (import MAIN deftemplate datos initial-fact))

(defrule SUMA::suma
 (datos 
  (x ?x)
  (y ?y))
 
 =>
 (printout t "Foco en A" crlf)
 (assert (suma (+ ?x ?y)))
 ;(return) ;Probar cómo se abandona el módulo
)

(defrule SUMA::presentarSuma
   (suma ?s)
=>

(printout t "suma: " ?s crlf)
)
;==========================================================================


;MODULO PRODUCTO
(defmodule PRODUCTO (import MAIN deftemplate datos ))

(defrule PRODUCTO::producto
 (datos
  (x ?x)
  (y ?y))
 
    =>
   (printout t "Foco en PRODUCTO" crlf)
   (assert (producto (* ?x ?y)))
)

(defrule PRODUCTO::presentarProducto
   (producto ?p)
=>

(printout t "producto: " ?p crlf)

)

;=========================================================================






;=========================================================================

;Ejemplo de forall

;Problema de diagnostico
;Dadas la siguiente plantilla y hechos obtener una regla que diagnostique
; las enfermedades


(deftemplate enfermedad
(slot nombre)
(multislot siempre)
(multislot a-veces))

(deffacts enfermedades
(enfermedad (nombre gripe) (siempre congestion fiebre) (a-veces tos dolor-cabeza dolor-huesos))
(enfermedad (nombre varicela) (siempre ronchas fiebre) (a-veces vomitos mareos))
(enfermedad (nombre tifus) (siempre diarrea fiebre) (a-veces dolor-cabeza delirios))
(enfermedad (nombre gastroenteritis) (siempre diarrea fiebre) (a-veces dolor-huesos))
(enfermedad (nombre resfriado) (siempre congestion) (a-veces dolor-cabeza tos)))

(deffacts caso
(sintoma diarrea)
(sintoma fiebre)
(sintoma delirios)
)

(defrule posible-enfermedad
(enfermedad (nombre ?n))
(forall (sintoma ?s) ;Todo síntoma del caso debe de estar en siempre o en a-veces
(or (enfermedad (nombre ?n) (siempre $? ?s $?))
(enfermedad (nombre ?n) (a-veces $? ?s $?)))
                )
(forall ;Toda enfermedad debe de tener todos los sintomas siempre en el caso
                (enfermedad (nombre ?n) (siempre $? ?si $?))
                (sintoma ?si)

)
=>
(printout t    "Podría tratarse de " ?n  crlf))