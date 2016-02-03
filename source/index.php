<?php

  $compiler = include('compiler.php');
  $context = Timber::get_context();

  $context['posts'] = Timber::get_posts();
  $context['pagination'] = Timber::get_pagination();
  
  echo $compiler->render('index', $context);

?>
