<?php
/**
 * @file
 * Contextual links module integration.
 */

/**
 * Implements hook_custom_formatters_field_formatter_view_element_alter() on
 * behalf of contextual.module.
 *
 * Adds contextual links to Custom Formatter fields.
 */
function contextual_custom_formatters_field_formatter_view_element_alter(&$element, $formatter) {
  if (user_access('access contextual links') && user_access('administer custom formatters')) {
    $element[0] = array(
      'markup' => $element[0],
      'contextual_links' => array(
        '#type' => 'contextual_links',
        '#contextual_links' => array('custom_formatters' => array('admin/structure/formatters/list', array($formatter->name, 'edit'))),
        '#element' => $element[0],
      ),
      '#prefix' => '<div class="contextual-links-region">',
      '#suffix' => '</div>',
    );
  }
}

/**
 * Implements hook_menu_contextual_links_alter().
 */
function custom_formatters_menu_contextual_links_alter(&$links, $router_item, $root_path) {
  if ($root_path == 'admin/structure/formatters/list/%/edit') {
    $links['custom_formatters-edit'] = array_merge(
      $router_item,
      array(
        'title' => 'Edit formatter',
      )
    );
  }
}
