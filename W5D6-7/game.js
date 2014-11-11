var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

canvas.width = 800;
canvas.height = 600;

var mySprite = {
	x: 200,
	y: 200,
	width: 50,
	height: 50,
	speed: 200,
	color: '#c00'
};

function update(mod) {
	if (37 in keysDown) { //left
		mySprite.x -= mySprite.speed * mod;
	}
	if (38 in keysDown) { //up
		mySprite.y -= mySprite.speed * mod;
	}
	if (39 in keysDown) { //right
		mySprite.x += mySprite.speed * mod;
	}
	if (40 in keysDown) { //down
		mySprite.y += mySprite.speed * mod;
	}
}

function render() {
	ctx.fillStyle = '#000';
	ctx.fillRect(0, 0, canvas.width, canvas.height);
	

	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(50, 60, 50, 250);
	ctx.fillStyle = '#c0c';
	ctx.fillRect(50, 110, 200, 50);
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(300, 10, 200, 50);
	ctx.fillStyle = '#c0c';
	ctx.fillRect(300, 60, 50, 250);
	ctx.fillStyle = '#c0c';
	ctx.fillRect(300, 260, 200, 50);
	
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(550, 10, 200, 50);
	ctx.fillStyle = '#c0c';
	ctx.fillRect(550, 60, 50, 250);
	ctx.fillStyle = '#c0c';
	ctx.fillRect(550, 260, 200, 50);
	
	
	ctx.fillStyle = mySprite.color;
	ctx.fillRect(mySprite.x, mySprite.y, mySprite.width, mySprite.height);
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(50, 10, 200, 50);
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(200, 60, 50, 50);
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(450, 60, 50, 250);
	
	ctx.fillStyle = '#c0c';
	ctx.fillRect(700, 60, 50, 250);
}

function run() {
	update((Date.now() - time) / 1000);
	render();
	time = Date.now();
}

var time = Date.now();
setInterval(run, 10);

var keysDown = {};
window.addEventListener('keydown', function(e) {
	keysDown[e.keyCode] = true;
});
window.addEventListener('keyup', function(e) {
	delete keysDown[e.keyCode];
});