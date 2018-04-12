;tipos de entidades
  (deftemplate animal
    (slot nombre)
  )

(deftemplate famila-animal
   (slot nombre)
   
)

 
; tipos de interrelaciones

(deftemplate es-un
  (slot el-a)
  (slot el-b)
)

;hechos de familia de animales
(deffacts familias-animales
   (familia-animal (nombre roedor))
   (familia-animal (nombre felino))
    
)
(deffacts animales
   (animal (nombre rata))
   (animal (nombre ardilla))
   (animal (nombre tigre))
   (animal (nombre lince))
)

;hechos de relaciones

(deffacts relaciones
    (es-un
       (el-a rata) (el-b roedor)
    )
    (es-un
       (el-a tigre ) (el-b felino)
    )
)
    
 
