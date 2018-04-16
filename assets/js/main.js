$(function(){

	$('#pesquisa').submit(function(){

		var campo = $(this).serialize();

		var pesquisa = $.ajax({
			method: 'get',
			url: 'App/script/busca.php',
			data: campo,
			dataType: 'json'
		});

		pesquisa.done(function(e){
			//console.log(e);
			var table = '';

			for(var k in e){

				table += '<tr><th scope="row">'+(k)+'</th>';
				table += '<td> '+ e[k].nome +' </td>';
				table += '<td> '+ e[k].sexo +' </td>';
				table += '<td> '+ e[k].idade +' </td>';
				table += '<td> '+ e[k].nome_curso +' </td>';
				table += '</tr>';
			}

			$('#retorno').html(table);

		});


		return false;
	});


});