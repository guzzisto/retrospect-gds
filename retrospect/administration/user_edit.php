<link href="styles.css" rel="stylesheet" type="text/css">
<form name="user_add_form" method="post" action="">
<table width="100%" border="0" cellpadding="0" cellspacing="5">
  <tr>
    <td colspan="2" align="left" valign="top">&nbsp;</td>
  </tr>
	<?php 
		if (isset($_POST['Save'])) {
			echo '<tr><td class="notification">';
			# validate values
			$form_error = false;
			
			if ($_POST['username'] == '' or $_POST['fullname'] =='' or $_POST['email'] == '') { 
				echo _("All fields are required.  Please correct the error.").'<br />';
				$form_error = true;
			}
			if ($_POST['password1'] != $_POST['password2']) {
				echo _("Both password fields must be the same.  Please re-type them.").'<br />'; 
				$form_error = true;
			}
			if ($form_error != true) { 
				$result = Auth::UpdateUser($_POST['id'], $_POST['username'], $_POST['fullname'], $_POST['email'], $_POST['password1']);
				if ($result == true) {
					echo sprintf(_("User %s was successfully modified."), $_POST['username']).' ';
					redirect_j($_SERVER['PHP_SELF'].'?option=user_list', 2);
				}
				else {
					echo sprintf(_("User %s was not modified."), $_POST['username']).' ';
					redirect_j($_SERVER['PHP_SELF'].'?option=user_list', 2);
				}
			}
			echo '</td></tr>';
			echo '<tr><td>&nbsp;</td></tr>';
		}
		elseif (isset($_POST['Delete'])) {
			$uid = $_POST['username'];
			$sql = "DELETE FROM $g_tbl_user WHERE uid='$uid'";
			db_query_n($sql);
			echo '<tr><td class="notification">';
			echo sprintf(_("User %s was deleted."), $_POST['username']).' ';
			redirect_j($_SERVER['PHP_SELF'].'?option=user_list', 2);
			echo '</td></tr>';
			echo '<tr><td>&nbsp;</td></tr>';
		}
		else {
			$id = $_GET['id'];
			$sql = "SELECT * FROM $g_tbl_user WHERE id='$id'";
			$result = db_query_r($sql);
			$u = mysql_fetch_array($result);
		//}
	?>
  <tr>
    <td colspan="2" class="content-subtitle"><?php echo _("Add User"); ?>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#CCCCCC"><table border="0" cellpadding="4" cellspacing="0">
      <tr>
        <td width="200" class="content-label"><?php echo _("Username"); ?>:<br>          </td>
        <td>
					<input name="username" type="text" class="textbox" id="username" size="40" maxlength="40" value="<?php echo stripslashes($u['uid']); ?>">
				</td>
      </tr>
      <tr>
        <td class="content-label"><?php echo _("Full Name"); ?>: </td>
        <td>
					<input name="fullname" type="text" class="textbox" id="fullname" size="40" maxlength="40" value="<?php echo stripslashes($u['fullname']); ?>">
				</td>
      </tr>
      <tr>
        <td class="content-label"><?php echo _("Email Address"); ?>: </td>
        <td>
					<input name="email" type="text" class="textbox" id="email" size="40" maxlength="40" value="<?php echo stripslashes($u['email']); ?>">
				</td>
      </tr>
      <tr>
        <td class="content-label"><?php echo _("New Password"); ?>:<br></td>
        <td class="text">
					<input name="password1" type="password" class="textbox" id="password1" size="40" maxlength="40" value="">
				</td>
      </tr>
      <tr>
        <td class="content-label"><?php echo _("Verify Password"); ?>: <br>          </td>
        <td class="text">
					<input name="password2" type="password" class="textbox" id="password2" size="40" maxlength="40" value="">
				</td>
      </tr>
    </table>
            <input name="id" type="hidden" id="id" value="<?php echo $id; ?>"></td>
  </tr>
  <tr>
    <td align="left"><input name="Save" type="submit" class="text" id="Save" value="<?php echo _("Save"); ?>">
    <input name="Reset" type="reset" class="text" id="Reset" value="<?php echo _("Reset"); ?>"></td>
    <td align="right"><input name="Delete" type="submit" class="text" id="Delete" value="<?php echo _("Delete"); ?>"></td>
  </tr>
</table>
</form>
<?php } ?> 