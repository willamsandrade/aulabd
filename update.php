<?php 
  //Conexão com o banco
  $connect = mysqli_connect('localhost', 'root', '') or die("Conexão com o banco falhou");
  //função para selecionar o banco de dados
  mysqli_select_db($connect, 'aulabd') or die ("Conexão com a base de dados Falhou!");
  //Define o charset
  mysqli_set_charset($connect, 'utf8');