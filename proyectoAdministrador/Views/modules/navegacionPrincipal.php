
    <header class="encabezado-navegacion">
        <nav class="navegacion">
            <ul class="nav-menu-admin">
              
                
                <li class="nav-lista ">
                    <svg xmlns="http://www.w3.org/2000/svg" 
                    class="icon icon-tabler icon-tabler-accessible" 
                    width="24" height="24" viewBox="2 -8 35 35" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" /><path d="M10 16.5l2 -3l2 3m-2 -3v-2l3 -1m-6 0l3 1" /><circle cx="12" cy="7.5" r=".5" fill="currentColor" />
                    </svg>
                    <a class="active" aria-current="page" href="<?php echo SERVERURL; ?>administrador/plazasPincipal.php">Plazas</a>
                </li>

                

                

            </ul>

            <div class="div-lista">
                <a href="logo"  
                alt="logo de busqueda">
                    <svg class="icon icon-tabler icon-tabler-search" 
                    width="24" height="24" 
                    viewBox="2 -8 35 35" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                        <path d="M21 21l-6 -6" />
                    </svg>
                </a>
                <label>
                    <input class="busqueda" type="text">
                </label>
            </div>
            <div class="div-lista">
                <a class="active" aria-current="page" href="<?php echo SERVERURL; ?> administrador/salir.php">
                    <svg xmlns="http://www.w3.org/2000/svg" 
                    class="icon icon-tabler icon-tabler-logout" 
                    width="24" height="24" viewBox="2 -8 35 35" 
                    stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path d="M14 8v-2a2 2 0 0 0 -2 -2h-7a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2 -2v-2" />
                        <path d="M9 12h12l-3 -3" />
                        <path d="M18 15l3 -3" />
                    </svg>
                </a>
            </div>
        </nav>
    </header>