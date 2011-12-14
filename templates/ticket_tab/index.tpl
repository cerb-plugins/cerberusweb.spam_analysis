<table cellpadding="5" cellspacing="0" border="0">
<tr>
<td style="padding-right:20px;" valign="top">
	<h2>{$translate->_('spamanalysis.ui.analysis.original')|capitalize}</h2>
	{if !empty($words)}
	<table cellspacing="0" cellpadding="3" border="0">
		<tr>
			<td><b>{$translate->_('spamanalysis.ui.word')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.probability')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.num_spam')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.num_nonspam')|capitalize}</b></td>
		</tr>
	{foreach from=$words item=word}
		<tr>
		<td style="margin-bottom:5px;padding-right:20px;">
			<span style="{if $word->probability >= 0.80}background-color: rgb(255, 235, 235);color:rgb(175,0,0);font-weight:bold;{elseif $word->probability <= 0.20}background-color:rgb(235, 255, 235);color:rgb(0,175,0);font-weight:bold;{else}{/if}">{$word->word}</span>
		</td>
		<td>
			{math equation="(x*100)" x=$word->probability format="%0.2f"}%
		</td>
		<td>
			{$word->spam}
		</td>
		<td>
			{$word->nonspam}
		</td>
		</tr>
	{/foreach}
	</table>
	{else}
		{$translate->_('spamanalysis.ui.no_data')}
	{/if}
</td>

<td style="padding-left:20px;border-left:1px solid rgb(230,230,230);" valign="top">
	<h2>{$translate->_('spamanalysis.ui.analysis.live')|capitalize} ({math equation="x*100" x=$analysis.probability format="%0.2f"}%)</h2>
	{if !empty($analysis.words)}
	<table cellspacing="0" cellpadding="3" border="0">
		<tr>
			<td><b>{$translate->_('spamanalysis.ui.word')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.probability')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.num_spam')|capitalize}</b></td>
			<td><b>{$translate->_('spamanalysis.ui.num_nonspam')|capitalize}</b></td>
		</tr>
	{foreach from=$analysis.words item=word}
		<tr>
		<td style="margin-bottom:5px;padding-right:20px;">
			<span style="{if $word->probability >= 0.80}background-color: rgb(255, 235, 235);color:rgb(175,0,0);font-weight:bold;{elseif $word->probability <= 0.20}background-color:rgb(235, 255, 235);color:rgb(0,175,0);font-weight:bold;{else}{/if}">{$word->word}</span>
		</td>
		<td>
			{math equation="(x*100)" x=$word->probability format="%0.2f"}%
		</td>
		<td>
			{$word->spam}
		</td>
		<td>
			{$word->nonspam}
		</td>
		</tr>
	{/foreach}
	</table>
	{else}
		{$translate->_('spamanalysis.ui.not_enough_data')}
	{/if}
</td>
</tr>
</table>