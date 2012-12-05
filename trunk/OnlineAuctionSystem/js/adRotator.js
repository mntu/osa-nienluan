var data = [
	{url:"CTU.png",link:"www.ctu.edu.vn",title:"Đại Học Cần Thơ"},
	{ url: "PayPal.png", link: "www.paypal.com", title: "paypal.com" },
	{ url: "NganLuong.png", link: "www.nganluong.vn", title: "nganluong.vn" }
]; 
var ad_timer = null;
var ad_speed = 1000;
var ad_ID = "";

function randomNumber(m, n)
{
	return (m + Math.floor(Math.random()*(n-m+1)));
}

function adRotate()
{
	index = randomNumber(0, data.length-1);
	var link = document.getElementById(ad_ID);
	var img = document.getElementById(ad_ID + "_img");
	img.src = "images/" + data[index].url;
	img.title = data[index].title;
	link.href = data[index].link;
	ad_timer = setTimeout("adRotate()", ad_speed);
}
function adStopRotate()
{
	clearTimeout(ad_timer);
}

function adRotatorCreate(AdID, speed)
{
	ad_ID = AdID;
	ad_speed = speed;
	adRotate();
}
