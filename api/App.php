<?php
/***********************************************************************
| Cerb(tm) developed by Webgroup Media, LLC.
|-----------------------------------------------------------------------
| All source code & content (c) Copyright 2002-2016, Webgroup Media LLC
|   unless specifically noted otherwise.
|
| This source code is released under the Devblocks Public License.
| The latest version of this license can be found here:
| http://cerb.io/license
|
| By using this software, you acknowledge having read this license
| and agree to be bound thereby.
| ______________________________________________________________________
|	http://cerb.io	    http://webgroup.media
***********************************************************************/

if (class_exists('Extension_ContextProfileTab')):
class ChSpamAnalysisTicketTab extends Extension_ContextProfileTab {
	function showTab($context, $context_id) {
		if(0 != strcasecmp($context, CerberusContexts::CONTEXT_TICKET))
			return;
		
		@$ticket_id = $context_id;
		
		$tpl = DevblocksPlatform::getTemplateService();

		$ticket = DAO_Ticket::get($ticket_id);
		$tpl->assign('ticket_id', $ticket_id);
		$tpl->assign('ticket', $ticket);
		
		// Receate the original spam decision
		$words = DevblocksPlatform::parseCsvString($ticket->interesting_words);
		$words = DAO_Bayes::lookupWordIds($words);

		// Calculate word probabilities
		foreach($words as $idx => $word) { /* @var $word Model_BayesWord */
			$word->probability = CerberusBayes::calculateWordProbability($word);
		}
		$tpl->assign('words', $words);
		
		// Determine what the spam probability would be if the decision was made right now
		$analysis = CerberusBayes::calculateTicketSpamProbability($ticket_id, true);
		$tpl->assign('analysis', $analysis);
		
		$tpl->display('devblocks:cerberusweb.spam_analysis::ticket_tab/index.tpl');
	}
};
endif;
