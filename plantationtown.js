$(function() {
    var backgroundAnim = new gf.animation({
        url : "farm.png"
    });

    var npcAnim = new gf.animation({
        url : "npc.png"
    });

    var flag = 0;

    var initialize = function() {
        $("#game").append("<div id='container' style='display: none; width: 1280px; height: 720px;'>");
        gf.addSprite("container","background",{width: 1280, height: 720});
        gf.addSprite("container","npc",{width: 32, height: 32, x: 288, y: 224});

        gf.setAnimation("background", backgroundAnim);
        gf.setAnimation("npc", npcAnim);


        $("#container").css("display", "block");
        setInterval(gameLoop, 125);
    }
    
	
	/* DO NOT EDIT ANYTHING BETWEEN THESE COMMENTS. */
	
    var screenWidth = 1280;

    var npc = {
        xpos: 64,
        ypos: 0,
        speed: 8
    }

    var walktime = Math.floor(Math.random()*16 + 4);
    var waittime;
    var stepsleft = walktime;
    var wandered = 0;

    var gameLoop = function() {
        if (stepsleft != 0 && !wandered) {
            wander();
            if (walktime%4 == 0 && gf.y("npc") != 720-32)
                gf.y("npc", gf.y("npc") + npc.speed);
            else if (walktime%4 == 1)
                gf.x("npc", gf.x("npc") - npc.speed); 
            else if (walktime%4 == 2)
                gf.y("npc", gf.y("npc") - npc.speed); 
            else if (walktime%4 == 3 && gf.x("npc") != 1280-32)
                gf.x("npc", gf.x("npc") + npc.speed);
        }
        else {
            if (wandered == 0) {
                npc.xpos = 64;
                waittime = Math.floor(Math.random()*8 + 4);
            }
            wandered++;
            if (wandered > walktime*waittime) {
                walktime = Math.floor(Math.random()*16 + 4);
                stepsleft = walktime;
                wandered = 0;
            }
        }
        $("#npc").css("background-position",""+ npc.xpos +"px "+ npc.ypos +"px");
    }

    var walkDown = function() {
        npc.ypos = 0;
        walk();
    }
    var walkLeft = function() {
        npc.ypos = 96;
        walk();
    }
    var walkUp = function() {
        npc.ypos = 32;
        walk();
    }
    var walkRight = function() {
        npc.ypos = 64;
        walk();
    }

    var walk = function() {
        if (npc.xpos == 0) {
            npc.xpos = 64;
            flag = 0;
        }
        else if (npc.xpos == 32) {
            npc.xpos = 64;
            flag = 1;
        }
        else if (flag == 1) {
            npc.xpos = 0;
        }
        else {
            npc.xpos = 32;
        }
    }

    var wander = function() {
        if (walktime%4 == 0)
            walkDown();
        else if (walktime%4 == 1)
            walkLeft();
        else if (walktime%4 == 2)
            walkUp();
        else
            walkRight();
        stepsleft--;
    }

    /* DO NOT EDIT ANYTHING BETWEEN THESE COMMENTS. */
	
    gf.startPreloading(initialize);
});
