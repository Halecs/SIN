;Ejemplo 1
;=========
(deftemplate dato
(slot w (default ?NONE))
(slot x (default ?DERIVE))
(slot y (default (gensym*)))
(slot z (default-dynamic (gensym*) )) )

(deffacts h2
  (dato
    (w 3)))

;======================================================

;Ejemplo 2
;=========
(deftemplate persona 
(slot nombre
   (type STRING)
   (default ?DERIVE)) 
(slot edad
  (type FLOAT) 
  (default (* 2.0 3.0))
  (range 0.0 100.0))
)

(deffacts datos
  (persona)
)



;======================================================
;Ejemplo 3
;=========

(deftemplate persona "Detalles de una persona"  
  (slot nombre (type STRING) (default ?NONE))  
  (slot apellidos (type STRING) (default ?NONE))  
  (slot edad (type INTEGER) (default 20)
    (range 1 130) )  
  (slot color-ojos (type SYMBOL) (default negro)
       (allowed-values negro gris marron verde azul))  
  (slot altura (type FLOAT) (default 1.65)
     (range 0.1 3.0) ) )
  
(deffacts h1 (persona (nombre "Isabel") 
           (apellidos "Perez Ramirez")
           (color-ojos verde) 
           (edad 21) 
           (altura 1.7) ) )
           
;======================================================
;Ejemplo 4
;=========
