if (room == R3 && place_meeting(x, y, OPlayer)) {
    room_goto(R3Cave);
} else if (room == R3Cave && place_meeting(x, y, OPlayer)) {
    room_goto(R3);
}
