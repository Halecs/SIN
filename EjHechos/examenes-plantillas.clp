(deftemplate profesor
   (slot nombre)
   (slot apellidos)
   (slot dni)
)

(deftemplate alumno
   (slot nombre)
   (slot apellidos)
   (slot dni)
   (slot examen1)
   (slot examen2)
   (slot notaMedia)
   (slot notaTrabajo)
)

(deftemplate grupo
   (multislot dni)
   (slot trabajo)
   (slot nota)
)

(deffacts h1
  (profesor 
    (nombre Antonio)
    (apellidos Calvo)
    (dni 1)
  )
  (alumno 
    (nombre Juan)
    (apellidos Fernandez)
    (dni 21)
  )
  (alumno 
    (nombre Pedro)
    (apellidos Fernandez)
    (dni 211)
  )

  (objetivo presentar-alumnos)
  
 )
 
 (defrule r1
   (objetivo presentar-alumnos)
   (alumno
     (nombre ?n)
     (apellidos ?ap)
     (dni ?dni)
   )
  =>
  (printout t ?n "   " ?ap crlf)
 )
