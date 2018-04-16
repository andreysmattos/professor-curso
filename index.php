<?php
require_once "vendor/autoload.php";
?>

<!doctype html>
<html lang="pt-br">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/main.css">

	<title>Cursos e Professores!</title>
</head>
<body>
	
	<div class="container">
		<div class="row mag">
			<div class="col-md-2"></div>


			<div class="col-md-8">
				<input type="search" name="pesquisa_professor">
					<button type="submit" name="button" value="1">Pesquisar Professor</button>
				<form id="pesquisa">
					
					<br>
					<input type="search" name="pesquisa_curso">
					<button type="submit"  value="2" name="button">Pesquisar Curso</button>

				</form>

				<table class="table table-sm mag">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Professor</th>
							<th scope="col">Sexo</th>
							<th scope="col">Idade</th>
							<th scope="col" colspan="2">Curso</th>
						</tr>
					</thead>
					<tbody id="retorno">
						<tr>
							<th scope="row">0</th>
							<td> NULL </td>
							<td> NULL </td>
							<td> NULL </td>
							<td> NULL </td>
						</tr>

					</tbody>
				</table>

			</div>



			<div class="col-md-2"></div>
		</div>
	</div>


	

	<!-- Jquery -->
	<script src="assets/js/jquery.min.js"></script>

	<!-- Popper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

	<!-- Bootstrap JS -->
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Main -->
	<script src="assets/js/main.js"></script>

</body>
</html>