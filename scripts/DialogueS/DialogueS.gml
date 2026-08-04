// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dialogue() constructor { // Internal storage for the dialogues

    _dialogs = []; 

    add = function(_sprite, _message) { // add ne dialogue
        array_push(_dialogs, { // Push to the end of the array
            sprite: _sprite, // use sprite for the dialogue
            message: _message // store the message for the dialogue 
        });
    }

    pop = function() { // remove and return first dialogue in the queue 
        if (array_length(_dialogs) > 0) { // Checks if there is any dialogue in the array
            var _t = _dialogs[0]; // Get the first element
            array_delete(_dialogs, 0, 1);  // Delete the first element
            return _t;
        } else {
            return undefined; // Or another appropriate value
        }
    }

    count = function() { // Count number of dialogues in queue
        return array_length(_dialogs);
    }
}
