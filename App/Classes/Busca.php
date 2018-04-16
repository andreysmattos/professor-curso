<?php 

namespace App\Classes;
use App\Banco\Banco;



class Busca 
{
	//private $pesquisa;
	private $db;

	public function __construct()
	{
		$this->db = Banco::connect();
	}


	public function busca_curso($pesquisa)
	{
		$sql = "SELECT p.nome, p.sexo, p.idade, c.nome as 'nome_curso'
		FROM `professor` as p
		INNER JOIN `professor_curso` as pc 
		ON p.idProfessor = pc.id_professor
		INNER JOIN `curso` as c
		ON c.idCurso = pc.id_curso
		WHERE c.nome LIKE :pesquisa";

		$stmt = $this->db->prepare($sql);

		$stmt->bindValue(':pesquisa', '%'.$pesquisa.'%', \PDO::PARAM_STR);

		$stmt->execute();

		//print_r($this->db->errorInfo());
		//print_r($stmt->errorInfo());
		$r = $stmt->fetchAll(\PDO::FETCH_ASSOC);

		return $r;

	}




//	termino dps
	public function busca_professor($pesquisa)
	{
		$sql = "SELECT p.nome, p.sexo, p.idade, c.nome as 'Nome do Curso'
		 FROM `professor` as p
		INNER JOIN `professor_curso` as pc 
		ON p.idProfessor = pc.id_professor
		INNER JOIN `curso` as c
		ON c.idCurso = pc.id_curso";
	}

	


}


?>