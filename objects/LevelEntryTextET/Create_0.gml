	global.levelTitle = noone; // The titles dont exist initially
	global.levelTitleTimer = 0; // Tracks timer of the title
	global.levelTitleAlpha = 0; // Initially invisible
	global.fadeInSpeed = 0.0075; // Uses this speed to  fade in
	global.fadeOutSpeed = 0.015; // Uses this speed to fade out

	global.levelTitleXOffset = 53; // 53 pixels to the right to be positioned correctly

	global.enemyDefeatSprite = EnemyDefeat; // The warning message if all enemies arent defeated
	global.enemyDefeatAlpha = 0; // Initially invisible
	global.enemyDefeatTimer = 0; // Tracks timer of the message

	global.exilionDisplay = noone; // The display for Exilion doesn’t exist initially
	global.exilionDisplayTimer = 0; // Tracks the timer for displaying Exilion info
	global.exilionDisplayAlpha = 0; // Initially invisible
	global.exilionDisplaySprite = ExilionDisplay; // The sprite to display for Exilion info