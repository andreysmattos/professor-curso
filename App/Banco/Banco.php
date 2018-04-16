<?php 

namespace App\Banco;

class Banco
{
	public static function connect()
	{
		return new \PDO("mysql: host=localhost; dbname=curso_professor; charset=utf8", 'root', '');
	}
}


?>