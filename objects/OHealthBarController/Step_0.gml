followUpTimer = clamp(followUpTimer - 1, 0, followUpTimerMax);

if (followUpTimer == 0) 
healthPointsPrev = lerp(healthPointsPrev,healthPoints,0.2);





