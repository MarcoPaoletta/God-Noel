# God Noel
* Juego de Papa Noel estilo navidad con gravedad del juego [VVVVVV](https://thelettervsixtim.es)
* Hay que tocar en la pantalla para invertir la gravedad y de esa manera irnos hacia el otro extremo de la pared
* En el camino nos iremos encontrando con tuberias, con las que si chocamos perdemos, y galletas las cuales son un simple objeto coleccionable
* Parte del arte, como las tuberias, fondo, suelo de hielo, galletas, entre otras cosas, son de diseño propio

---
# Invertir la gravedad como VVVVVV
*SCRIPT DEL JUGADOR*
```gdscript
	if Input.is_action_just_pressed("click") and global.player_state == "playing":
		$move.play()
		gravity *= -1
		match gravity:
			100:
				$animated_sprite.flip_v = false
			-100:
				$animated_sprite.flip_v = true
```
* Si se presiona en la pantalla y el estado del jugador es que esta jugando, reproducimos un sonido e invertimos la gravedad
* Dependiendo de la gravedad, es decir, si estamos en la parte de arriba o abajo de la pared, invertimos el sprite

```gdscript
	if global.player_state == "playing":
		velocity.y += gravity
		velocity = move_and_slide(velocity, Vector2.UP)
```
* Si el estado del jugador es que esta jugando, le sumamos a la velocidad del eje y la gravedad. Si esta es positiva, el personaje va hacia abajo y caso contrario el personaje va hacia arriba
* Movemos al jugador 

---
# Descargar Godot Engine e importar el proyecto
---

## Descargar Godot Engine

* Accedemos al sitio oficial de [Godot Engine](https://godotengine.org/download) en la parte de descargas
* Seleccionamos nuestro sistema operativo
* Descargamos la **Standard version**
* Extraemos el archivo comprimido
* Esto nos dejara el ejecutable de Godot Engine

---

## Importar el proyecto

* Una vez descargado los archivos del proyecto, movemos la carpeta a una ruta de preferencia
* Abrimos Godot Engine y en la parte de la derecha buscamos el boton **Import** o **Importar**
* Escribimos la ruta del proyecto o buscamos manualmente en la carpeta del proyecto el archivo project.godot 
* Nos abrira el projecto y podremos ejecutarlo desde ahi tocando **F5** o en la parte superior derecha con el boton de play