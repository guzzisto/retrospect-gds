<?php
/**
 * Navigation Menu
 *
 * @copyright 	Keith Morrison, Infused Solutions	2001-2004
 * @author			Keith Morrison <keithm@infused-solutions.com>
 * @package 		theme_default
 * @license http://opensource.org/licenses/gpl-license.php
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License contained in the file GNU.txt for
 * more details.
 *
 * $Id$
 *
 */

	# main links
  $g_menu = '<div class="menu-title">'.gtc("Database").'</div>';
	$g_menu .= '<a href="'.Theme::GetArgs('search').'" title="'.gtc("Search the Database").'" class="menu-item">'.gtc("Search").'</a><br />';
	$g_menu .= '<a href="'.Theme::GetArgs('surnames').'" title="'.gtc("Surname List").'" class="menu-item">'.gtc("Surname List").'</a><br />';
  $g_menu .= '<a href="'.Theme::GetArgs('stats').'" title="'.gtc("Database Statistics").'" class="menu-item">'.gtc("Statistics").'</a><br />';
  $g_menu .= '<br />';

	# language selection
	if ($options->GetOption('allow_lang_change') != null AND is_array($g_langs)) {
		$g_menu .= '<div class="menu-title">'.gtc("Language").'</div>';
		$g_menu .= '<form name="form_change_lang" method="post" action="'.htmlentities(CURRENT_PAGE).'">';
		$g_menu .= '<select name="lang" size="1" class="listbox" id="lang" onchange="document.forms.form_change_lang.submit();">';
		foreach ($g_langs as $the_lang) {
			$code = $the_lang['lang_code'];
			$name = $the_lang['lang_name'];
			$g_menu .= '<option value="'.$code.'"';
			if ($_SESSION['lang'] == $code) {
				$g_menu .= ' selected="selected"';
			}
			$g_menu .= '>'.gtc($name).'</option>';
		}
		$g_menu .= '</select>';
		$g_menu .= '</form>';
	}
?>