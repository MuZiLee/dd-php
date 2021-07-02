
//设置图片宽高
// 宽高比为1:1
$(function(){
	var img_w=$("._picbox_w_h img").width()
	$("._picbox_w_h img").css("height",img_w)

	var img_w01=$("._picbox_w_h1 img").width()
	$("._picbox_w_h1 img").css("height",img_w01)
})

// 宽高比为2:3
$(function(){
	var img_w3=$("._picbox_w3_h2 img").width()
	var img_h2=img_w3*2/3
	$("._picbox_w3_h2 img").css("height",img_h2)

	var img_w3_01=$("._picbox_w3_h2_1 img").width()
	var img_h2_01=img_w3_01*2/3
	$("._picbox_w3_h2_1 img").css("height",img_h2_01)
})