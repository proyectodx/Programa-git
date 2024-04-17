<?php
    include("models/plazasDAO.php");
?>

<form method="post" id="formPlaza">
    

    <div class="disposicion">
        <section class="titulo-plaza">
            <h1>
                Gestionar plazas
            </h1>
        </section>
        <div id="options" class="plazas__agregadas" >
        <?php foreach ($resultados as $resultado) {?>
            <div class="plaza">
                <input type="text" class="plaza__input" name="option[]" placeholder="<?php echo $resultado['nomPlaza']; ?>">
                <button type="button" class="plaza__remove">Eliminar</button>
            </div>
        <?php }?>     
        </div>
    <aside class="lado-pazas">

            <h2 class="titulo-lado-clases"> 
                Agregar plasas
            </h2> 
            <article  class="agregar-seccion">
            
            <button type="button" id="add-option" class="plazas__add-option">
                Agregar plaza
            </button>

            <button type="submit" id="add-optio n" class="plazas__save-option">
                guardar plazas
            </button>
    </aside>
    <footer>

    </footer>
    </div>

</form>