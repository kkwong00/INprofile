<?php

/**
 * @file
 * Taxonomy implementations of the page title hooks
 */


/**
 * Implementation of hook_page_title_alter().
 */
function taxonomy_page_title_alter(&$title) {
  $menu_item = menu_get_item();
  // If we're looking at a taxonomy term page, get the term title.
  if ( !strncmp($menu_item['path'], 'taxonomy/term/%', 15) &&
       ($term = menu_get_object('taxonomy_term',2)) &&
       variable_get('page_title_vocab_'. $term->vid .'_showfield', 0) &&
       ($term_title = page_title_load_title($term->tid, 'term')) ) {
    $title = $term_title;
  }
}


/**
 * Implementation of hook_page_title_pattern_alter().
 */
function taxonomy_page_title_pattern_alter(&$pattern, &$types) {
  $menu_item = menu_get_item();

  // Taxonomy Term Page
  if ( !strncmp($menu_item['path'], 'taxonomy/term/%', 15) &&
       ($term = menu_get_object('taxonomy_term',2)) ) {
    $types['term'] = $term;
    $pattern = variable_get('page_title_vocab_'. $term->vid, '');
  }
}
