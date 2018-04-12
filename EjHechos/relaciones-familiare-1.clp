; Tipos de entidades
(deftemplate persona
   (slot dni)
   (multislot apellidos)
   (slot nombre)
)

;Tipos de relaciones
(deftemplate rf
  (slot nombre-relacion)
  (slot dni-1)
  (slot dni-2)
 )

; Instancias de entidades y de relaciones 
(deffacts personas
  (persona 
      (dni 1) 
      (apellidos Calvo-Cuenca)
      (nombre Antonio)
  )
    (persona 
      (dni 2) 
      (apellidos Calvo-Serrano)
      (nombre Antonio)
  )
 )
 
 (deffacts relaciones
   (rf 
      (nombre-relacion hijo-de)
      (dni-1 2)
      (dni-2 1)
   )
 )
 
 (deffacts objetivos
   (objetivo presentar-personas)
 )
 
; REPRESENTACIÓN DEL CONOCIMIENTO
;================================

;Crear una regla para que presente los datos de las personas por pantalla
(defrule presentacion
 ?ob <- (objetivo presentar-personas)
  (persona 
    (nombre ?n)
    (apellidos ?ap)
  )
  
 =>
 (printout t ?n "  " ?ap crlf)
 )
 
 

 ;Crear una regla para que presente los relaciones familiares de las personas por pantalla
(defrule presentacion-rf
  
  (rf (nombre-relacion ?t) (dni-1 ?dn1) (dni-2 ?dn-2) )
  (persona  (dni ?dn1) (nombre ?n1) (apellidos ?ap1)   )
  (persona  (dni ?dn2) (nombre ?n2) (apellidos ?ap2)   )
  (test (neq ?dn1 ?dn2))
 =>
 (printout t ?n1 " " ?ap1 "  es   " ?t  "  de " ?n2 " " ?ap2  crlf)
 (printout t ?dn1 " " ?dn2 crlf )
 )
 

; INFERIR OTRA RELACIÓN FAMILIAR DE AQUI 
;=======================================
; SI UNA PERSONA ES HIJA DE OTRA, ESTA OTRA ES PADRE DE LA PERSONA


