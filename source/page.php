<?php

  $compiler = include('compiler.php');
  $context = Timber::get_context();

  $context['post'] = $post;

  echo $compiler->render('page', $context);

?>
