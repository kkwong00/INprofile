<?php
/**
 * @file
 * test.features.user_role.inc
 */

/**
 * Implementation of hook_user_default_roles().
 */
function test_user_default_roles() {
  $roles = array();

  // Exported role: admin
  $roles['admin'] = array(
    'name' => 'admin',
    'weight' => '3',
  );

  // Exported role: administrator
  $roles['administrator'] = array(
    'name' => 'administrator',
    'weight' => '2',
  );

  // Exported role: editor
  $roles['editor'] = array(
    'name' => 'editor',
    'weight' => '4',
  );

  return $roles;
}
