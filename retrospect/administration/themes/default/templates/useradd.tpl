{if $SAVED}
	<div class="content-title">User Manager</div>
	<p><i>{if $SAVED.fullname}{$SAVED.fullname}{else}{$SAVED.username}{/if}</i> has been added to the user database.</p>
	<p>Click <a href="{$PHP_SELF}?m=usermgr">HERE</a> to return to the User Manager.</p>
	<p>Click <a href="{$PHP_SELF}">HERE</a> to return to the main administration page.</p>
{else}
<form name="useraddform" action="{$PHP_SELF}?m=useradd" method="post">
<div class="content-title">User Manager</div>
<table class="tab-row" cellpadding="0" cellspacing="0">
	<tr>
		<td class="tab"><a href="{$PHP_SELF}?m=usermgr">List Users</a></td>
		<td class="tab-selected">Add User</td>
		<td class="tab"><a href="{$PHP_SELF}?m=useredit">Edit User</a></td>
		<td class="tab-last">&nbsp;</td>
	</tr>
</table>
<div class="tab-page">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td class="cfg-lbl"><label for="username">Username:</label></td>
			<td class="cfg-opt"><input name="username" class="textbox" maxlength="16" value="{$smarty.post.username|escape}" /></td>
			<td class="cfg-err">
				{validate field="username" criteria="notEmpty" transform="trim" message="YOU MUST ENTER A USERNAME"}
				{validate field="username" criteria="isLength" transform="trim" min="4" max="16" message="USERNAMES MUST BE BETWEEN 4 AND 16 CHARACTERS LONG"}
				{validate field="username" criteria="isRegExp" expression="/^[a-z0-9]+$/" message="USERNAMES CAN ONLY CONTAIN ALPHANUMERIC CHARACTERS"}
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="fullname">Full Name:</label></td>
			<td class="cfg-opt"><input name="fullname" class="textbox" size="40" maxlength="100" value="{$smarty.post.fullname|escape}" /></td>
			<td class="cfg-err">
				{validate field="fullname" criteria="notEmpty" transform="trim" message="YOU MUST ENTER A FULL NAME"}
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="group">Group:</label></td>
			<td class="cfg-opt">
				<select name="group" class="listbox">
					{html_options options=$groups}
				</select>
			</td>
			<td class="cfg-err">&nbsp;</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="email">Email:</label></td>
			<td class="cfg-opt"><input name="email" class="textbox" maxlength="100" value="{$smarty.post.email|escape}" /></td>
			<td class="cfg-err">
				{validate field="email" criteria="notEmpty" transform="trim" message="YOU MUST ENTER AN EMAIL ADDRESS"}
				{validate field="email" criteria="isEmail" transform="trim" message="THE EMAIL ADDRESS YOU ENTERED IS NOT VALID"}
			</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="password1">New Password:</label></td>
			<td class="cfg-opt"><input name="password1" type="password" class="textbox" maxlength="16" value="{$smarty.post.password1|escape}" /></td>
			<td class="cfg-err">
				{validate field="password1" criteria="notEmpty" transform="trim" message="YOU MUST ENTER A PASSWORD"}
				{validate field="password1" criteria="isEqual" field2="password2" transform="trim" message="PASSWORDS DO NOT MATCH - PLEASE RE-TYPE THEM"}
				{validate field="password1" criteria="isLength" transform="trim" min="4" max="16" message="PASSWORDS MUST BE BETWEEN 4 AND 16 CHARACTERS LONG"}
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="password2">Verify Password:</label></td>
			<td class="cfg-opt"><input name="password2" type="password" class="textbox" maxlength="16" value="{$smarty.post.password2|escape}" /></td>
			<td class="cfg-err">
				{validate field="password2" criteria="notEmpty" transform="trim" message="YOU MUST VERIFY THE PASSWORD"}
				{validate field="password2" criteria="isLength" transform="trim" min="4" max="16" message="PASSWORDS MUST BE BETWEEN 4 AND 16 CHARACTERS LONG"}
				&nbsp;
			</td>
		</tr>
		<tr>
			<td class="cfg-lbl"><label for="enabled">Account Enabled:</label></td>
			<td class="cfg-opt"><input class="checkbox" name="enabled" type="checkbox" value="1" checked></td>
			<td class="cfg-err">&nbsp;</td>
		</tr>
	</table>
</div>
<br />
	<input name="Save" type="submit" class="text" id="Save" value="Save"> 
	<input name="Cancel" type="button" class="text" value="Cancel" onclick="document.location='{$PHP_SELF}?m=usermgr';">
</form>
{/if}