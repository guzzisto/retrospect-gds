<!-- 
/**
*	Nav sub-template
* $Id$
*/
-->
<table class="tab-row" cellpadding="0" cellspacing="0">
	<tr>
		{if $module=="surnames"}
			<td class="tab-selected">{$surname_title}</td>
		{else}
			<td class="tab">
				<a href="?m=surnames&amp;sn={$indiv->sname}">{$surname_title}</a>
			</td>
		{/if}
		{if $module=="family"}
			<td class="tab-selected">{php}t("Family"){/php}</td>
		{else}
			<td class="tab">
				<a href="?m=family&amp;id={$indiv->indkey}">{php}t("Family"){/php}</a>
			</td>
		{/if}
		{if $module=="pedigree"}
			<td class="tab-selected">{php}t("Pedigree"){/php}</td>
		{else}
			<td class="tab">
				<a href="?m=pedigree&amp;id={$indiv->indkey}">{php}t("Pedigree"){/php}</a>
			</td>
		{/if}
		{if $module=="reports"}
			<td class="tab-selected">{php}t("Reports"){/php}</td>
		{elseif $module=="ahnentafel" or $module=="descendant"}
			<td class="tab-selected">
				<a href="?m=reports&amp;id={$indiv->indkey}">{php}t("Reports"){/php}</a>
			</td>
		{else}
			<td class="tab">
				<a href="?m=reports&amp;id={$indiv->indkey}">{php}t("Reports"){/php}</a>
			</td>
		{/if}
		{if $gallery_plugin}
			{if $module=="multimedia"}
				<td class="tab-selected">{php}t("Multimedia"){/php}</td>
			{else}
				<td class="tab">
					<a href="{$media_link}">{php}t("Multimedia"){/php} ({$media_count})</a>
				</td>
			{/if}
		{/if}
		{if $allow_comments}
			{if $module=="comments" or $module=="commentadd"}
				<td class="tab-selected">{php}t("Comments"){/php} ({$comment_count})</td>
			{else}
				<td class="tab">
					<a href="?m=comments&amp;id={$indiv->indkey}">{php}t("Comments"){/php} ({$comment_count})</a>
				</td>
			{/if}
		{/if}
		<td class="tab-last">&nbsp;</td>
	</tr>
</table>