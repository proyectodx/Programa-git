<?php
    include("models/plazasDAO.php");
?>
<div class="disposicion">
    <section class="titulo-plaza">
        <h1>
            Gestionar plazas
        </h1>
        </section>
        <div id="options" class="plazas__agregadas" >
        <?php 
        if (isset($resultados)) {
            foreach ($resultados as $resultado) {?>
            <div class="plaza">
                <div>
                    <form action="" method="post" class="editar-plaza">
                    <input type="hidden" class="plaza__input" name="idPlaza" value="<?php echo $resultado['idPlaza'];?>">
                    <input type="text" class="plaza__input"  name="nombre_plaza" value="<?php echo $resultado['nomPlaza'];?>">
                    <input type="submit" class="plaza__editar" name="editar_plaza" value="Guardar cambios">
                    <a href="?id=<?php echo $resultado['idPlaza'];?>">
                    <button type="button"  class="plaza__remove">Eliminar</button>
                    </a>
                </form>
                </div>
                
            </div>
            <?php }
        }?>
        </div>
<form accept="" method="post" class="aside">
    <aside class="lado-pazas">

            <h2 class="titulo-lado-clases"> 
                Agregar plasas
            </h2> 

            <label for="from-plaza"> nombre plaza
                <input type="text"
                class="from-control"
                name="nombre_plaza"
                id="nombre_plaza"
                placeholder="Nombre de la plaza">
            </label>
            <article  class="agregar-seccion">
            
            <!--
            <button 
            type="button" 
            id="add-option" 
            class="plazas__add-option">
                Agregar plaza
            </button>-->

            <input 
            type="submit" 
            name="agregar_plaza" 
            id="agregar_plaza" 
            class="plazas__save-option"
            value="agergar plaza">
                
            
    </aside>
</form>
    <footer>

    </footer>
    </div>