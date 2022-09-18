<?php 
  //Conexão com o banco
  $connect = mysqli_connect('localhost', 'root', '') or die("Conexão com o banco falhou");
  //função para selecionar o banco de dados
  mysqli_select_db($connect, 'aulabd') or die ("Conexão com a base de dados Falhou!");
  //Define o charset
  mysqli_set_charset($connect, 'utf8');

  //var_dump($connect);

  //Inserir um tipo

  
  //$sql = "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Frios')";
  //$sql = "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Roupa e Banho')";
  //Executar o comando
  //var_dump(mysqli_query($connect, $sql));
  /*
  if(mysqli_query($connect, $sql)){
    echo "Tipo de Produto Inserido";
  }else{
    echo "Erro ao inserir tipo de produto";
  }
  */


  $insert = [
    "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Frios')",
    "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Roupa e Banho')",
    "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Eletro')",
    "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Bebidas')",
    "INSERT INTO tipo_produto (descTipoProduto) VALUES ('Frutas e Cereais')",
  ];

  $qtd = count($insert);
  echo "<h5>Salvando $qtd Tipo(s) de produto</h5>";
  for($i = 0; $i < $qtd; $i++){
    if(mysqli_query($connect, $insert[$i])){
        echo "<code>Tipo de Produto Inserido</code><br>";
      }else{
        echo "<code>Erro ao inserir tipo de produto</code><br>";
      }
  }

  $insert = [
    "INSERT INTO produto (descProduto, qtdProduto, unProduto, valorProduto, idTipoProduto) VALUES ('Carne de Sol', 10, 'Kg', 40.00, 1)",
  ];

  $qtd = count($insert);
  echo "<h5>Salvando $qtd Produto(s)</h5>";
  for($i = 0; $i < $qtd; $i++){
    if(mysqli_query($connect, $insert[$i])){
        echo "<code>Produto Inserido</code><br>";
      }else{
        echo "<code>Erro ao inserir produto</code><br>";
      }
  }
  


