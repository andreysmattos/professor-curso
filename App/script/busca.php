<?php 

require_once "../../vendor/autoload.php";

use App\Classes\Busca;

$pesquisa = new Busca();


$pesquisa_get_curso = filter_input(INPUT_GET, 'pesquisa_curso', FILTER_SANITIZE_SPECIAL_CHARS);


$resultado = $pesquisa->busca_curso($pesquisa_get_curso);

$json = json_encode($resultado);

echo $json;

?>